const express = require("express");
const router = express.Router();
const { Article } = require("../../models");
const { Op } = require("sequelize");
const { NotFoundError, success, failure } = require("../../utils/response");

router.get("/", async (req, res, next) => {
  const query = req.query;
  const currentPage = Math.abs(parseInt(query.page) || 1);
  const pageSize = Math.abs(parseInt(query.pageSize) || 10);
  const offset = (currentPage - 1) * pageSize;

  const condition = {
    order: [["id", "DESC"]],
    limit: pageSize,
    offset,
  };

  if (query.title) {
    condition.where = {
      title: {
        [Op.like]: `%${query.title}%`,
      },
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

/**
 * 公共方法：查询当前文章
 */
async function getArticle(req) {
  const { id } = req.params;

  const article = await Article.findByPk(id);
  if (!article) {
    throw new NotFoundError(`ID: ${id}的文章未找到。`);
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
