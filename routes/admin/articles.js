const express = require("express");
const router = express.Router();
const { Article } = require("../../models");
const { Op } = require("sequelize");
const { success } = require("../../utils/response");
const { NotFound } = require("http-errors");

router.get("/", async (req, res, next) => {
  const query = req.query;
  const currentPage = Math.abs(parseInt(query.page) || 1);
  const pageSize = Math.abs(parseInt(query.pageSize) || 10);
  const offset = (currentPage - 1) * pageSize;

  const condition = {
    where: {},
    order: [["id", "DESC"]],
    limit: pageSize,
    offset: offset,
  };

  if (query.title) {
    condition.where.title = {
      [Op.like]: `%${query.title}%`,
    };
  }

  const { count, rows } = await Article.findAndCountAll(condition);
  success(res, "获取文章列表成功", {
    articles: rows,
    pagination: {
      total: count,
      currentPage,
      pageSize,
    },
  });
});

router.get("/:id", async (req, res, next) => {
  const article = await getArticle(req);
  success(res, "获取文章详情成功", {
    article,
  });
});

router.post("/", async (req, res) => {
  const body = filterBody(req);
  const article = await Article.create(body);
  success(
    res,
    "创建文章成功",
    {
      article,
    },
    201
  );
});

router.put("/:id", async (req, res) => {
  const body = filterBody(req);
  const result = await Article.update(body, {
    where: {
      id: req.params.id,
    },
  });
  if (result[0] === 0) {
    throw new NotFound(`ID: ${req.params.id} 的文章未找到。`);
  }
  success(res, "更新文章成功");
});

router.delete("/:id", async (req, res) => {
  const result = await Article.destroy({
    where: {
      id: req.params.id,
    },
  });
  if (result === 0) {
    throw new NotFound(`ID: ${req.params.id} 的文章未找到。`);
  }
  success(res, "删除文章成功");
});
/**
 * 公共方法：查询当前文章
 */
async function getArticle(req) {
  const { id } = req.params;

  const article = await Article.findByPk(id);
  if (!article) {
    throw new NotFound(`ID: ${id}的文章未找到。`);
  }

  return article;
}

/**
 * 公共方法：白名单过滤
 * @param req
 * @returns {{title, content: (string|string|DocumentFragment|*)}}
 */
function filterBody(req) {
  return {
    title: req.body.title,
    content: req.body.content,
  };
}

module.exports = router;
