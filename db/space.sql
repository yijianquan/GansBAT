/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50506
Source Host           : localhost:3306
Source Database       : space

Target Server Type    : MYSQL
Target Server Version : 50506
File Encoding         : 65001

Date: 2018-12-10 14:06:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `chatroom`
-- ----------------------------
DROP TABLE IF EXISTS `chatroom`;
CREATE TABLE `chatroom` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `space_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `space_id` (`space_id`),
  CONSTRAINT `chatroom_ibfk_1` FOREIGN KEY (`space_id`) REFERENCES `space` (`space_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chatroom
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `space_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `contact`
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `contact_infro` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `contact_con` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES ('1', '易剑权', '15226515211', '我觉得这个网站设计的特别棒', '做的不错，继续加油');
INSERT INTO `contact` VALUES ('9', '易剑权', '15226515211', '网站做的很好', '哈哈');

-- ----------------------------
-- Table structure for `history`
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `space_name` varchar(20) DEFAULT NULL,
  `space_img` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------

-- ----------------------------
-- Table structure for `space`
-- ----------------------------
DROP TABLE IF EXISTS `space`;
CREATE TABLE `space` (
  `space_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `space_address` varchar(50) NOT NULL,
  `space_img1` varchar(30) NOT NULL,
  `space_img2` varchar(30) DEFAULT NULL,
  `space_img3` varchar(30) DEFAULT NULL,
  `charge` int(11) NOT NULL,
  `space_intro` varchar(100) DEFAULT NULL,
  `opentime` time DEFAULT NULL,
  `likenum` int(11) unsigned zerofill NOT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`space_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of space
-- ----------------------------
INSERT INTO `space` VALUES ('1', '1', '河北师范大学体育学院', 'images/basketball1.jpg', null, null, '0', null, null, '00000000000', null, null);
INSERT INTO `space` VALUES ('2', '1', '河北师范大学西操场', 'images/basketball2.jpg', null, null, '0', null, null, '00000000000', null, null);
INSERT INTO `space` VALUES ('3', '1', '石家庄体育馆', 'images/basketball3.jpg', null, null, '0', null, null, '00000000000', null, null);
INSERT INTO `space` VALUES ('4', '1', '石家庄平安公园篮球场', 'images/basketball4.jpg', null, null, '0', null, null, '00000000000', null, null);
INSERT INTO `space` VALUES ('5', '1', '石家庄粟水清苑', 'images/basketball5.jpg', null, null, '0', null, null, '00000000000', null, null);
INSERT INTO `space` VALUES ('6', '1', '石家庄南山', 'images/basketball5.jpg', null, null, '0', null, null, '00000000000', null, null);

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) NOT NULL,
  `type_img` varchar(30) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '篮 球 场', 'images/basketball.jpg');
INSERT INTO `type` VALUES ('2', '足 球 场', 'images/football.jpg');
INSERT INTO `type` VALUES ('3', '乒 乓 球 场', 'images/pingpong.jpg');
INSERT INTO `type` VALUES ('4', '橡 胶 跑 道', 'images/ground.jpg');
INSERT INTO `type` VALUES ('5', '健 身 场 地', 'images/bodybuild.jpg');
INSERT INTO `type` VALUES ('6', '排 球 场', 'images/volleyball.jpg');

-- ----------------------------
-- Table structure for `upload`
-- ----------------------------
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `space_img1` varchar(30) NOT NULL,
  `space_img2` varchar(30) DEFAULT NULL,
  `space_img3` varchar(30) DEFAULT NULL,
  `space_address` varchar(30) NOT NULL,
  `charge` int(11) NOT NULL,
  `space_intro` varchar(50) DEFAULT NULL,
  `opentime` varchar(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `sex` int(11) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `hobby` varchar(20) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `intro` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1355335683@qq.com', '纯情小火又鸟', 'yijianquan', '0', '0', null, null, null);
INSERT INTO `users` VALUES ('2', '123', '123', '123', '0', '0', null, null, null);

-- ----------------------------
-- Table structure for `user_upload`
-- ----------------------------
DROP TABLE IF EXISTS `user_upload`;
CREATE TABLE `user_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `space_id` int(11) NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_upload
-- ----------------------------
