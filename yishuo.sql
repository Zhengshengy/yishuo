/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : yishuo

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-08-12 21:59:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(10) NOT NULL AUTO_INCREMENT COMMENT '管理员自增id',
  `aname` varchar(32) DEFAULT NULL COMMENT '管理员名字',
  `apass` varchar(255) DEFAULT NULL COMMENT '管理员密码',
  `asave` varchar(255) DEFAULT NULL COMMENT '保存天数',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '');
INSERT INTO `admin` VALUES ('2', '王老师', 'e10adc3949ba59abbe56e057f20f883e', null);
INSERT INTO `admin` VALUES ('3', 'wanglaoshi', 'e10adc3949ba59abbe56e057f20f883e', null);

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `collect`
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `coid` int(10) NOT NULL AUTO_INCREMENT,
  `cocid` varchar(255) DEFAULT NULL,
  `coname` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`coid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for `content`
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `cid` int(10) NOT NULL AUTO_INCREMENT COMMENT '内容自增id',
  `cname` varchar(255) DEFAULT NULL COMMENT '内容的发布者,需要关联用户表',
  `ctitle` varchar(600) DEFAULT NULL COMMENT '内容题目',
  `ctext` varchar(800) DEFAULT NULL COMMENT '显示的内容',
  `ctypes` varchar(255) DEFAULT NULL,
  `cstart` datetime DEFAULT NULL COMMENT '留言时间',
  `cimage` varchar(600) DEFAULT NULL COMMENT '匹配图片地址',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES ('1', 'Beckham', '悉尼歌剧院插画图集', '悉尼歌剧院，位于悉尼市区北部，是悉尼市地标建筑物，由丹麦建筑师约恩`乌松设计。', '插图/漫画', '2018-07-15 12:00:00', 'http://localhost:8000/static/upload/1534054612042301.png');
INSERT INTO `content` VALUES ('2', 'Christina', 'Metro Design', '人与人之间要懂得互相尊重', '海报', '2018-07-29 15:30:00', 'http://localhost:8000/static/upload/1534054821663386.png');
INSERT INTO `content` VALUES ('3', 'Aguilera', '小镇插画作品集', '小镇故事中透着灵秀，碧海连天的青海湖美景，凉爽宜人的气候一直萦绕在耳旁。', '平面', '2018-08-01 10:00:00', 'http://localhost:8000/static/upload/1534055130123561.png');
INSERT INTO `content` VALUES ('4', 'Hendricks', 'Chinese Kung Fu Design', '中国功夫注重内外兼修的中国传统体育项目，讲究刚柔并济，既有刚健兄妹的外形，更有电压深邃的内涵。', '纯手工业', '2018-08-01 10:30:00', 'http://localhost:8000/static/upload/1534055302699884.png');
INSERT INTO `content` VALUES ('5', 'Papillon', '巨型红酒杯', '红酒杯中的香气与口感是沁人心脾的', '纯艺术', '2018-02-09 10:20:00', 'http://localhost:8000/static/upload/1534055487394629.png');
INSERT INTO `content` VALUES ('6', 'Papillon', '摩登女郎', '靓丽的复试，一位耀眼的摩登女郎展现在你的眼前', '服装', '2018-07-01 09:00:00', 'http://localhost:8000/static/upload/1534055639441978.png');

