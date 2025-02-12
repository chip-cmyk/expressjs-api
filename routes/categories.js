const express = require("express");
const router = express.Router();
const { Category } = require("../models");
const { success } = require("../utils/response");

/**
 * 查询分类列表
 * GET /categories
 */
router.get("/", async function (req, res, next) {
  const categories = await Category.findAll({
    order: [
      ["rank", "ASC"],
      ["id", "DESC"],
    ],
  });

  success(res, "查询分类成功。", { categories });
});

module.exports = router;
