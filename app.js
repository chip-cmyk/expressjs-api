const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
// 引入 express-async-errors 中间件
require("express-async-errors");
const { failure } = require("./utils/response");

const indexRouter = require("./routes/index");
const usersRouter = require("./routes/users");

const adminArtitlesRouter = require("./routes/admin/articles");

const app = express();

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

app.use("/", indexRouter);
app.use("/users", usersRouter);

app.use("/admin/articles", adminArtitlesRouter);
// 模拟一个会抛出异常的路由
app.get("/error", (req, res) => {
  throw new Error("Something went wrong!");
});
// 定义全局错误处理中间件
const globalErrorHandler = (err, req, res, next) => {
  console.error(err, "处理中...");
  failure(res, err);
};

// 注册全局错误处理中间件
app.use(globalErrorHandler);

const port = 3006;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

module.exports = app;
