/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : youxian

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-11-28 10:30:07
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('2', 'Nadya Eka', 'Jl. Ciwidey no 20', 'nadya@yahoo.com', '086454743743');
INSERT INTO `customer` VALUES ('3', 'Amali', 'Jl. kemandoran no 10 Jakarta', 'amalia@langit.com', '03937263623');
INSERT INTO `customer` VALUES ('4', 'Angel ', 'Jl. Ciledug no 45A. tanggerang', 'angel@gmail.com', '082271626121');
INSERT INTO `customer` VALUES ('5', 'Ujang', 'Jl. ribut no 90 A', 'ujang@gmail.com', '07846352532');
INSERT INTO `customer` VALUES ('6', 'Memet', 'Blok cepu no 14. Bandung', 'memet@ongkek.com', '038372636232');
INSERT INTO `customer` VALUES ('9', 'Agung', 'Jl st Petersburg no 34. Russia', 'agung@yahoo.com', '038373273262');
INSERT INTO `customer` VALUES ('10', 'Jhon Taylor', 'St paris A . Block 43. paris', 'jtaylor@yahoo.com', '039223232323');
INSERT INTO `customer` VALUES ('12', 'lisi', 'shanghai china', 'test@163.com', '136933333222');
INSERT INTO `customer` VALUES ('13', '222', '222', '222@12.com', '2222');
INSERT INTO `customer` VALUES ('14', '4444', '4444', '333@126.com', '123455555');
INSERT INTO `customer` VALUES ('15', '张三', '中国北京', '777@126.com', '777776666');

