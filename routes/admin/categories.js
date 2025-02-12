const express = require("express");
const router = express.Router();
const { Category, Course } = require("../../models");
const { Op } = require("sequelize");
const { success } = require("../../utils/responses");
const { NotFound, Conflict } = require("http-errors");

router.get("/", async (req, res, next) => {
  const query = req.query;
  const currentPage = Math.abs(parseInt(query.page) || 1);
  const pageSize = Math.abs(parseInt(query.pageSize) || 10);
  const offset = (currentPage - 1) * pageSize;

  const condition = {
    order: [
      ["rank", "ASC"],
      ["id", "ASC"],
    ],

    limit: pageSize,
    offset,
  };

  if (query.name) {
    condition.where = {
      name: {
        [Op.like]: `%${query.name}%`,
      },
    };
  }

  const { count, rows } = await Category.findAndCountAll(condition);
  success(res, "获取文章分类列表成功", {
    categories: rows,
    pagination: {
      total: count,
      currentPage,
      pageSize,
    },
  });
});

router.get("/:id", async (req, res, next) => {
  const category = await getCategory(req);
  success(res, "获取文章分类详情成功", {
    category,
  });
});

router.post("/", async (req, res) => {
  const body = filterBody(req);
  const category = await Category.create(body);
  success(
    res,
    "创建文章分类成功",
    {
      category,
    },
    201
  );
});

router.put("/:id", async (req, res) => {
  const body = filterBody(req);
  const result = await Category.update(body, {
    where: {
      id: req.params.id,
    },
  });
  if (result[0] === 0) {
    throw new NotFound(`ID: ${req.params.id} 的文章分类未找到。`);
  }
  success(res, "更新文章分类成功");
});

router.delete("/:id", async (req, res) => {
  const count = await Course.count({ where: { categoryId: req.params.id } });
  if (count > 0) {
    throw new Conflict("当前分类有课程，无法删除。");
  }
  const result = await Category.destroy({
    where: {
      id: req.params.id,
    },
  });
  if (result === 0) {
    throw new NotFound(`ID: ${req.params.id} 的文章分类未找到。`);
  }
  success(res, "删除文章分类成功");
});
/**
 * 公共方法：查询当前文章分类
 */
async function getCategory(req) {
  const { id } = req.params;

  const category = await Category.findByPk(id);
  if (!category) {
    throw new NotFound(`ID: ${id}的文章分类未找到。`);
  }

  return category;
}

/**
 * 公共方法：白名单过滤
 * @param req
 * @returns {{name, rank}}
 */
function filterBody(req) {
  return {
    name: req.body.name,
    rank: req.body.rank,
  };
}

module.exports = router;
