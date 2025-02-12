const { failure } = require("../utils/responses");
// 定义全局错误处理中间件
const globalErrorHandler = (err, req, res, next) => {
  // 错误代码位置
  // console.error(err.stack);
  failure(res, err);
};

module.exports = globalErrorHandler;