-- ----------------------------
-- Table structure for `t_products`
-- ----------------------------
DROP TABLE IF EXISTS `t_products`;
CREATE TABLE `t_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(1024) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` float NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `levelName` varchar(50) NOT NULL DEFAULT '',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `classify` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_products
-- ----------------------------
INSERT INTO `t_products` VALUES ('1', '/images/pdt_item.jpg', '牙刷', '28', '0', '', '2', '组合类');
INSERT INTO `t_products` VALUES ('2', '/images/pdt_item.jpg', '西服', '11', '0', '', '1', '日用品');
INSERT INTO `t_products` VALUES ('3', '/images/pdt_item.jpg', '牙膏', '12', '0', '', '1', '日用品');
INSERT INTO `t_products` VALUES ('4', '/images/pdt_item.jpg', '苹果', '12', '0', '', '1', '水果');
INSERT INTO `t_products` VALUES ('5', '/images/pdt_item.jpg', '雪梨', '16', '0', '', '1', '水果');
INSERT INTO `t_products` VALUES ('6', '/images/pdt_item.jpg', '西瓜', '15', '0', '', '1', '水果');
INSERT INTO `t_products` VALUES ('7', '/images/pdt_item.jpg', '龙眼', '18', '0', '', '1', '水果');
INSERT INTO `t_products` VALUES ('8', '/images/pdt_item.jpg', '哈密瓜', '18', '0', '', '1', '水果');
INSERT INTO `t_products` VALUES ('9', '/images/pdt_item.jpg', '葡萄', '26', '0', '', '1', '水果');
INSERT INTO `t_products` VALUES ('10', '/images/pdt_item.jpg', '红牛', '18', '0', '', '1', '饮料');
INSERT INTO `t_products` VALUES ('11', '/images/pdt_item.jpg', '红茶', '18', '0', '', '1', '饮料');
INSERT INTO `t_products` VALUES ('12', '/images/pdt_item.jpg', '红茶', '18', '0', '', '1', '饮料');
INSERT INTO `t_products` VALUES ('13', '/images/pdt_item.jpg', '红茶', '8', '0', '', '1', '生鲜');
INSERT INTO `t_products` VALUES ('14', '/images/pdt_item.jpg', '红茶', '8', '0', '', '1', '生鲜');
INSERT INTO `t_products` VALUES ('15', '/images/pdt_item.jpg', '红茶', '5', '0', '', '1', '日用品');
INSERT INTO `t_products` VALUES ('16', '/images/pdt_item.jpg', '红茶', '5', '0', '', '1', '日用品');
INSERT INTO `t_products` VALUES ('17', '/images/pdt_item.jpg', '红茶', '5', '0', '', '1', '日用品');
INSERT INTO `t_products` VALUES ('18', '/images/pdt_item.jpg', 'APPLE 8', '5', '0', '', '1', '电子');
INSERT INTO `t_products` VALUES ('19', '/images/pdt_item.jpg', 'IPAD', '6', '0', '', '1', '电子');
INSERT INTO `t_products` VALUES ('20', '/images/pdt_item.jpg', '纸巾', '15', '0', '', '1', '日用品');
INSERT INTO `t_products` VALUES ('21', '/images/pdt_item.jpg', '炒锅', '16', '0', '', '1', '日用品');
INSERT INTO `t_products` VALUES ('22', '/images/pdt_item.jpg', '纸袋', '16', '0', '', '1', '日用品');
INSERT INTO `t_products` VALUES ('23', '/images/pdt_item.jpg', '红茶', '17', '0', '', '1', '日用品');
INSERT INTO `t_products` VALUES ('24', '/images/pdt_item.jpg', '鸡肉', '18', '0', '', '1', '肉蛋');
INSERT INTO `t_products` VALUES ('25', '/images/pdt_item.jpg', '燕麦', '18', '0', '', '1', '饮料');
INSERT INTO `t_products` VALUES ('26', '/images/pdt_item.jpg', '海鱼', '18', '0', '', '1', '生鲜');
INSERT INTO `t_products` VALUES ('27', '/images/pdt_item.jpg', '大鱼', '20', '0', '', '1', '生鲜');
INSERT INTO `t_products` VALUES ('28', '/images/pdt_item.jpg', '海虾', '3', '0', '', '1', '生鲜');
INSERT INTO `t_products` VALUES ('29', '/images/pdt_item.jpg', '茶壶', '6', '0', '', '1', '日用品');
INSERT INTO `t_products` VALUES ('30', '/images/pdt_item.jpg', '百事可乐', '10', '0', '', '1', '饮料');
INSERT INTO `t_products` VALUES ('31', '/images/pdt_item.jpg', '红茶', '12', '0', '', '1', '日用品');
INSERT INTO `t_products` VALUES ('32', '/images/pdt_item.jpg', '红茶', '3', '0', '', '1', '蔬菜');
INSERT INTO `t_products` VALUES ('33', '/images/pdt_item.jpg', '矿泉水', '3', '0', '', '1', '饮料');
INSERT INTO `t_products` VALUES ('34', '/images/pdt_item.jpg', '鸡蛋', '5', '0', '', '1', '肉蛋');
INSERT INTO `t_products` VALUES ('35', '/images/pdt_item.jpg', '美年达', '5', '0', '', '1', '饮料');
INSERT INTO `t_products` VALUES ('36', '/images/pdt_item.jpg', '七喜', '5', '0', '', '1', '饮料');
INSERT INTO `t_products` VALUES ('37', '/images/pdt_item.jpg', '燕京鲜啤', '9', '0', '', '1', '饮料');
INSERT INTO `t_products` VALUES ('38', '/images/pdt_item.jpg', '红茶', '12', '0', '', '1', '饮料');
INSERT INTO `t_products` VALUES ('39', '/images/pdt_item.jpg', '大西洋芭乐汁', '12', '0', '', '1', '饮料');
INSERT INTO `t_products` VALUES ('40', '/images/pdt_item.jpg', '黑松沙士', '12', '0', '', '1', '饮料');

-- ----------------------------
-- Table structure for `t_shop`
-- ----------------------------
DROP TABLE IF EXISTS `t_shop`;
CREATE TABLE `t_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(1024) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `phoneNumber` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '北京',
  `address` varchar(1024) NOT NULL DEFAULT '',
  `level` varchar(255) NOT NULL DEFAULT '0',
  `levelName` varchar(50) NOT NULL DEFAULT '',
  `classifies` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shop
-- ----------------------------
INSERT INTO `t_shop` VALUES ('1', '/images/pdt_logo.png', '上品折扣', '15810381169', '333@126.com', '北京', '北京房山', '三星级', '三星级', '日用品|水果|饮料|电子|生鲜|蔬菜|肉蛋');
INSERT INTO `t_shop` VALUES ('2', '/images/pdt_logo.png', '奥特莱斯', '1453324324', 'test@163.com', '北京', '北京朝阳', '5', '三星级', '其他');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(1024) DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `realName` varchar(50) DEFAULT '',
  `birthday` char(10) DEFAULT '',
  `phoneNumber` varchar(20) DEFAULT '',
  `email` varchar(50) DEFAULT '',
  `country` varchar(50) DEFAULT '中国',
  `city` varchar(50) DEFAULT '北京',
  `level` int(11) DEFAULT '0',
  `levelName` varchar(50) DEFAULT '初来乍到',
  `roleId` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('5', '', 'test', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', '中国', '北京', '0', '', '0');
