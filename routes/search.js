const express = require("express");
const router = express.Router();
const { Course } = require("../models");
const { success } = require("../utils/responses");
const { Op } = require("sequelize");

/**
 * 搜索课程
 * GET /search
 */
router.get("/", async function (req, res) {
  const query = req.query;
  const currentPage = Math.abs(Number(query.currentPage)) || 1;
  const pageSize = Math.abs(Number(query.pageSize)) || 100;
  const offset = (currentPage - 1) * pageSize;

  const condition = {
    where: {},
    attributes: { exclude: ["CategoryId", "UserId", "content"] },
    order: [["id", "DESC"]],
    limit: pageSize,
    offset: offset,
  };

  if (query.name) {
    condition.where.name = {
      [Op.like]: `%${query.name}%`,
    };
  }

  const { count, rows } = await Course.findAndCountAll(condition);
  success(res, "搜索课程成功。", {
    courses: rows,
    pagination: {
      total: count,
      currentPage,
      pageSize,
    },
  });
});

module.exports = router;
