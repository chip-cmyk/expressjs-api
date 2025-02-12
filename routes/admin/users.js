const express = require("express");
const router = express.Router();
const { User } = require("../../models");
const { Op } = require("sequelize");
const { success } = require("../../utils/responses");
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

  if (query.email) {
    condition.where.email = query.email;
  }

  if (query.username) {
    condition.where.username = query.username;
  }

  if (query.nickname) {
    condition.where.nickname = {
      [Op.like]: `%${query.nickname}%`,
    };
  }

  if (query.role) {
    condition.where.role = query.role;
  }

  const { count, rows } = await User.findAndCountAll(condition);
  success(res, "获取用户列表成功", {
    users: rows,
    pagination: {
      total: count,
      currentPage,
      pageSize,
    },
  });
});

/**
 * 查询当前登录的用户详情
 * GET /admin/users/me
 */
router.get("/me", async function (req, res) {
  const user = req.user;
  success(res, "查询当前用户信息成功。", { user });
});

router.get("/:id", async (req, res, next) => {
  const user = await getUser(req);
  success(res, "获取用户详情成功", {
    user,
  });
});

router.post("/", async (req, res) => {
  const body = filterBody(req);
  const user = await User.create(body);
  success(
    res,
    "创建用户成功",
    {
      user,
    },
    201
  );
});

router.put("/:id", async (req, res) => {
  const body = filterBody(req);
  const result = await User.update(body, {
    where: {
      id: req.params.id,
    },
  });
  if (result[0] === 0) {
    throw new NotFound(`ID: ${req.params.id} 的用户未找到。`);
  }
  success(res, "更新用户成功");
});

router.delete("/:id", async (req, res) => {
  const result = await User.destroy({
    where: {
      id: req.params.id,
    },
  });
  if (result === 0) {
    throw new NotFound(`ID: ${req.params.id} 的用户未找到。`);
  }
  success(res, "删除用户成功");
});
/**
 * 公共方法：查询当前用户
 */
async function getUser(req) {
  const { id } = req.params;

  const user = await User.findByPk(id);
  if (!user) {
    throw new NotFound(`ID: ${id}的用户未找到。`);
  }

  return user;
}

/**
 * 公共方法：白名单过滤
 * @param req
 * @returns {{password, role: (number|string|*), introduce: ({type: *}|*), sex: ({allowNull: boolean, type: *, validate: {notNull: {msg: string}, notEmpty: {msg: string}, isIn: {args: [number[]], msg: string}}}|{defaultValue: number, allowNull: boolean, type: *}|*), nickname: (string|*), company: ({type: *}|*), avatar: ({type: *, validate: {isUrl: {msg: string}}}|*), email: (string|*), username}}
 */
function filterBody(req) {
  return {
    email: req.body.email,
    username: req.body.username,
    password: req.body.password,
    nickname: req.body.nickname,
    sex: req.body.sex,
    company: req.body.company,
    introduce: req.body.introduce,
    role: req.body.role,
    avatar: req.body.avatar,
  };
}

module.exports = router;
