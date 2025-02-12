const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
const cors = require("cors");

require("dotenv").config();
require("express-async-errors");

// 引入中间件
const globalErrorHandler = require("./middlewares/globalErrorHandler");
const adminAuth = require("./middlewares/admin-auth");
const userAuth = require("./middlewares/user-auth");

// 引入路由
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
const chaptersRouter = require("./routes/chapters");
const articlesRouter = require("./routes/articles");
const settingsRouter = require("./routes/settings");
const searchRouter = require("./routes/search");
const authRouter = require("./routes/auth");
const likesRouter = require("./routes/likes");

const app = express();

// 配置中间件
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));
//token 验证中间件
app.use(adminAuth);
// CORS 跨域配置
const corsOptions = {
  // origin: ["http://localhost:63342", "https://baidu.com"],
  origin: "*",
};
app.use(cors(corsOptions));

// 注册路由
// 后台路由
app.use("/admin/articles", adminArtitlesRouter);
app.use("/admin/categories", adminCategoriesRouter);
app.use("/admin/settings", adminSettingsRouter);
app.use("/admin/users", adminUsersRouter);
app.use("/admin/courses", adminCoursesRouter);
app.use("/admin/chapters", adminChaptersRouter);
app.use("/admin/charts", adminChartsRouter);
app.use("/admin/auth", adminAuthRouter);
// 前台路由
app.use("/", indexRouter);
app.use("/users", userAuth, usersRouter);
app.use("/categories", categoriesRouter);
app.use("/courses", coursesRouter);
app.use("/chapters", chaptersRouter);
app.use("/articles", articlesRouter);
app.use("/settings", settingsRouter);
app.use("/search", searchRouter);
app.use("/auth", authRouter);
app.use("/likes", userAuth, likesRouter);

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
