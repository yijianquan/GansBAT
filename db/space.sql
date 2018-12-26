/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50506
Source Host           : localhost:3306
Source Database       : space

Target Server Type    : MYSQL
Target Server Version : 50506
File Encoding         : 65001

Date: 2018-12-26 21:54:29
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chatroom
-- ----------------------------
INSERT INTO `chatroom` VALUES ('1', '2', '1', '王伟老师', '哈哈哈，你们好');
INSERT INTO `chatroom` VALUES ('2', '2', '7', '张飞宇', '我是大哥');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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
INSERT INTO `comment` VALUES ('11', '2', '12', 'yijianquan', '还可以哈');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES ('1', '易剑权', '15226515211', '我觉得这个网站设计的特别棒', '做的不错，继续加油');
INSERT INTO `contact` VALUES ('9', '易剑权', '15226515211', '网站做的很好', '哈哈');
INSERT INTO `contact` VALUES ('10', '', '1522651521', '我觉得这个网站设计的特别棒', '是');
INSERT INTO `contact` VALUES ('11', '', '', '', '');
INSERT INTO `contact` VALUES ('12', '', '', '', '');
INSERT INTO `contact` VALUES ('13', '', '', '', '');
INSERT INTO `contact` VALUES ('14', '', '', '', '');
INSERT INTO `contact` VALUES ('15', '', '15226515211', '', '');
INSERT INTO `contact` VALUES ('16', '', '15226515211', '', '');
INSERT INTO `contact` VALUES ('17', '', '', '', '');
INSERT INTO `contact` VALUES ('18', '', '1522651521', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('62', '7', '2', '河北师范大学西操场', 'images/basketball2.jpg');
INSERT INTO `history` VALUES ('80', '12', '1', '河北师范大学体育学院', 'images/basketball1.jpg');
INSERT INTO `history` VALUES ('87', '12', '2', '河北师范大学西操场', 'images/basketball2.jpg');

-- ----------------------------
-- Table structure for `space`
-- ----------------------------
DROP TABLE IF EXISTS `space`;
CREATE TABLE `space` (
  `space_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `space_address` varchar(50) NOT NULL,
  `space_img1` varchar(60) NOT NULL,
  `space_img2` varchar(60) DEFAULT NULL,
  `space_img3` varchar(60) DEFAULT NULL,
  `charge` int(11) NOT NULL,
  `space_intro` varchar(100) DEFAULT NULL,
  `opentime` varchar(30) DEFAULT NULL,
  `likenum` int(11) unsigned zerofill NOT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `distance` double unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`space_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of space
-- ----------------------------
INSERT INTO `space` VALUES ('1', '1', '河北师范大学体育学院', 'images/basketball1.jpg', 'images/basketball1.jpg', 'images/basketball1.jpg', '0', '木地板', '白天', '00000000000', '114.525476', '37.998133', null);
INSERT INTO `space` VALUES ('2', '1', '河北师范大学西操场', 'images/basketball2.jpg', 'images/1.jpg', 'images/2.jpg', '1', '塑料地板', '全天', '00000000000', '114.513658', '37.995527', null);
INSERT INTO `space` VALUES ('3', '1', '石家庄冀之星体育馆', 'images/jizhixing1.jpg', 'images/jizhixing2.jpg', 'images/jizhixing3.jpg', '1', '木地板', '白天到晚上', '00000000000', '114.518497', '38.009017', null);
INSERT INTO `space` VALUES ('4', '1', '石家庄MAX篮球馆青园街店', 'images/shijiazhuangmax2.jpg', 'images/shijiazhuangmax1.jpg', 'images/shijiazhuangmax1.jpg', '1', '木地板', '白天', '00000000000', '114.525306', '38.014691', null);
INSERT INTO `space` VALUES ('5', '1', '石家庄0311篮球俱乐部', 'images/shijiazhuang00313.jpg', 'images/shijiazhuang00312.jpg', 'images/shijiazhuang00311.jpg', '1', '未知', '白天', '00000000000', '114.484352', '38.076770', null);
INSERT INTO `space` VALUES ('6', '1', '石家庄长安公园篮球场', 'images/shijiazhuangchangangongyuan1.jpg', 'images/shijiazhuangchangangongyuan2.jpg', 'images/shijiazhuangchangangongyuan3.jpg', '0', '水泥地', '全天', '00000000000', '114.522998', '38.052984', null);
INSERT INTO `space` VALUES ('7', '1', '石家庄MAX篮球馆白佛店', 'images/shijiazhuangmaxbaifo1.jpg', 'images/shijiazhuangmaxbaifo2.jpg', 'images/shijiazhuangmaxbaifo3.jpg', '1', '木地板', '白天', '00000000000', '114.591277', '38.056166', null);
INSERT INTO `space` VALUES ('8', '1', '石家庄石家庄ZONE篮球公园', 'images/shijiazhuangzone1.jpg', 'images/shijiazhuangzone2.jpg', 'images/shijiazhuangzone3.jpg', '1', '木地板', '白天', '00000000000', '114.490053', '38.050507', null);
INSERT INTO `space` VALUES ('9', '1', '石家庄篮球宝贝篮球场', 'images/shijiazhuanglanqiubaobei1.jpg', 'images/shijiazhuanglanqiubaobei2.jpg', 'images/shijiazhuanglanqiubaobei1.jpg', '1', '塑料', '白天', '00000000000', '114.518531', '38.093811', null);
INSERT INTO `space` VALUES ('10', '1', '石家庄星锐篮球馆', 'images/shijiazhuangxingrui1.jpg', 'images/shijiazhuangxingrui2.jpg', 'images/shijiazhuangxingrui3.jpg', '1', '模板', '白天', '00000000000', '114.432006', '37.987880', null);
INSERT INTO `space` VALUES ('11', '1', '石家庄职业技术学院', 'images/shijiazhuangzhiyejishu1.jpg', 'images/shijiazhuangzhiyejishu1.jpg', 'images/shijiazhuangzhiyejishu1.jpg', '0', '水泥地', '全天', '00000000000', '114.475262', '37.990437', null);
INSERT INTO `space` VALUES ('12', '6', '河北师大排球场', 'images/paiqiuhebeishida1.jpg', 'images/paiqiuhebeishida1.jpg', 'images/paiqiuhebeishida1.jpg', '0', '水泥地', '白天', '00000000000', '114.531394', '38.005289', null);
INSERT INTO `space` VALUES ('13', '6', '河北医科大学排球场', 'images/paiqiuhebeiyikeda1.jpg', 'images/paiqiuhebeiyikeda1.jpg', 'images/paiqiuhebeiyikeda1.jpg', '0', '塑胶地', '白天', '00000000000', '114.540213', '38.054014', null);
INSERT INTO `space` VALUES ('14', '2', '河北师大足球场', 'images/zuqiuhebeishida1.jpg', 'images/zuqiuimages/hebeishida1', 'images/zuqiuimages/hebeishida1', '0', '假草地', '全天', '00000000000', '114.521895', '38.001391', null);
INSERT INTO `space` VALUES ('15', '2', '8492足球文化园区', 'images/zuqiu84921.jpg', 'images/zuqiu84921.jpg', 'images/zuqiu84921.jpg', '1', '真草地', '开门时间', '00000000000', '114.539017', '37.996929', null);
INSERT INTO `space` VALUES ('16', '3', '河北师大乒乓球场', 'images/pingpang1.jpg', 'images/pingpang1.jpg', 'images/pingpang1.jpg', '0', '无', '全天', '00000000000', '114.522544', '38.001799', null);
INSERT INTO `space` VALUES ('17', '5', '石家庄超越健身', 'images/jianshenfangchaoyuejianshen1.jpg', 'images/jianshenfangchaoyuejianshen1.jpg', 'images/jianshenfangchaoyuejianshen1.jpg', '1', '无', '工作时间', '00000000000', '114.516468', '38.019268', null);

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
  `space_img1` varchar(255) NOT NULL,
  `space_img2` varchar(255) DEFAULT NULL,
  `space_img3` varchar(255) DEFAULT NULL,
  `space_address` varchar(30) NOT NULL,
  `charge` int(11) NOT NULL,
  `space_intro` varchar(50) DEFAULT NULL,
  `opentime` varchar(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload
-- ----------------------------
INSERT INTO `upload` VALUES ('1', '1', 'images/basketball2.jpg', null, null, '河北师范大学西操场', '1', '塑料地板', '全天，除了晚上', '7', null, null);
INSERT INTO `upload` VALUES ('2', '1', 'images/basketball1.jpg', null, null, '河北师大体育学院', '1', '木质地板', '白天', '7', null, null);
INSERT INTO `upload` VALUES ('3', '1', 'images/basketball3.jpg', null, null, '校外篮球场', '0', '水泥地', '全天', '7', null, null);
INSERT INTO `upload` VALUES ('4', '1', 'images/basketball4.jpg', null, null, '石家庄平安公园篮球场', '0', '水泥地', '全天', '7', null, null);
INSERT INTO `upload` VALUES ('5', '1', 'E:\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Space\\images\\\\close_1.png', null, null, '河北省石家庄市桥西区东风街道石府公寓', '1', '系红领巾hh', '河涸海干开关机', '0', '114.509156', '38.028709');

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
INSERT INTO `users` VALUES ('12', '1355335683@qq.com', 'yijianquan', 'yijianquan', '0', '20', null, null, '我想找个女朋友', '176', '120');
