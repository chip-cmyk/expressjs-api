"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Category extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Category.init(
    {
      name: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: { msg: "名称已存在，请选择其他名称。" },
        validate: {
          len: { args: [2, 45], msg: "长度必须是2 ~ 45之间。" },
        },
      },

      rank: {
        type: DataTypes.INTEGER,
        allowNull: false,
        validate: {
          isInt: { msg: "必须是正整数。" },
          min: { args: [1], msg: "必须是正整数。" },
        },
      },
    },
    {
      sequelize,
      modelName: "Category",
    }
  );
  return Category;
};
