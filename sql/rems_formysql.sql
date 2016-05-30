/*
MySQL Data Transfer
Source Host: localhost
Source Database: rems
Target Host: localhost
Target Database: rems
Date: 2016/5/30 11:06:14
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL auto_increment COMMENT '回答ID',
  `answer` varchar(255) NOT NULL COMMENT '回答内容',
  `doctorId` int(11) NOT NULL COMMENT '医生ID',
  `state` int(11) NOT NULL COMMENT '回答状态1正常0不正常',
  `createTime` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `userid` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `num` varchar(255) default NULL,
  `addr` varchar(255) default NULL,
  `col` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `mail` varchar(255) default NULL,
  `mz` varchar(255) default NULL,
  `cel` varchar(255) default NULL,
  `birth` date default NULL,
  `rynf` date default NULL,
  `pro` varchar(255) default NULL,
  `marry` varchar(255) default NULL,
  `bzzt` varchar(255) default NULL,
  `sysname` varchar(255) default NULL,
  `syspass` varchar(255) default NULL,
  `userimage` varchar(255) default NULL,
  `age` int(11) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `userid` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `age` int(11) default NULL,
  `sex` varchar(255) default NULL,
  `marry` varchar(255) default NULL,
  `jg` varchar(255) default NULL,
  `job` varchar(255) default NULL,
  `profession` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `jws` varchar(255) default NULL,
  `gms` varchar(255) default NULL,
  `bqzz` varchar(255) default NULL,
  `bqfx` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL auto_increment COMMENT '问题ID',
  `question` varchar(255) NOT NULL COMMENT '问题内容',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `answerId` int(11) default NULL COMMENT '回答ID',
  `state` int(11) NOT NULL COMMENT '问题状态1正常0已删除2匿名问题',
  `subjectId` int(11) NOT NULL COMMENT '问题科目类型',
  `title` varchar(255) default NULL COMMENT '标题',
  `createTime` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id',
  `subjectCode` varchar(255) NOT NULL COMMENT '科目代码',
  `subjectName` varchar(255) NOT NULL COMMENT '科目名称',
  `state` int(11) NOT NULL COMMENT '科目状态1启用0未启用',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL default '0',
  `gh` int(11) default NULL,
  `pass` varchar(255) default NULL,
  `wt` varchar(255) default NULL,
  `da` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `yx` varchar(255) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `answer` VALUES ('1', '早上尽量不要着凉，按时吃慢咽舒宁冲剂，尽量多喝热水。', '8', '1', '2015-04-14 16:46:28');
INSERT INTO `answer` VALUES ('2', '平常注意下耳朵，自己去医院看下！', '18', '1', '2015-04-20 13:24:52');
INSERT INTO `answer` VALUES ('3', 'testaaaa', '8', '1', '2016-04-18 20:02:53');
INSERT INTO `doctor` VALUES ('1', '测试姓名', '', '测试地址', '', '男', '4444444444', '', '1234566332423', null, null, '1', '未婚', '请选择...', 'test22222', '', '20150409_170738test.bmp', null);
INSERT INTO `doctor` VALUES ('2', '测试姓名1', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, '/photo/20150403_142316.jpg', null);
INSERT INTO `doctor` VALUES ('3', '测试姓名2', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, '/photo/20150403_144015.jpg', null);
INSERT INTO `doctor` VALUES ('4', '测试姓名3', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, '/photo/20150403_144501.jpg', null);
INSERT INTO `doctor` VALUES ('5', '测试姓名4', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, '/photo/20150403_145218.jpg', null);
INSERT INTO `doctor` VALUES ('6', '测试姓名5', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, '/photo/20150403_145607.', null);
INSERT INTO `doctor` VALUES ('7', '测试姓名6', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, '/photo/20150403_145845.', null);
INSERT INTO `doctor` VALUES ('8', '测试姓名7', '420923198708054935', '', null, '请选择...', '', '', '', null, null, '1', '请选择...', '请选择...', 'chusiyou2', 'chusiyou249250', '1213', null);
INSERT INTO `doctor` VALUES ('9', '测试姓名8', '420923198708054935', '', null, '请选择...', '', '', '', null, null, '1', '请选择...', '请选择...', 'chusiyou1', 'chusiyou249250', '1213', null);
INSERT INTO `doctor` VALUES ('10', '褚四友', '420923198708054935', '测试地址11111', null, '男', 'chusiyou@gmail.com', '汉', '13409503246', '1987-08-05', '2015-03-20', '2', '已婚', '正式编制', 'chusiyou3', 'chusiyou249250', null, null);
INSERT INTO `doctor` VALUES ('11', '褚四友', '420923198708054935', '测试地址11111', '中山医院', '男', 'chusiyou@gmail.com', '汉', '13409503246', '1987-08-05', '2015-03-20', '2', '已婚', '正式编制', 'chusiyou4', 'chusiyou249250', null, null);
INSERT INTO `doctor` VALUES ('12', '褚四友', '', '', '', '请选择...', '', '', '', null, null, '2', '请选择...', '请选择...', 'chusiyou5', 'chusiyou249250', null, null);
INSERT INTO `doctor` VALUES ('13', '测试姓名9', '', '', '', '请选择...', '', '', '', null, null, '2', '请选择...', '请选择...', 'chusiyou6', 'chusiyou249250', 'G:\\software\\tomcat-6.0.18\\tomcat-6.0.18\\webapps\\REMS\\MN0G9~DYD[H@%OSA{}VZFTJ.jpg', null);
INSERT INTO `doctor` VALUES ('14', '褚四友', '420923198708054935', '', '', '请选择...', '', '', '', null, null, '2', '请选择...', '请选择...', 'chusiyou7', 'chusiyou249250', 'G:\\software\\tomcat-6.0.18\\tomcat-6.0.18\\webapps\\REMS\\photo/$_EDUVJCLO$IH5{2@LXSSXG.jpg', null);
INSERT INTO `doctor` VALUES ('15', '测试姓名10', '', '', '', '请选择...', '', '', '', null, null, '2', '请选择...', '请选择...', 'chusiyou8', 'chusiyou249250', '20150403_1540382013.jpg', null);
INSERT INTO `doctor` VALUES ('16', '测试姓名11', '', '', '', '请选择...', '', '', '', null, null, '2', '请选择...', '请选择...', 'chusiyou9', 'chusiyou249250', '20150403_1542582013.jpg', null);
INSERT INTO `doctor` VALUES ('17', 'test', '4444444444444444', '测试地址2222222', '', '男', 'chusiyou@gmail.com', '汉', '1345533423424', '1987-08-05', '2015-03-20', '2', '未婚', '正式编制', 'chusiyou66', 'chusiyou', '20150409_130157报名照片.jpg', null);
INSERT INTO `doctor` VALUES ('18', '3333', '444', '', '', '男', '666666', '汉族', '5555', null, null, '1', '未婚', '正式编制', '1111', '222', '20150420_1302431a97733e558c7f6b71cf6c38.jpg', '30');
INSERT INTO `patient` VALUES ('1', '李显龙', 'test111ccccccc', 'chusiyou249250', '60', '男', null, '', 'test2222', null, '22222', '无', 'æ ', '', 'æ ', null);
INSERT INTO `patient` VALUES ('2', '褚四友', null, 'chusiyou249250', '28', '男', '已婚', null, '测试', null, '测试地址', '无', '无', null, '无', null);
INSERT INTO `patient` VALUES ('3', '褚四友', null, 'chusiyou249250', '28', '男', '已婚', null, '测试', null, '测试地址', '无', '无', '无', '无', null);
INSERT INTO `patient` VALUES ('4', '张三55', 'zhangsan', 'zhangsan', '20', '男', '未婚', '宁夏', '民工', '', '测试地址', '高血压', '花生', '1', '2222', '');
INSERT INTO `patient` VALUES ('5', '李四', 'lisi', '888888', '21', '男', '未婚', '宁夏', 'IT', null, '测试地址', '测试', '测试', '测试', '测试', null);
INSERT INTO `patient` VALUES ('6', '王五', 'wangwu', '111111', '19', '男', '未婚', '宁夏', '测试职业', null, '测试地址', '无', '无', '无', '无', null);
INSERT INTO `patient` VALUES ('7', '李光耀', 'chusiyou44', '', '89', '男', '已婚', '广东', '总统', '', '新加坡', '无', '无', '无', '无', '');
INSERT INTO `patient` VALUES ('8', '张三2', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('9', '张三1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('10', '张三3', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('11', '张三54', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('12', '张三53', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('13', '张三52', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('14', '张三51', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('15', '张三50', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('16', '张三49', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('17', '张三48', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('18', '张三47', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('19', '张三46', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('20', '张三45', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('21', '张三44', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('22', '张三43', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('23', '张三42', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('24', '张三41', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('25', '张三40', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('26', '张三39', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('27', '张三38', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('28', '张三37', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('29', '张三36', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('30', '张三35', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('31', '张三34', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('32', '张三33', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('33', '张三32', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('34', '张三31', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('35', '张三30', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('36', '张三29', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('37', '张三28', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('38', '张三27', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('39', '张三26', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('40', '张三25', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('41', '张三24', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('42', '张三23', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('43', '张三22', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('44', '张三21', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('45', '张三20', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('46', '张三19', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('47', '张三18', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('48', '张三17', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('49', '张三16', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('50', '张三15', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('51', '张三14', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('52', '张三13', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('53', '张三12', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('54', '张三11', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('55', '张三10', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('56', '张三9', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('57', '张三8', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('58', '张三7', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `patient` VALUES ('62', '铁素体222', 'chusiyou', 'chusiyou249250', '30', '男', '已婚', '', '', null, '', '', '', '', '', null);
INSERT INTO `question` VALUES ('1', '每天早上起来喉咙特别干，非常不舒服，怎么办啊？', '1', '1', '2', '3', '关于慢性咽炎问题', '2015-04-13 17:05:21');
INSERT INTO `question` VALUES ('2', '耳朵有时候经常听不清楚', '1', '2', '1', '3', '耳朵老是听不太清楚', '2015-04-14 12:59:37');
INSERT INTO `question` VALUES ('3', '喉咙老是不舒服！！！', '62', null, '1', '3', '早上起来喉咙不舒服！', '2015-04-20 17:51:07');
INSERT INTO `question` VALUES ('4', 'ceshi 222222222', '1', null, '1', '1', 'test111', '2015-08-14 11:43:06');
INSERT INTO `question` VALUES ('5', 'test222222', '1', '3', '2', '1', 'aaaaaaa', '2015-08-14 11:52:38');
INSERT INTO `subject` VALUES ('1', 'GK001', '骨科2', '1');
INSERT INTO `subject` VALUES ('2', 'FK001', '妇科', '1');
INSERT INTO `subject` VALUES ('3', 'EBHK001', '耳鼻喉科', '1');
