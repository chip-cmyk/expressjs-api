import globals from "globals";
import pluginJs from "@eslint/js";

/** @type {import('eslint').Linter.Config[]} */
export default [
  { files: ["**/*.js"], languageOptions: { sourceType: "commonjs" } },
  { languageOptions: { globals: { ...globals.browser, ...globals.node } } },
  pluginJs.configs.recommended,
  {
    rules: {
      // 不许多于2个空行
      "no-multiple-empty-lines": ["warn", { max: 2 }],
      "no-var": "warn",
      //未使用的函数参数不警告
      "no-unused-vars": ["warn", { args: "none" }],
      // 不允许使用未定义的变量
      "no-undef": "warn",
    },
  },
];
