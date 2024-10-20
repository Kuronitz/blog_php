/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50736 (5.7.36)
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50736 (5.7.36)
 File Encoding         : 65001

 Date: 22/12/2022 15:12:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser`  (
  `regname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `regpwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `regqq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `regemail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `regsex` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `islock` int(11) NOT NULL DEFAULT 0,
  `fig` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`regname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES ('AAA', '$2y$10$dkNwMpSQuxPv/D7AUazOQ.q6dyjRIs0Rfvrg75xwjch1fa4/PLX2m', '963215426', 'aaa@gmail.com', '男', 0, 0);
INSERT INTO `adminuser` VALUES ('Y', '$2y$10$s.vhdn/KWetUc2MNNHAgMOgj5xumtXDIzJrKoEmWFCftukcXz2H5m', '145236521', 'usertest@admin.com', '女', 0, 0);
INSERT INTO `adminuser` VALUES ('KN', '$2y$10$s.vhdn/KWetUc2MNNHAgMOgj5xumtXDIzJrKoEmWFCftukcXz2H5m', '114514', '114514@qq.com', '男', 0, 1);

-- ----------------------------
-- Table structure for article_type
-- ----------------------------
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article_type
-- ----------------------------
INSERT INTO `article_type` VALUES (1, 'Android');
INSERT INTO `article_type` VALUES (2, '技能技巧');
INSERT INTO `article_type` VALUES (3, 'PHP');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pubtime` datetime NOT NULL,
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  INDEX `author`(`author`) USING BTREE,
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `article_type` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`author`) REFERENCES `adminuser` (`regname`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 1, 'PHP简介', '您应当具备的基础知识\r\n在继续学习之前，您需要对以下知识有基本的了解：\r\n\r\nHTML\r\nCSS\r\n如果您希望首先学习这些项目，请在我们的 首页 访问这些教程。\r\n\r\nPHP 是什么？\r\nPHP（全称：PHP：Hypertext Preprocessor，即\"PHP：超文本预处理器\"）是一种通用开源脚本语言。\r\nPHP 脚本在服务器上执行。\r\nPHP 可免费下载使用。\r\nlamp	PHP 对初学者而言简单易学。\r\n\r\nPHP 也为专业的程序员提供了许多先进的功能。\r\n\r\nPHP 文件是什么？\r\nPHP 文件可包含文本、HTML、JavaScript代码和 PHP 代码\r\nPHP 代码在服务器上执行，结果以纯 HTML 形式返回给浏览器\r\nPHP 文件的默认文件扩展名是 \".php\"\r\nPHP 能做什么？\r\nPHP 可以生成动态页面内容\r\nPHP 可以创建、打开、读取、写入、关闭服务器上的文件\r\nPHP 可以收集表单数据\r\nPHP 可以发送和接收 cookies\r\nPHP 可以添加、删除、修改您的数据库中的数据\r\nPHP 可以限制用户访问您的网站上的一些页面\r\nPHP 可以加密数据\r\n通过 PHP，您不再限于输出 HTML。您可以输出图像、PDF 文件，甚至 Flash 电影。您还可以输出任意的文本，比如 XHTML 和 XML。\r\n\r\n为什么使用 PHP？\r\nPHP 可在不同的平台上运行（Windows、Linux、Unix、Mac OS X 等）\r\nPHP 与目前几乎所有的正在被使用的服务器相兼容（Apache、IIS 等）\r\nPHP 提供了广泛的数据库支持\r\nPHP 是免费的，可从官方的 PHP 资源下载它： www.php.net\r\nPHP 易于学习，并可高效地运行在服务器端。', 'KN', '2022-12-06 05:45:59', '');
INSERT INTO `article` VALUES (2, 1, 'SQL语言简介', 'SQL 是一门 ANSI 的标准计算机语言，用来访问和操作数据库系统。SQL 语句用于取回和更新数据库中的数据。SQL 可与数据库程序协同工作，比如 MS Access、DB2、Informix、MS SQL Server、Oracle、Sybase 以及其他数据库系统。\r\n\r\n不幸地是，存在着很多不同版本的 SQL 语言，但是为了与 ANSI 标准相兼容，它们必须以相似的方式共同地来支持一些主要的关键词（比如 SELECT、UPDATE、DELETE、INSERT、WHERE 等等）。\r\n\r\n注释：除了 SQL 标准之外，大部分 SQL 数据库程序都拥有它们自己的私有扩展！', 'KN', '2022-12-06 00:45:19', NULL);
INSERT INTO `article` VALUES (3, 1, 'Python介绍', 'Python是一种跨平台的计算机程序设计语言。 是一个高层次的结合了解释性、编译性、互动性和面向对象的脚本语言。最初被设计用于编写自动化脚本(shell)，随着版本的不断更新和语言新功能的添加，越多被用于独立的、大型项目的开发。\r\nPython在设计上坚持了清晰划一的风格，这使得Python成为一门易读、易维护，并且被大量用户所欢迎的、用途广泛的语言。\r\n设计者开发时总的指导思想是，对于一个特定的问题，只要有一种最好的方法来解决就好了。这在由Tim Peters写的Python格言（称为The Zen of Python）里面表述为：There should be one-- and preferably only one --obvious way to do it. 这正好和Perl语言（另一种功能类似的高级动态语言）的中心思想TMTOWTDI（There\'s More Than One Way To Do It）完全相反。\r\nPython的作者有意的设计限制性很强的语法，使得不好的编程习惯（例如if语句的下一行不向右缩进）都不能通过编译。其中很重要的一项就是Python的缩进规则。\r\n一个和其他大多数语言（如C）的区别就是，一个模块的界限，完全是由每行的首字符在这一行的位置来决定的（而C语言是用一对花括号{}来明确的定出模块的边界的，与字符的位置毫无关系）。这一点曾经引起过争议。因为自从C这类的语言诞生后，语言的语法含义与字符的排列方式分离开来，曾经被认为是一种程序语言的进步。不过不可否认的是，通过强制程序员们缩进（包括if，for和函数定义等所有需要使用模块的地方），Python确实使得程序更加清晰和美观。', 'Y', '2022-12-06 22:45:22', NULL);
INSERT INTO `article` VALUES (4, 1, '这是一篇关于Android的文章', '目前还没有内容！', 'KN', '2022-12-06 14:43:48', NULL);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileid` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comtime` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fileid`(`fileid`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`fileid`) REFERENCES `article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`username`) REFERENCES `adminuser` (`regname`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, 'Y', '好！', '2022-12-04 11:23:14');
INSERT INTO `comment` VALUES (2, 1, 'KN', '留言一下！', '2022-12-05 23:39:09');
INSERT INTO `comment` VALUES (3, 2, 'KN', '测试第二篇文章的第一条留言', '2022-11-25 23:40:12');
INSERT INTO `comment` VALUES (4, 1, 'Y', 'test', '2022-11-22 00:05:49');
INSERT INTO `comment` VALUES (5, 3, 'KN', '测试1', '2022-11-16 04:07:06');
INSERT INTO `comment` VALUES (6, 3, 'Y', '测试2', '2022-12-06 04:13:15');
INSERT INTO `comment` VALUES (7, 1, 'Y', '留下足迹', '2022-12-03 03:44:10');
INSERT INTO `comment` VALUES (8, 3, 'AAA', '支持了', '2022-12-01 11:49:58');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notice_author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notice_time` datetime NOT NULL,
  PRIMARY KEY (`notice_id`) USING BTREE,
  INDEX `notice_author`(`notice_author`) USING BTREE,
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`notice_author`) REFERENCES `adminuser` (`regname`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notice
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
