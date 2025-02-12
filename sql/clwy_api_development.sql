/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80012 (8.0.12)
 Source Host           : localhost:3306
 Source Schema         : clwy_api_development

 Target Server Type    : MySQL
 Target Server Version : 80012 (8.0.12)
 File Encoding         : 65001

 Date: 13/02/2025 00:21:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES (1, '文章的标题 1', '文章的内容 1', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (2, '文章的标题 2', '文章的内容 2', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (3, '文章的标题 3', '文章的内容 3', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (4, '文章的标题 4', '文章的内容 4', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (5, '文章的标题 5', '文章的内容 5', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (6, '文章的标题 6', '文章的内容 6', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (7, '文章的标题 7', '文章的内容 7', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (8, '文章的标题 8', '文章的内容 8', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (9, '文章的标题 9', '文章的内容 9', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (10, '文章的标题 10', '文章的内容 10', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (11, '文章的标题 11', '文章的内容 11', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (12, '文章的标题 12', '文章的内容 12', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (13, '文章的标题 13', '文章的内容 13', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (14, '文章的标题 14', '文章的内容 14', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (15, '文章的标题 15', '文章的内容 15', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (16, '文章的标题 16', '文章的内容 16', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (17, '文章的标题 17', '文章的内容 17', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (18, '文章的标题 18', '文章的内容 18', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (19, '文章的标题 19', '文章的内容 19', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (20, '文章的标题 20', '文章的内容 20', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (21, '文章的标题 21', '文章的内容 21', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (22, '文章的标题 22', '文章的内容 22', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (23, '文章的标题 23', '文章的内容 23', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (24, '文章的标题 24', '文章的内容 24', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (25, '文章的标题 25', '文章的内容 25', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (26, '文章的标题 26', '文章的内容 26', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (27, '文章的标题 27', '文章的内容 27', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (28, '文章的标题 28', '文章的内容 28', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (29, '文章的标题 29', '文章的内容 29', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (30, '文章的标题 30', '文章的内容 30', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (31, '文章的标题 31', '文章的内容 31', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (32, '文章的标题 32', '文章的内容 32', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (33, '文章的标题 33', '文章的内容 33', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (34, '文章的标题 34', '文章的内容 34', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (35, '文章的标题 35', '文章的内容 35', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (36, '文章的标题 36', '文章的内容 36', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (37, '文章的标题 37', '文章的内容 37', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (38, '文章的标题 38', '文章的内容 38', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (39, '文章的标题 39', '文章的内容 39', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (40, '文章的标题 40', '文章的内容 40', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (41, '文章的标题 41', '文章的内容 41', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (42, '文章的标题 42', '文章的内容 42', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (43, '文章的标题 43', '文章的内容 43', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (44, '文章的标题 44', '文章的内容 44', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (45, '文章的标题 45', '文章的内容 45', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (46, '文章的标题 46', '文章的内容 46', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (47, '文章的标题 47', '文章的内容 47', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (48, '文章的标题 48', '文章的内容 48', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (49, '文章的标题 49', '文章的内容 49', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (50, '文章的标题 50', '文章的内容 50', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (51, '文章的标题 51', '文章的内容 51', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (52, '文章的标题 52', '文章的内容 52', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (53, '文章的标题 53', '文章的内容 53', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (54, '文章的标题 54', '文章的内容 54', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (55, '文章的标题 55', '文章的内容 55', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (56, '文章的标题 56', '文章的内容 56', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (57, '文章的标题 57', '文章的内容 57', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (58, '文章的标题 58', '文章的内容 58', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (59, '文章的标题 59', '文章的内容 59', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (60, '文章的标题 60', '文章的内容 60', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (61, '文章的标题 61', '文章的内容 61', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (62, '文章的标题 62', '文章的内容 62', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (63, '文章的标题 63', '文章的内容 63', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (64, '文章的标题 64', '文章的内容 64', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (65, '文章的标题 65', '文章的内容 65', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (66, '文章的标题 66', '文章的内容 66', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (67, '文章的标题 67', '文章的内容 67', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (68, '文章的标题 68', '文章的内容 68', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (69, '文章的标题 69', '文章的内容 69', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (70, '文章的标题 70', '文章的内容 70', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (71, '文章的标题 71', '文章的内容 71', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (72, '文章的标题 72', '文章的内容 72', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (73, '文章的标题 73', '文章的内容 73', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (74, '文章的标题 74', '文章的内容 74', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (75, '文章的标题 75', '文章的内容 75', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (76, '文章的标题 76', '文章的内容 76', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (77, '文章的标题 77', '文章的内容 77', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (78, '文章的标题 78', '文章的内容 78', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (79, '文章的标题 79', '文章的内容 79', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (80, '文章的标题 80', '文章的内容 80', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (81, '文章的标题 81', '文章的内容 81', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (82, '文章的标题 82', '文章的内容 82', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (83, '文章的标题 83', '文章的内容 83', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (84, '文章的标题 84', '文章的内容 84', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (85, '文章的标题 85', '文章的内容 85', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (86, '文章的标题 86', '文章的内容 86', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (87, '文章的标题 87', '文章的内容 87', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (88, '文章的标题 88', '文章的内容 88', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (89, '文章的标题 89', '文章的内容 89', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (90, '文章的标题 90', '文章的内容 90', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (91, '文章的标题 91', '文章的内容 91', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (92, '文章的标题 92', '文章的内容 92', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (93, '文章的标题 93', '文章的内容 93', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (94, '文章的标题 94', '文章的内容 94', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (95, '文章的标题 95', '文章的内容 95', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (96, '文章的标题 96', '文章的内容 96', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (97, '文章的标题 97', '文章的内容 97', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (98, '文章的标题 98', '文章的内容 98', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (99, '文章的标题 99', '文章的内容 99', '2025-02-11 16:25:19', '2025-02-11 16:25:19');
INSERT INTO `articles` VALUES (100, '真好', '明天呢', '2025-02-11 16:25:19', '2025-02-11 20:28:23');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rank` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, '前端开发', 1, '2025-02-12 13:16:34', '2025-02-12 13:16:34');
INSERT INTO `categories` VALUES (2, '后端开发', 2, '2025-02-12 13:16:34', '2025-02-12 13:16:34');
INSERT INTO `categories` VALUES (3, '移动端开发', 3, '2025-02-12 13:16:34', '2025-02-12 13:16:34');
INSERT INTO `categories` VALUES (4, '数据库', 4, '2025-02-12 13:16:34', '2025-02-12 13:16:34');
INSERT INTO `categories` VALUES (5, '服务器运维', 5, '2025-02-12 13:16:34', '2025-02-12 13:16:34');
INSERT INTO `categories` VALUES (6, '公共', 6, '2025-02-12 13:16:34', '2025-02-12 13:16:34');
INSERT INTO `categories` VALUES (8, '公共1', 7, '2025-02-12 14:07:37', '2025-02-12 14:17:04');
INSERT INTO `categories` VALUES (9, '', 7, '2025-02-12 14:08:32', '2025-02-12 14:29:31');

-- ----------------------------
-- Table structure for chapters
-- ----------------------------
DROP TABLE IF EXISTS `chapters`;
CREATE TABLE `chapters`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `courseId` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rank` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `chapters_course_id`(`courseId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chapters
-- ----------------------------
INSERT INTO `chapters` VALUES (1, 1, 'CSS 课程介绍', 'CSS的全名是层叠样式表。官方的解释，我就不细说了，因为就算细说了，对新手朋友们来说，听得还是一脸懵逼。那我们就用最通俗的说法来讲，到底啥是CSS？', '', 1, '2025-02-12 18:20:50', '2025-02-12 18:20:50');
INSERT INTO `chapters` VALUES (2, 2, 'Node.js 课程介绍', '这套课程，定位是使用 JS 来全栈开发项目。让我们一起从零基础开始，学习接口开发。先从最基础的项目搭建、数据库的入门，再到完整的真实项目开发，一步步的和大家一起完成一个真实的项目。', '', 1, '2025-02-12 18:20:50', '2025-02-12 18:20:50');
INSERT INTO `chapters` VALUES (3, 2, '安装 Node.js', '安装Node.js，最简单办法，就是直接在官网下载了安装。但这种方法，却不是最好的办法。因为如果需要更新Node.js的版本，那就需要把之前的卸载了，再去下载安装其他版本，这样就非常的麻烦了。', '', 2, '2025-02-12 18:20:50', '2025-02-12 18:20:50');
INSERT INTO `chapters` VALUES (4, 1, '你好世界', '今天天气怎么样', NULL, 3, '2025-02-12 19:00:46', '2025-02-12 19:02:04');

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `categoryId` int(10) UNSIGNED NOT NULL,
  `userId` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `recommended` tinyint(1) NOT NULL DEFAULT 0,
  `introductory` tinyint(1) NOT NULL DEFAULT 0,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `likesCount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `chaptersCount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_category_id`(`categoryId` ASC) USING BTREE,
  INDEX `courses_user_id`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES (1, 1, 1, 'CSS 入门', NULL, 1, 1, NULL, 2, 2, '2025-02-12 17:51:30', '2025-02-12 23:43:19');
INSERT INTO `courses` VALUES (2, 2, 1, 'Node.js 项目实践（2024 版）', NULL, 1, 0, NULL, 0, 2, '2025-02-12 17:51:30', '2025-02-12 17:51:30');
INSERT INTO `courses` VALUES (3, 1, 1, '认识CSS', NULL, 0, 0, NULL, 0, 0, '2025-02-12 18:10:45', '2025-02-13 00:11:13');
INSERT INTO `courses` VALUES (5, 2, 1, '认识Vue', NULL, 0, 0, NULL, 0, 0, '2025-02-12 20:48:30', '2025-02-12 20:48:30');

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `courseId` int(10) UNSIGNED NOT NULL,
  `userId` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `likes_course_id`(`courseId` ASC) USING BTREE,
  INDEX `likes_user_id`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES (2, 1, 1, '2025-02-12 23:42:54', '2025-02-12 23:42:54');
INSERT INTO `likes` VALUES (3, 1, 2, '2025-02-12 23:43:19', '2025-02-12 23:43:19');

-- ----------------------------
-- Table structure for sequelizemeta
-- ----------------------------
DROP TABLE IF EXISTS `sequelizemeta`;
CREATE TABLE `sequelizemeta`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequelizemeta
-- ----------------------------
INSERT INTO `sequelizemeta` VALUES ('20250211081831-create-article.js');
INSERT INTO `sequelizemeta` VALUES ('20250212050726-create-category.js');
INSERT INTO `sequelizemeta` VALUES ('20250212051013-create-user.js');
INSERT INTO `sequelizemeta` VALUES ('20250212051133-create-course.js');
INSERT INTO `sequelizemeta` VALUES ('20250212051205-create-chapter.js');
INSERT INTO `sequelizemeta` VALUES ('20250212051304-create-like.js');
INSERT INTO `sequelizemeta` VALUES ('20250212051323-create-setting.js');
INSERT INTO `sequelizemeta` VALUES ('20250212070004-add-avatar-to-user.js');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `copyright` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, '你好', '粤ICP备XX号-11', '© 2025 All Rights Reserved.', '2025-02-12 14:39:23', '2025-02-12 14:57:17');

-- ----------------------------
-- Table structure for username
-- ----------------------------
DROP TABLE IF EXISTS `username`;
CREATE TABLE `username`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of username
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `introduce` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `role` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email`(`email` ASC) USING BTREE,
  UNIQUE INDEX `users_username`(`username` ASC) USING BTREE,
  INDEX `users_role`(`role` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin@clwy.cn', 'admin', '$2a$10$ZYCz.wzJdwV6tk8adFvdpOOWFiGNPM/b7vDku0iZisS.fCcS0N83W', '管理员', 2, NULL, NULL, 100, '2025-02-12 18:14:27', '2025-02-12 23:07:54', NULL);
INSERT INTO `users` VALUES (2, 'user1@clwy.cn', 'user1', '$2a$10$XWz5ySkWt/WGMsbaGA5L/uHUq3AtS.fMrNWGLEfl29dAUVgWh/pSK', '普通用户1', 2, '', '', 0, '2025-02-12 18:14:27', '2025-02-12 23:25:08', NULL);
INSERT INTO `users` VALUES (3, 'user2@clwy.cn', 'user2', '$2a$10$76bCWXYOlJXSLFyBC7Of5OfahjrI5x6qDKwzFxVtiIgrZfRmIVpUy', '普通用户2', 0, NULL, NULL, 0, '2025-02-12 18:14:27', '2025-02-12 18:14:27', NULL);
INSERT INTO `users` VALUES (4, 'user3@clwy.cn', 'user3', '$2a$10$qXvWS9Hbw1u2jF0WjE9.j.YItxCvfXycIsZDZi59ZRqQEBynku/..', '普通用户3', 1, NULL, NULL, 0, '2025-02-12 18:14:27', '2025-02-12 18:14:27', NULL);
INSERT INTO `users` VALUES (5, 'aaa@outlook.com', 'predict', '$2a$10$34wdH.yak660cqdC4sdJL.2IbduTcB479Qr0uTeMxBk5h6KjNM/o.', '天气预报', 2, NULL, NULL, 0, '2025-02-12 22:39:01', '2025-02-12 22:39:01', NULL);
INSERT INTO `users` VALUES (6, 'bbb@outlook.com', 'predictt', '$2a$10$8n4aok0iueMk4Hdd.oCRseAiVAlfK66fjvp0gR1/BIen6hnaQ3RM2', '天气预报', 2, NULL, NULL, 0, '2025-02-12 22:40:04', '2025-02-12 22:40:04', NULL);

SET FOREIGN_KEY_CHECKS = 1;
