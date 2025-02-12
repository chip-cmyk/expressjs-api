const express = require("express");
const router = express.Router();
const { Setting } = require("../../models");
const { success } = require("../../utils/response");
const { NotFound } = require("http-errors");

/**
 * 查询系统设置详情
 * GET /admin/settings
 */
router.get("/", async function (req, res) {
  const setting = await getSetting();
  success(res, "查询系统设置成功。", { setting });
});

/**
 * 更新系统设置
 * PUT /admin/settings
 */
router.put("/", async function (req, res) {
  const body = filterBody(req);
  const result = await Setting.update(body, { where: { id: 1 } });
  if (result[0] === 0) {
    throw new NotFound("系统设置未找到，请运行种子文件。");
  }
  success(res, "更新系统设置成功。");
});
/**
 * 公共方法：查询当前系统设置
 */
async function getSetting() {
  const setting = await Setting.findOne();
  if (!setting) {
    throw new NotFound("初始系统设置未找到，请运行种子文件。");
  }

  return setting;
}

/**
 * 公共方法：白名单过滤
 * @param req
 * @returns {{copyright: (string|*), icp: (string|string|DocumentFragment|*), name}}
 */
function filterBody(req) {
  return {
    name: req.body.name,
    icp: req.body.icp,
    copyright: req.body.copyright,
  };
}

module.exports = router;
