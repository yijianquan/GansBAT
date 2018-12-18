/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50506
Source Host           : localhost:3306
Source Database       : space

Target Server Type    : MYSQL
Target Server Version : 50506
File Encoding         : 65001

Date: 2018-12-18 14:23:07
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
  `user_nickname` varchar(20) DEFAULT NULL,
  `chat_content` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `space_id` (`space_id`),
  CONSTRAINT `chatroom_ibfk_1` FOREIGN KEY (`space_id`) REFERENCES `space` (`space_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chatroom
-- ----------------------------
INSERT INTO `chatroom` VALUES ('1', '2', '1', '王伟老师', '哈哈哈，你们好');
INSERT INTO `chatroom` VALUES ('2', '2', '7', '张飞宇', '我是大哥');
INSERT INTO `chatroom` VALUES ('3', '2', '12', '纯情小火又鸟', '大家好');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `space_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_nickname` varchar(20) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '2', '1', '王伟老师', '这个球场还可以，经常和学生们在这打球');
INSERT INTO `comment` VALUES ('2', '2', '2', '王鹏帆老师', '打过很多次，很爽，地板给力。');
INSERT INTO `comment` VALUES ('3', '2', '3', '陈润滋老师', '我不打篮球但带小孩去过几次，很好用');
INSERT INTO `comment` VALUES ('4', '2', '4', '丁盟老师', '球场不错，每次来这打球的人也很多。');
INSERT INTO `comment` VALUES ('5', '2', '5', '我是武永亮老师', '贼爽，试试就知道了');
INSERT INTO `comment` VALUES ('6', '2', '6', '我是小得润润', '我是这儿的学生，经常在这打球，最近崴脚了，很难受，有时间约球啊');
INSERT INTO `comment` VALUES ('7', '2', '7', '小飞飞爱打球', '石家庄的冬天有点冷，晚上建议去体育学院打球，那儿舒服。');
INSERT INTO `comment` VALUES ('8', '2', '8', '李岱恒同学', '还可以哈');
INSERT INTO `comment` VALUES ('9', '2', '7', '小飞飞爱打球', '打球真尼玛好玩');
INSERT INTO `comment` VALUES ('10', '2', '7', '小飞飞爱打球', '不错不错');

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `space_id` int(11) DEFAULT NULL,
  `space_name` varchar(20) DEFAULT NULL,
  `space_img` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('62', '7', '2', '河北师范大学西操场', 'images/basketball2.jpg');
INSERT INTO `history` VALUES ('69', '12', '2', '河北师范大学西操场', 'images/basketball2.jpg');

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
  `opentime` varchar(30) DEFAULT NULL,
  `likenum` int(11) unsigned zerofill NOT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`space_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of space
-- ----------------------------
INSERT INTO `space` VALUES ('1', '1', '河北师范大学体育学院', 'images/basketball1.jpg', 'images/basketball1.jpg', 'images/basketball1.jpg', '0', '木地板', '白天', '00000000013', '114.525476', '37.998133');
INSERT INTO `space` VALUES ('2', '1', '河北师范大学西操场', 'images/basketball2.jpg', 'images/1.jpg', 'images/2.jpg', '1', '塑料地板', '全天', '00000000102', '114.513658', '37.995527');
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
  `longitude` decimal(10,6) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload
-- ----------------------------
INSERT INTO `upload` VALUES ('1', '1', 'images/basketball2.jpg', null, null, '河北师范大学西操场', '1', '塑料地板', '全天，除了晚上', '7', null, null);
INSERT INTO `upload` VALUES ('2', '1', 'images/basketball1.jpg', null, null, '河北师大体育学院', '1', '木质地板', '白天', '7', null, null);
INSERT INTO `upload` VALUES ('3', '1', 'images/basketball3.jpg', null, null, '校外篮球场', '0', '水泥地', '全天', '7', null, null);
INSERT INTO `upload` VALUES ('4', '1', 'images/basketball4.jpg', null, null, '石家庄平安公园篮球场', '0', '水泥地', '全天', '7', null, null);

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
  `height` int(4) DEFAULT NULL,
  `weight` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'wangwei', '王伟老师', 'yijianquan', '0', '0', null, null, '我爱篮球，篮球爱我', '165', '110');
INSERT INTO `users` VALUES ('2', 'wangpengfan', '王鹏帆老师', 'wangpengfan', '0', '0', null, null, null, null, null);
INSERT INTO `users` VALUES ('3', 'chenrunzi', '陈润滋老师', 'zhangfeiyu', '0', '0', null, null, null, null, null);
INSERT INTO `users` VALUES ('4', 'dingmeng', '丁盟老师', 'dingmeng', '0', '45', null, null, null, null, null);
INSERT INTO `users` VALUES ('5', 'wuyongliang', '我是武永亮老师', 'wuyongliang', '0', '50', null, null, null, null, null);
INSERT INTO `users` VALUES ('6', 'wangderun', '我是小得润润', 'wangderun', '0', '20', null, null, null, null, null);
INSERT INTO `users` VALUES ('7', 'zhangfeiyu', '小飞飞爱打球', 'zhangfeiyu', '1', '47', '篮球,足球', '河北省石家庄市', '我的优点是我很帅，我的缺点是我帅的并不明显', '167', '120');
INSERT INTO `users` VALUES ('8', 'lidaiheng', '李岱恒同学', 'lidaiheng', '0', '0', null, null, null, null, null);
INSERT INTO `users` VALUES ('12', '1355335683@qq.com', '纯情小火又鸟', 'yijianquan', '0', '0', null, null, null, null, null);
