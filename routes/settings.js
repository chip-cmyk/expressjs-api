const express = require("express");
const router = express.Router();
const { Setting } = require("../models");
const { NotFound } = require("http-errors");
const { success } = require("../utils/responses");

/**
 * 查询系统信息
 * GET /settings
 */
router.get("/", async function (req, res) {
  const setting = await Setting.findOne();
  if (!setting) {
    throw new NotFound("未找到系统设置，请联系管理员。");
  }

  success(res, "查询系统信息成功。", { setting });
});

module.exports = router;
