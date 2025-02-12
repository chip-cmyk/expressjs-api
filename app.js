const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
require("dotenv").config();
// 引入 express-async-errors 中间件
require("express-async-errors");

const globalErrorHandler = require("./middlewares/globalErrorHandler");
const adminAuth = require("./middlewares/admin-auth");

const indexRouter = require("./routes/index");
const usersRouter = require("./routes/users");

const adminArtitlesRouter = require("./routes/admin/articles");
const adminCategoriesRouter = require("./routes/admin/categories");
const adminSettingsRouter = require("./routes/admin/settings");
const adminUsersRouter = require("./routes/admin/users");
const adminCoursesRouter = require("./routes/admin/courses");
const adminChaptersRouter = require("./routes/admin/chapters");
const adminChartsRouter = require("./routes/admin/charts");
const adminAuthRouter = require("./routes/admin/auth");
const categoriesRouter = require("./routes/categories");
const coursesRouter = require("./routes/courses");

const app = express();

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

//token 验证中间件
app.use(adminAuth);

app.use("/", indexRouter);
app.use("/users", usersRouter);

app.use("/admin/articles", adminArtitlesRouter);
app.use("/admin/categories", adminCategoriesRouter);
app.use("/admin/settings", adminSettingsRouter);
app.use("/admin/users", adminUsersRouter);
app.use("/admin/courses", adminCoursesRouter);
app.use("/admin/chapters", adminChaptersRouter);
app.use("/admin/charts", adminChartsRouter);
app.use("/admin/auth", adminAuthRouter);
app.use("/categories", categoriesRouter);
app.use("/courses", coursesRouter);
// 模拟一个会抛出异常的路由
// app.get("/error", (req, res) => {
//   throw new Error("Something went wrong!");
// });
// 注册全局错误处理中间件
app.use(globalErrorHandler);

const port = 3006;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

module.exports = app;
