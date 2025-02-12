const express = require("express");
const router = express.Router();
const { Chapter, Course } = require("../../models");
const { Op } = require("sequelize");
const { success } = require("../../utils/responses");
const { NotFound, BadRequest } = require("http-errors");

router.get("/", async (req, res, next) => {
  const query = req.query;
  const currentPage = Math.abs(parseInt(query.page) || 1);
  const pageSize = Math.abs(parseInt(query.pageSize) || 10);
  const offset = (currentPage - 1) * pageSize;

  if (!query.courseId) {
    throw new BadRequest("获取章节列表失败，课程ID不能为空。");
  }

  const condition = {
    ...getCondition(),
    order: [
      ["rank", "ASC"],
      ["id", "ASC"],
    ],
    limit: pageSize,
    offset: offset,
  };

  condition.where = {
    courseId: {
      [Op.eq]: query.courseId,
    },
  };

  if (query.title) {
    condition.where = {
      title: {
        [Op.like]: `%${query.title}%`,
      },
    };
  }

  const { count, rows } = await Chapter.findAndCountAll(condition);
  success(res, "获取章节列表成功", {
    chapters: rows,
    pagination: {
      total: count,
      currentPage,
      pageSize,
    },
  });
});

router.get("/:id", async (req, res, next) => {
  const chapter = await getChapter(req);
  success(res, "获取章节详情成功", {
    chapter,
  });
});

router.post("/", async (req, res) => {
  const body = filterBody(req);
  const chapter = await Chapter.create(body);
  success(
    res,
    "创建章节成功",
    {
      chapter,
    },
    201
  );
});

router.put("/:id", async (req, res) => {
  const body = filterBody(req);
  const result = await Chapter.update(body, {
    where: {
      id: req.params.id,
    },
  });
  if (result[0] === 0) {
    throw new NotFound(`ID: ${req.params.id} 的章节未找到。`);
  }
  success(res, "更新章节成功");
});

router.delete("/:id", async (req, res) => {
  const result = await Chapter.destroy({
    where: {
      id: req.params.id,
    },
  });
  if (result === 0) {
    throw new NotFound(`ID: ${req.params.id} 的章节未找到。`);
  }
  success(res, "删除章节成功");
});
/**
 * 公共方法：查询当前章节
 */
async function getChapter(req) {
  const { id } = req.params;
  const condition = getCondition();

  const chapter = await Chapter.findByPk(id, condition);
  if (!chapter) {
    throw new NotFound(`ID: ${id}的章节未找到。`);
  }

  return chapter;
}

/**
 * 公共方法：关联课程数据
 * @returns {{include: [{as: string, model, attributes: string[]}], attributes: {exclude: string[]}}}
 */
function getCondition() {
  return {
    attributes: { exclude: ["CourseId"] },
    include: [
      {
        model: Course,
        as: "course",
        attributes: ["id", "name"],
      },
    ],
  };
}

/**
 * 公共方法：白名单过滤
 * @param req
 * @returns {{rank: (number|*), video: (string|boolean|MediaTrackConstraints|VideoConfiguration|*), title, courseId: (number|*), content}}
 */
function filterBody(req) {
  return {
    courseId: req.body.courseId,
    title: req.body.title,
    content: req.body.content,
    video: req.body.video,
    rank: req.body.rank,
  };
}

module.exports = router;
