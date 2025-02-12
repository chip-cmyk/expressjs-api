const express = require("express");
const router = express.Router();
const { Course } = require("../../models");
const { Op } = require("sequelize");
const { success } = require("../../utils/response");
const { NotFound } = require("http-errors");

router.get("/", async (req, res, next) => {
  const query = req.query;
  const currentPage = Math.abs(parseInt(query.page) || 1);
  const pageSize = Math.abs(parseInt(query.pageSize) || 10);
  const offset = (currentPage - 1) * pageSize;

  const condition = {
    ...getCondition(),
    where: {},
    order: [["id", "DESC"]],
    limit: pageSize,
    offset: offset,
  };

  if (query.categoryId) {
    condition.where.categoryId = query.categoryId;
  }

  if (query.userId) {
    condition.where.userId = query.userId;
  }

  if (query.name) {
    condition.where.name = {
      [Op.like]: `%${query.name}%`,
    };
  }

  if (query.recommended) {
    condition.where.recommended = query.recommended === "true";
  }

  if (query.introductory) {
    condition.where.introductory = query.introductory === "true";
  }

  const { count, rows } = await Course.findAndCountAll(condition);
  success(res, "获取课程列表成功", {
    courses: rows,
    pagination: {
      total: count,
      currentPage,
      pageSize,
    },
  });
});

router.get("/:id", async (req, res, next) => {
  const course = await getCourse(req);
  success(res, "获取课程详情成功", {
    course,
  });
});

router.post("/", async (req, res) => {
  const body = filterBody(req);
  const course = await Course.create(body);
  success(
    res,
    "创建课程成功",
    {
      course,
    },
    201
  );
});

router.put("/:id", async (req, res) => {
  const body = filterBody(req);
  const result = await Course.update(body, {
    where: {
      id: req.params.id,
    },
  });
  if (result[0] === 0) {
    throw new NotFound(`ID: ${req.params.id} 的课程未找到。`);
  }
  success(res, "更新课程成功");
});

router.delete("/:id", async (req, res) => {
  const result = await Course.destroy({
    where: {
      id: req.params.id,
    },
  });
  if (result === 0) {
    throw new NotFound(`ID: ${req.params.id} 的课程未找到。`);
  }
  success(res, "删除课程成功");
});
/**
 * 公共方法：查询当前课程
 */
async function getCourse(req) {
  const { id } = req.params;

  const course = await Course.findByPk(id);
  if (!course) {
    throw new NotFound(`ID: ${id}的课程未找到。`);
  }

  return course;
}

/**
 * 公共方法：白名单过滤
 * @param req
 * @returns {{image: *, name, introductory: (boolean|*), userId: (number|*), categoryId: (number|*), content, recommended: (boolean|*)}}
 */
function filterBody(req) {
  return {
    categoryId: req.body.categoryId,
    userId: req.body.userId,
    name: req.body.name,
    image: req.body.image,
    recommended: req.body.recommended,
    introductory: req.body.introductory,
    content: req.body.content,
  };
}

/**
 * 公共方法：获取查询条件
 * @returns {{}}
 */
function getCondition() {
  return {};
}

module.exports = router;