-- ----------------------------
-- Table structure for `dianzan`
-- ----------------------------
DROP TABLE IF EXISTS `dianzan`;
CREATE TABLE `dianzan` (
  `zid` int(10) NOT NULL AUTO_INCREMENT,
  `zname` varchar(32) DEFAULT NULL,
  `zcname` varchar(255) DEFAULT NULL,
  `zctext` varchar(400) DEFAULT NULL,
  `zcid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`zid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dianzan
-- ----------------------------
INSERT INTO `dianzan` VALUES ('34', 'Christina', null, null, '悉尼歌剧院插画图集');

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-08-07 16:39:40');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-08-07 16:39:42');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-08-07 16:39:42');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-08-07 16:39:42');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-08-07 16:39:42');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-08-07 16:39:42');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-08-07 16:39:43');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-08-07 16:39:43');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-08-07 16:39:43');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-08-07 16:39:43');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-08-07 16:39:43');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2018-08-07 16:39:43');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0009_alter_user_last_name_max_length', '2018-08-07 16:39:43');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2018-08-07 16:39:43');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('20mq9bdozbk48ofpyassmy7dcvoc3c4h', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-18 00:33:15');
INSERT INTO `django_session` VALUES ('2yt25pqlfrgyeolfvh8gvdg6fgo0kipn', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-17 02:31:32');
INSERT INTO `django_session` VALUES ('44qyxbud12ltsn0qnqee3lkjg08tjtcz', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-17 07:41:30');
INSERT INTO `django_session` VALUES ('6lkto33ft5a14ne5p90i64pccv7mb61v', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-14 17:30:05');
INSERT INTO `django_session` VALUES ('8miv166peaxox64hxu5wftgampjykytl', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-19 08:49:15');
INSERT INTO `django_session` VALUES ('9mpw6cpvamwxlkljr380mq6cx333z6f2', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-17 06:59:55');
INSERT INTO `django_session` VALUES ('a5f8tc04ojjkbqhxe12yfzvorvbp4bzl', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-19 06:58:11');
INSERT INTO `django_session` VALUES ('g1paop769jels58vljcsbll3yiopspmg', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-15 09:23:40');
INSERT INTO `django_session` VALUES ('h79yc8ik82i77g7p4pqwftf67a9xttdg', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-16 17:11:04');
INSERT INTO `django_session` VALUES ('kmn52o9jjp0mci8h69n8m90mts8zyewo', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-18 07:58:44');
INSERT INTO `django_session` VALUES ('lm5upu3j9uzpg2agh7ablnkz550aefds', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-17 06:05:32');
INSERT INTO `django_session` VALUES ('mlmm18esmyl9nomw8vs6b0i2ws54l0qv', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-18 16:29:06');
INSERT INTO `django_session` VALUES ('nc06m0mhngyqmitmnbzhlzso0z3rritr', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-18 09:16:06');
INSERT INTO `django_session` VALUES ('p15icv5vnft7nie0y98b33qps161l46p', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-16 00:26:56');
INSERT INTO `django_session` VALUES ('ryyi678lyo40a9yoqh9qxjii22m603qs', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-15 21:42:41');
INSERT INTO `django_session` VALUES ('sq6tn651h8pro7xlmn6s2mpoo5fihhdz', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-14 17:39:39');
INSERT INTO `django_session` VALUES ('srtl1p0bm8yvmel8udt3nqrjvr7qg82k', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-17 08:22:30');
INSERT INTO `django_session` VALUES ('thwzr1sje95fynr0hwfgsc3vae6575le', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-19 07:52:48');
INSERT INTO `django_session` VALUES ('ury8rbqsqazsp6vvdmm8g3dgv03aabrh', 'MWQ4MWU2NjIxNzFkMDZiZDRhMTk2N2E4MGYwNjIwY2E0ZmMxYTcyNjp7ImxvZ2luIjoieWVzIiwiYW5hbWUiOiJhZG1pbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2018-08-17 02:47:05');

-- ----------------------------
-- Table structure for `flag`
-- ----------------------------
DROP TABLE IF EXISTS `flag`;
CREATE TABLE `flag` (
  `fid` int(10) NOT NULL AUTO_INCREMENT,
  `ftitle` varchar(255) DEFAULT NULL,
  `frid` int(10) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flag
-- ----------------------------
INSERT INTO `flag` VALUES ('1', '轮播图', '1');
INSERT INTO `flag` VALUES ('2', '置顶', '2');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mid` int(10) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `mname` varchar(32) DEFAULT NULL COMMENT '留言的用户姓名',
  `mcontent` varchar(500) DEFAULT NULL COMMENT '留言的内容',
  `mcid` int(10) DEFAULT NULL COMMENT '留言属于哪个用户,需要关联内容表',
  `mflag` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('6', 'Christina', '美观', '3', '1');

-- ----------------------------
-- Table structure for `rotate`
-- ----------------------------
DROP TABLE IF EXISTS `rotate`;
CREATE TABLE `rotate` (
  `rid` int(10) NOT NULL AUTO_INCREMENT COMMENT '广告自增id',
  `raddr` varchar(255) DEFAULT NULL COMMENT '广告地址',
  `rcid` tinyint(10) DEFAULT NULL,
  `rfid` tinyint(10) DEFAULT NULL COMMENT '标识位id',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rotate
-- ----------------------------
INSERT INTO `rotate` VALUES ('13', 'http://localhost:8000/static/upload/1534053755642342.jpg', '17', '1');
INSERT INTO `rotate` VALUES ('20', 'http://localhost:8000/static/upload/1534054132062626.jpg', '17', '1');
INSERT INTO `rotate` VALUES ('21', 'http://localhost:8000/static/upload/1534054141986850.jpg', '21', '1');
INSERT INTO `rotate` VALUES ('23', 'http://localhost:8000/static/upload/1534055904219798.jpg', '17', '1');

-- ----------------------------
-- Table structure for `share`
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `sid` int(10) NOT NULL AUTO_INCREMENT COMMENT '分享自增id',
  `sname` varchar(32) DEFAULT NULL,
  `scid` int(10) DEFAULT NULL COMMENT '分享的哪条内容，需要关联内容表',
  `scname` int(10) DEFAULT NULL COMMENT '分享的内容属于哪个具体的用户，需要关联用户表',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share
-- ----------------------------
INSERT INTO `share` VALUES ('1', 'dwsc', '1', null);

-- ----------------------------
-- Table structure for `types`
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `tid` int(10) NOT NULL AUTO_INCREMENT COMMENT '分类自增id',
  `tname` varchar(32) DEFAULT NULL COMMENT '分类的类型',
  `ttid` int(10) DEFAULT NULL COMMENT '分类的唯一标识',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES ('1', 'UI/UX', '1');
INSERT INTO `types` VALUES ('2', '平面', '2');
INSERT INTO `types` VALUES ('3', '插图/漫画', '3');
INSERT INTO `types` VALUES ('4', '工业设计', '4');
INSERT INTO `types` VALUES ('5', '建筑设计', '5');
INSERT INTO `types` VALUES ('6', '游戏设计', '6');
INSERT INTO `types` VALUES ('7', '纯手工业', '7');
INSERT INTO `types` VALUES ('8', '纯艺术', '8');
INSERT INTO `types` VALUES ('9', '网页', '9');
INSERT INTO `types` VALUES ('10', '海报', '10');
INSERT INTO `types` VALUES ('11', '服装', '11');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户自增id',
  `uname` varchar(32) DEFAULT NULL COMMENT '用户名',
  `upass` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `uaddr` varchar(255) DEFAULT NULL COMMENT '工作低点',
  `uposition` varchar(40) DEFAULT NULL COMMENT '职位',
  `ulabel` varchar(255) DEFAULT NULL COMMENT '标签',
  `umotto` varchar(400) DEFAULT NULL COMMENT '座右铭',
  `ugrade` tinyint(10) DEFAULT NULL COMMENT '评级',
  `uimage` varchar(255) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('17', 'Victoria', 'e10adc3949ba59abbe56e057f20f883e', '北京', 'UI设计师', '设计大师', '设计的本质是满足需要', '4', 'http://localhost:8000/static/upload/1534052945232919.png');
INSERT INTO `user` VALUES ('18', 'Beckham', 'e10adc3949ba59abbe56e057f20f883e', '北京', 'UI设计师', '专业', '设计的本质就是满足需要', '2', 'http://localhost:8000/static/upload/1534053215371345.png');
INSERT INTO `user` VALUES ('19', 'Christina', 'e10adc3949ba59abbe56e057f20f883e', '北京', 'UI设计师', '设计大师', '设计的本质就是满足需要', '1', 'http://localhost:8000/static/upload/1534053285850409.png');
INSERT INTO `user` VALUES ('20', 'Aguilera', 'e10adc3949ba59abbe56e057f20f883e', '北京', 'UI设计师', '专业', '设计的本质就是满足需要', '1', 'http://localhost:8000/static/upload/1534053359376459.png');
INSERT INTO `user` VALUES ('21', 'Hendricks', 'e10adc3949ba59abbe56e057f20f883e', '北京', 'UI设计师', '设计大师', '设计的本质就是满足需要', '1', 'http://localhost:8000/static/upload/1534053416768786.png');
INSERT INTO `user` VALUES ('22', 'Trundle', 'e10adc3949ba59abbe56e057f20f883e', '北京', 'UI设计师', '设计大师', '设计的本质就是满足需要', '1', 'http://localhost:8000/static/upload/153405350982992.png');
INSERT INTO `user` VALUES ('23', 'Papillon', 'e10adc3949ba59abbe56e057f20f883e', '北京', 'UI设计师', '设计大师', '设计的本质就是满足需要', '4', 'http://localhost:8000/static/upload/1534053582552510.png');
INSERT INTO `user` VALUES ('24', 'Papillon', 'e10adc3949ba59abbe56e057f20f883e', '北京', 'UI设计师', '设计大师', '设计的本质就是满足需要', '2', 'http://localhost:8000/static/upload/1534053635123516.png');
