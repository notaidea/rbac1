/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : rbac

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-08-13 19:59:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for access
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `node_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of access
-- ----------------------------
INSERT INTO `access` VALUES ('17', '2', '2');

-- ----------------------------
-- Table structure for node
-- ----------------------------
DROP TABLE IF EXISTS `node`;
CREATE TABLE `node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `url` varchar(200) NOT NULL DEFAULT '',
  `msg` varchar(100) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of node
-- ----------------------------
INSERT INTO `node` VALUES ('1', '1', '0', '#', '用户管理', '1533919007', '1533919007');
INSERT INTO `node` VALUES ('2', '1', '1', 'user/index', '用户列表', '1533919007', '1533919007');
INSERT INTO `node` VALUES ('3', '1', '1', 'user/create', '添加用户', '1533919007', '1533919007');
INSERT INTO `node` VALUES ('4', '1', '1', 'user/update', '用户更新', '1533919007', '1533919007');
INSERT INTO `node` VALUES ('8', '1', '0', '#', '角色管理', '1533919007', '1533919007');
INSERT INTO `node` VALUES ('9', '1', '8', 'role/create', '添加角色', '1533919007', '1533919007');
INSERT INTO `node` VALUES ('10', '0', '1', 'user/delete', '删除用户', '1533919007', '1533919007');
INSERT INTO `node` VALUES ('11', '1', '1', 'user/userrole', '用户角色', '1533919007', '1533919007');
INSERT INTO `node` VALUES ('12', '1', '8', 'role/index', '角色管理', '1533919007', '1533919007');
INSERT INTO `node` VALUES ('13', '1', '8', 'role/view', '查看角色', '1533919007', '1533919007');
INSERT INTO `node` VALUES ('14', '1', '8', 'role/update', '更新角色', '1533919007', '1533919007');
INSERT INTO `node` VALUES ('15', '1', '0', '#', '路由管理', '1533919007', '0');
INSERT INTO `node` VALUES ('16', '1', '15', 'node/create', '添加路由', '1533919007', '0');
INSERT INTO `node` VALUES ('17', '1', '15', 'node/index', '路由列表', '1533919007', '0');
INSERT INTO `node` VALUES ('18', '0', '15', 'node/update', '修改路由', '1533919007', '0');
INSERT INTO `node` VALUES ('19', '0', '15', 'node/delete', '删除路由', '1533919007', '0');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `msg` varchar(100) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('2', '经理', '部门经理', '1533914819', '1533963634');
INSERT INTO `role` VALUES ('3', '运营', '运营人员', '1533963640', '1533963640');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(5) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password_hash` varchar(100) NOT NULL DEFAULT '',
  `auth_key` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `token` varchar(50) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '10', 'admin', '$2y$13$JNF27uoiCLEO6NuEyr4bt.d5zA3rROqBhX2C7ZnaO1uCEnDIZdnb2', '', '', '', '1500910098', '1500910098');
INSERT INTO `user` VALUES ('7', '0', 'admin123', '$2y$13$4u8DAMSsq3lNhySqM.c6Tu6VLxeXPCTBDS.UQqrceJXU/E9qU4CAe', '705d103a67ea677ac9b3b48bff71f56e', '', '', '1533910098', '1533912242');
INSERT INTO `user` VALUES ('8', '10', 'peter', '$2y$13$QDMkIdnBX.GpIouh9BcC2uxbMY/XR9rWCR3o3yGKrbSKhJFYmIUPy', '8ce894ed4548027599a04d0450c95a38', '', '', '1533912311', '1533912311');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('4', '8', '2');
