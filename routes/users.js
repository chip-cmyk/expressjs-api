const express = require("express");
const router = express.Router();
const { User } = require("../models");
const { success } = require("../utils/responses");
const { BadRequest, NotFound } = require("http-errors");
const bcrypt = require("bcryptjs");

/**
 * 查询当前登录用户详情
 * GET /users/me
 */
router.get("/me", async function (req, res) {
  const user = await getUser(req);
  success(res, "查询当前用户信息成功。", { user });
});

/**
 * 公共方法：查询当前用户
 */
/**
 * 公共方法：查询当前用户
 * @param req
 * @param showPassword
 * @returns {Promise<Model<any, TModelAttributes>>}
 */
async function getUser(req, showPassword = false) {
  const id = req.userId;

  let condition = {};
  if (!showPassword) {
    condition = {
      attributes: { exclude: ["password"] },
    };
  }

  const user = await User.findByPk(id, condition);
  if (!user) {
    throw new NotFound(`ID: ${id}的用户未找到。`);
  }

  return user;
}

/**
 * 更新用户信息
 * PUT /users/info
 */
router.put("/info", async function (req, res) {
  const allowedFields = ["nickname", "sex", "company", "introduce", "avatar"];
  const body = {};

  // 遍历 req.body 中的所有属性，仅在属性不为空时才添加到 body 对象中
  for (const field of allowedFields) {
    if (req.body[field]) {
      body[field] = req.body[field];
    }
  }
  const user = await getUser(req);
  await user.update(body);
  success(res, "更新用户信息成功。", { user });
});

/**
 * 更新账户信息
 * PUT /users/account
 */
router.put("/account", async function (req, res) {
  const body = {
    email: req.body.email,
    username: req.body.username,
    currentPassword: req.body.currentPassword,
    password: req.body.password,
    passwordConfirmation: req.body.passwordConfirmation,
  };

  if (!body.currentPassword) {
    throw new BadRequest("当前密码必须填写。");
  }

  if (body.password !== body.passwordConfirmation) {
    throw new BadRequest("两次输入的密码不一致。");
  }

  // 加上 true 参数，可以查询到加密后的密码
  const user = await getUser(req, true);

  // 验证当前密码是否正确
  const isPasswordValid = bcrypt.compareSync(
    body.currentPassword,
    user.password
  );
  if (!isPasswordValid) {
    throw new BadRequest("当前密码不正确。");
  }

  //新密码与当前密码是否相同
  if (bcrypt.compareSync(body.password, user.password)) {
    throw new BadRequest("新密码不能与当前密码相同。");
  }

  await user.update(body);

  // 删除密码
  delete user.dataValues.password;
  success(res, "更新账户信息成功。", { user });
});

module.exports = router;
