/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : 12

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-08-01 15:52:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `by_ad`
-- ----------------------------
DROP TABLE IF EXISTS `by_ad`;
CREATE TABLE `by_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(225) DEFAULT '' COMMENT '标志',
  `title` varchar(225) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(225) NOT NULL DEFAULT '' COMMENT '链接',
  `meta_title` varchar(225) NOT NULL DEFAULT '',
  `place` varchar(225) NOT NULL DEFAULT '' COMMENT '位置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) DEFAULT '1' COMMENT '数据状态',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '广告图片',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of by_ad
-- ----------------------------
INSERT INTO `by_ad` VALUES ('1', '', '广告·1', 'article/detail?id=115', '', '1', '0', '0', '1', '181', '0');
INSERT INTO `by_ad` VALUES ('2', '', '首页公告2', 'http://yershop.com', '', '2', '0', '0', '1', '189', '0');

-- ----------------------------
-- Table structure for `by_attributes`
-- ----------------------------
DROP TABLE IF EXISTS `by_attributes`;
CREATE TABLE `by_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` smallint(2) NOT NULL DEFAULT '0',
  `group_id` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of by_attributes
-- ----------------------------
INSERT INTO `by_attributes` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '1', '1383894778', '1383891233', '0', '0');
INSERT INTO `by_attributes` VALUES ('129', 'covers', '图集', '', 'photo', '', '', '1', '', '2', '0', '0', '0', '0', '1');
INSERT INTO `by_attributes` VALUES ('139', 'url', 'url', '', 'string', '', '', '1', '', '4', '0', '0', '0', '0', '0');
INSERT INTO `by_attributes` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '[DOCUMENT_POSITION]', '1', '1', '1383895640', '1383891233', '0', '0');
INSERT INTO `by_attributes` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '1', '1384147827', '1383891233', '0', '0');
INSERT INTO `by_attributes` VALUES ('133', 'language', '软件语言', '', 'string', '', '', '1', '', '3', '0', '0', '0', '0', '1');
INSERT INTO `by_attributes` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '1', '1387163248', '1383891233', '0', '0');
INSERT INTO `by_attributes` VALUES ('131', 'url', '下载地址', '', 'string', '', '', '1', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `by_attributes` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '1', '1383895835', '1383891233', '0', '0');
INSERT INTO `by_attributes` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '1', '1383895846', '1383891233', '0', '0');
INSERT INTO `by_attributes` VALUES ('136', 'level', '评分等级', '', 'string', '', '', '1', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `by_attributes` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'date', '0', '', '1', '', '1', '1', '1383895903', '1383891233', '0', '1');
INSERT INTO `by_attributes` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'date', '0', '', '0', '', '1', '1', '1384508277', '1383891233', '0', '1');
INSERT INTO `by_attributes` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '1', '1384508496', '1383891233', '0', '0');
INSERT INTO `by_attributes` VALUES ('135', 'type', '软件类型', '', 'string', '', '', '1', '', '3', '0', '0', '0', '0', '1');
INSERT INTO `by_attributes` VALUES ('25', 'content', '内容', 'varchar(100) NOT NULL ', 'editor', '', '参照display方法参数的定义', '1', '', '1', '1', '1383896190', '1383891243', '0', '0');
INSERT INTO `by_attributes` VALUES ('134', 'platform', '软件平台', '', 'string', '', '', '1', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `by_attributes` VALUES ('132', 'authorize', '授权形式', '', 'string', '', '免费|商业版', '1', '', '3', '0', '0', '0', '0', '1');
INSERT INTO `by_attributes` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '1', '1383896415', '1383891252', '0', '0');
INSERT INTO `by_attributes` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '1', '1383896380', '1383891252', '0', '0');
INSERT INTO `by_attributes` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '1', '1383896371', '1383891252', '0', '0');

-- ----------------------------
-- Table structure for `by_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `by_auth_group`;
CREATE TABLE `by_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `group_id` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of by_auth_group
-- ----------------------------
INSERT INTO `by_auth_group` VALUES ('6', 'admin', '1', '文员', '457654564', '1', '68,74,77,83', '0');
INSERT INTO `by_auth_group` VALUES ('7', 'admin', '1', '美工', '    cursor: pointer;', '1', '74,77,78,127,128,129,133', '0');
INSERT INTO `by_auth_group` VALUES ('8', 'admin', '1', '程序员', '', '1', '', '0');

-- ----------------------------
-- Table structure for `by_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `by_auth_group_access`;
CREATE TABLE `by_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  `id` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of by_auth_group_access
-- ----------------------------
INSERT INTO `by_auth_group_access` VALUES ('6', '3', '0');
INSERT INTO `by_auth_group_access` VALUES ('6', '2', '0');
INSERT INTO `by_auth_group_access` VALUES ('9', '6', '0');
INSERT INTO `by_auth_group_access` VALUES ('9', '7', '0');

-- ----------------------------
-- Table structure for `by_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `by_auth_rule`;
CREATE TABLE `by_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=259 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of by_auth_rule
-- ----------------------------
INSERT INTO `by_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `by_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/index', '文章', '1', '');
INSERT INTO `by_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `by_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `by_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `by_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `by_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `by_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `by_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `by_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `by_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `by_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `by_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `by_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `by_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `by_auth_rule` VALUES ('17', 'admin', '1', 'Admin/Article/examine', '审核列表', '1', '');
INSERT INTO `by_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `by_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `by_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `by_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `by_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `by_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `by_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `by_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `by_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `by_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `by_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `by_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `by_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `by_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `by_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `by_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `by_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `by_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `by_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `by_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `by_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `by_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `by_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `by_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `by_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `by_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `by_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `by_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `by_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `by_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `by_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `by_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `by_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `by_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `by_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `by_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `by_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `by_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `by_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `by_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `by_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `by_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `by_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `by_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `by_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `by_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `by_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `by_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `by_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `by_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `by_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '商品分类', '1', '');
INSERT INTO `by_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `by_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `by_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `by_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `by_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `by_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `by_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `by_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `by_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `by_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `by_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `by_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `by_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `by_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `by_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `by_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `by_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `by_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `by_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `by_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `by_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `by_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `by_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `by_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `by_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `by_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `by_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `by_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `by_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `by_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `by_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `by_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `by_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `by_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `by_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `by_auth_rule` VALUES ('217', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `by_auth_rule` VALUES ('218', 'admin', '1', 'Admin/think/lists', '数据列表', '1', '');
INSERT INTO `by_auth_rule` VALUES ('219', 'admin', '1', 'Admin/Attributes/index', '属性配置', '1', '');
INSERT INTO `by_auth_rule` VALUES ('220', 'admin', '1', 'Admin/Brand/index', '品牌管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('221', 'admin', '1', 'Admin/Slide/index', '幻灯片', '1', '');
INSERT INTO `by_auth_rule` VALUES ('222', 'admin', '1', 'Admin/Ad/index', '广告', '1', '');
INSERT INTO `by_auth_rule` VALUES ('223', 'admin', '1', 'Admin/Check/index', '商家审核', '1', '');
INSERT INTO `by_auth_rule` VALUES ('224', 'admin', '1', 'Admin/SellerMenu/index', '后台菜单', '1', '');
INSERT INTO `by_auth_rule` VALUES ('225', 'admin', '1', 'Admin/Types/index', ' 商品类型', '1', '');
INSERT INTO `by_auth_rule` VALUES ('226', 'admin', '1', 'Admin/Order/index', '提交订单', '1', '');
INSERT INTO `by_auth_rule` VALUES ('227', 'admin', '1', 'Admin/GoodsAttributes/index', '商品属性', '1', '');
INSERT INTO `by_auth_rule` VALUES ('228', 'admin', '1', 'Admin/Cancel/index', '取消管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('229', 'admin', '1', 'Admin/Catearticle/index', '文章分类', '1', '');
INSERT INTO `by_auth_rule` VALUES ('230', 'admin', '1', 'Admin/Goods/index', '商品列表', '1', '');
INSERT INTO `by_auth_rule` VALUES ('231', 'admin', '1', 'Admin/Back/index', '正退货订单', '1', '');
INSERT INTO `by_auth_rule` VALUES ('232', 'admin', '1', 'Admin/Stock/index', '库存sku', '1', '');
INSERT INTO `by_auth_rule` VALUES ('233', 'admin', '1', 'Admin/Fcoupon/index', '优惠券', '1', '');
INSERT INTO `by_auth_rule` VALUES ('234', 'admin', '1', 'Admin/Change/index', '换货管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('235', 'admin', '2', 'Admin/Goods/index', '商品', '1', '');
INSERT INTO `by_auth_rule` VALUES ('236', 'admin', '1', 'Admin/Backrefuse/index', '拒绝退货订单', '1', '');
INSERT INTO `by_auth_rule` VALUES ('237', 'admin', '2', 'Admin/Order/index', '订单', '1', '');
INSERT INTO `by_auth_rule` VALUES ('238', 'admin', '1', 'Admin/UserLog/index', '日志管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('239', 'admin', '1', 'Admin/Backon/index', '退货中订单', '1', '');
INSERT INTO `by_auth_rule` VALUES ('240', 'admin', '1', 'Admin/Email/index', '邮件管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('241', 'admin', '1', 'Admin/Backagree/index', '同意退货订单', '1', '');
INSERT INTO `by_auth_rule` VALUES ('242', 'admin', '1', 'Admin/Sms/index', '短信管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('243', 'admin', '1', 'Admin/Reserve/index', '预约列表', '1', '');
INSERT INTO `by_auth_rule` VALUES ('244', 'admin', '1', 'Admin/Backover/index', '已退货订单', '1', '');
INSERT INTO `by_auth_rule` VALUES ('245', 'admin', '1', 'Admin/Pay/index', '支付管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('246', 'admin', '1', 'Admin/Envelope/index', '站内信管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('247', 'admin', '1', 'Admin/Express/index', ' 快递管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('248', 'admin', '2', 'Admin/Slide/index', '广告', '1', '');
INSERT INTO `by_auth_rule` VALUES ('249', 'admin', '1', 'Admin/Message/index', '留言管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('250', 'admin', '1', 'Admin/Reply/index', '回复管理', '1', '');
INSERT INTO `by_auth_rule` VALUES ('251', 'admin', '2', 'Admin/Check/index', '商家', '1', '');
INSERT INTO `by_auth_rule` VALUES ('252', 'admin', '1', 'Admin/Statistics/index', '今日销量统计', '1', '');
INSERT INTO `by_auth_rule` VALUES ('253', 'admin', '1', 'Admin/Statistics/week', '本周销量统计', '1', '');
INSERT INTO `by_auth_rule` VALUES ('254', 'admin', '1', 'Admin/Statistics/month', '本月销量统计', '1', '');
INSERT INTO `by_auth_rule` VALUES ('255', 'admin', '1', 'Admin/Report/index', '每日数据', '1', '');
INSERT INTO `by_auth_rule` VALUES ('256', 'admin', '1', 'Admin/Report/week', '每周数据', '1', '');
INSERT INTO `by_auth_rule` VALUES ('257', 'admin', '1', 'Admin/Report/month', '每月统计', '1', '');
INSERT INTO `by_auth_rule` VALUES ('258', 'admin', '1', 'Admin/Lookup/index', '流量统计', '1', '');

-- ----------------------------
-- Table structure for `by_category`
-- ----------------------------
DROP TABLE IF EXISTS `by_category`;
CREATE TABLE `by_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) DEFAULT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) DEFAULT NULL COMMENT 'SEO的网页标题',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `template_index` varchar(100) DEFAULT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) DEFAULT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) DEFAULT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) DEFAULT NULL COMMENT '编辑页模板',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '允许发布的内容类型',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `content` text,
  `model_id` int(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of by_category
-- ----------------------------
INSERT INTO `by_category` VALUES ('159', '', ' 国内新闻', '0', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('160', '', '国内', '159', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '2');
INSERT INTO `by_category` VALUES ('161', '', '科技', '160', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('162', '', '国际新闻', '0', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('163', '', '文化时尚', '0', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('164', '', '娱乐体育', '0', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('165', '', '全球', '162', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('166', '', '资讯报道', '165', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('167', '', '文化', '163', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '3');
INSERT INTO `by_category` VALUES ('168', '', '文学', '167', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('169', '', '体育', '164', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('170', '', '足球', '169', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('171', '', '篮球', '169', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('172', '', '公司简介', '0', '0', '10', '', '', '', '', '', '', '', '1', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('173', '', '关于我们', '172', '0', '10', '', '', '', '', '', '', '', '1', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('174', '', '联系方式', '172', '0', '10', '', '', '', '', '', '', '', '1', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('175', '', '版权声明', '172', '0', '10', '', '', '', '', '', '', '', '1', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('176', '', '招聘信息', '172', '0', '10', '', '', '', '', '', '', '', '1', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('177', '', '欧洲', '162', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('178', '', '娱乐', '164', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('179', '', '明星', '178', '0', '10', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('181', '', '公告', '0', '0', '0', '', '', '', '', '', '', '', '2', '0', '0', '1', '', '1');
INSERT INTO `by_category` VALUES ('182', '', '军事', '0', '0', '0', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '2');
INSERT INTO `by_category` VALUES ('183', '', '影像', '0', '0', '0', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '2');
INSERT INTO `by_category` VALUES ('184', '', '聊天通讯', '0', '0', '0', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '3');
INSERT INTO `by_category` VALUES ('185', '', '浏览器', '0', '0', '0', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '3');
INSERT INTO `by_category` VALUES ('186', '', '音乐播放', '0', '0', '0', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '3');
INSERT INTO `by_category` VALUES ('187', '', '图像编辑', '0', '0', '0', '', '', '', '', '', '', '', '0', '0', '0', '1', '', '3');
INSERT INTO `by_category` VALUES ('188', null, '视频', '0', '0', '0', null, null, null, null, '', null, null, '0', '0', '0', '1', null, '4');

-- ----------------------------
-- Table structure for `by_channel`
-- ----------------------------
DROP TABLE IF EXISTS `by_channel`;
CREATE TABLE `by_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` varchar(225) DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of by_channel
-- ----------------------------
INSERT INTO `by_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '_self');
INSERT INTO `by_channel` VALUES ('9', '0', '图片新闻', 'Index/pic', '6', '0', '0', '1', '_self');
INSERT INTO `by_channel` VALUES ('10', '0', '下载', 'index/download', '6', '0', '0', '1', '_self');

-- ----------------------------
-- Table structure for `by_collect`
-- ----------------------------
DROP TABLE IF EXISTS `by_collect`;
CREATE TABLE `by_collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `key` varchar(225) DEFAULT '' COMMENT 'key',
  `doc_id` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='密钥表';

-- ----------------------------
-- Records of by_collect
-- ----------------------------

-- ----------------------------
-- Table structure for `by_comment`
-- ----------------------------
DROP TABLE IF EXISTS `by_comment`;
CREATE TABLE `by_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) NOT NULL DEFAULT '0',
  `content` text CHARACTER SET utf8 NOT NULL,
  `uid` int(10) NOT NULL DEFAULT '0',
  `doc_id` int(10) NOT NULL DEFAULT '0',
  `pid` int(10) NOT NULL DEFAULT '0',
  `zan` int(10) NOT NULL DEFAULT '0',
  `key` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of by_comment
-- ----------------------------
INSERT INTO `by_comment` VALUES ('50', '1496114194', '3465547', '1', '92', '0', '11', null);
INSERT INTO `by_comment` VALUES ('51', '1496114245', '45654765', '1', '92', '0', '16', null);
INSERT INTO `by_comment` VALUES ('52', '1496115471', '43543', '1', '92', '0', '9', null);
INSERT INTO `by_comment` VALUES ('53', '1496115808', '2342424', '1', '92', '50', '4', null);
INSERT INTO `by_comment` VALUES ('54', '1496117342', '564645', '1', '115', '0', '0', null);
INSERT INTO `by_comment` VALUES ('55', '0', '1232', '0', '90', '0', '4', null);
INSERT INTO `by_comment` VALUES ('56', '0', '123', '0', '92', '0', '10', '');
INSERT INTO `by_comment` VALUES ('57', '0', '123', '0', '88', '0', '10', '');
INSERT INTO `by_comment` VALUES ('58', '0', '123456', '0', '94', '0', '1', '');
INSERT INTO `by_comment` VALUES ('59', '0', '123', '0', '200', '0', '0', '');
INSERT INTO `by_comment` VALUES ('60', '0', '123456', '0', '180', '0', '0', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017');
INSERT INTO `by_comment` VALUES ('61', '0', '113456', '0', '92', '0', '4', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017');
INSERT INTO `by_comment` VALUES ('62', '0', '', '0', '88', '0', '11', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501400592');
INSERT INTO `by_comment` VALUES ('63', '0', '', '0', '90', '0', '9', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501414757');
INSERT INTO `by_comment` VALUES ('64', '0', '123', '0', '211', '0', '6', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177');
INSERT INTO `by_comment` VALUES ('65', '0', '123', '0', '95', '0', '0', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177');
INSERT INTO `by_comment` VALUES ('66', '0', '回复undefined:123456', '0', '88', '0', '8', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177');
INSERT INTO `by_comment` VALUES ('67', '0', '122334556', '0', '92', '0', '0', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177');
INSERT INTO `by_comment` VALUES ('68', '0', '好看', '0', '207', '0', '0', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177');
INSERT INTO `by_comment` VALUES ('69', '0', '', '0', '212', '0', '2', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177');
INSERT INTO `by_comment` VALUES ('70', '0', '好听', '0', '208', '0', '0', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177');
INSERT INTO `by_comment` VALUES ('71', '0', '好听', '0', '213', '0', '1', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177');
INSERT INTO `by_comment` VALUES ('72', '0', '', '0', '89', '0', '1', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177');

-- ----------------------------
-- Table structure for `by_comments`
-- ----------------------------
DROP TABLE IF EXISTS `by_comments`;
CREATE TABLE `by_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) NOT NULL DEFAULT '0',
  `message` text CHARACTER SET utf8 NOT NULL,
  `uid` int(10) NOT NULL DEFAULT '0',
  `reply` varchar(225) CHARACTER SET utf8 DEFAULT NULL,
  `pictures` varchar(225) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片回复',
  `is_picture` int(1) NOT NULL DEFAULT '0',
  `goods_id` int(10) NOT NULL DEFAULT '0',
  `is_hide` int(10) NOT NULL DEFAULT '0',
  `is_over` int(10) NOT NULL DEFAULT '0',
  `not_empty` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of by_comments
-- ----------------------------
INSERT INTO `by_comments` VALUES ('1', '2147483647', '很好！', '0', '127.0.0.1', null, '0', '0', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('2', '2147483647', '嗯嗯，不错！', '0', '127.0.0.1', null, '0', '0', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('3', '2147483647', '我也评论一下，嘿嘿~', '0', '127.0.0.1', null, '0', '0', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('4', '2147483647', '产品2的评论1.', '0', '127.0.0.1', null, '0', '0', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('5', '2147483647', '啊啊啊啊', '0', '127.0.0.1', null, '0', '0', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('6', '2147483647', '产品3评论', '0', '127.0.0.1', null, '0', '0', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('7', '2147483647', '再加评论！', '0', '127.0.0.1', null, '0', '0', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('8', '2147483647', '写一条很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的测试评论。', '0', '127.0.0.1', null, '0', '0', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('9', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('10', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('11', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('12', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('13', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('14', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('15', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('16', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('17', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('18', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('19', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('20', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('21', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('22', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('23', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('24', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('25', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('26', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('27', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('28', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('29', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('30', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('31', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('32', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('33', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('34', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('35', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('36', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('37', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('38', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('39', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('40', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('41', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('42', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('43', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('44', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('45', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('46', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('47', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('48', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');
INSERT INTO `by_comments` VALUES ('49', '1421503470', '比我想象中的要好很多，实惠实用，组装特别简单，值得入手', '1', '感谢亲的好评，授人玫瑰手有余香，您的好评是对我们最大的支持与鼓励，也将是我们不断前进的动力！有您的支持和肯定，我们会更加努力做到更好，如果亲有不满意的地方请一定及时联系我们哦，不周到的地方还请亲们多多谅解哈。!期待您的再次光临！', '1,2,3,4', '1', '66', '0', '0', '0');

-- ----------------------------
-- Table structure for `by_config`
-- ----------------------------
DROP TABLE IF EXISTS `by_config`;
CREATE TABLE `by_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` varchar(225) NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` varchar(225) DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of by_config
-- ----------------------------
INSERT INTO `by_config` VALUES ('1', 'WEB_SITE_TITLE', 'string', '网站标题', '0', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', '贝云cms（bycms)内容管理系统', '0');
INSERT INTO `by_config` VALUES ('2', 'DESCRIPTION', 'textarea', '网站描述', '0', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', '贝云cms（bycms)内容管理系统', '1');
INSERT INTO `by_config` VALUES ('3', 'KEYWORD', 'textarea', '网站关键字', '0', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'bycms,yershop,OneThink商城，thinkphp商城系统', '8');
INSERT INTO `by_config` VALUES ('4', 'WEB_SITE_CLOSE', 'select', '关闭站点', '0', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `by_config` VALUES ('100', 'QQKEY', 'text', 'QqKEY', '2', '', 'qq登录key', '0', '0', '0', '', '0');
INSERT INTO `by_config` VALUES ('101', 'QQSECRET', 'text', 'QqSecret', '2', '', 'qq登录密钥', '0', '0', '0', '', '0');
INSERT INTO `by_config` VALUES ('99', 'ISDES', 'select', '是否左右栏显示', '1', '0:否,1:是', '', '0', '0', '0', '1', '0');
INSERT INTO `by_config` VALUES ('92', 'LOGO', 'picture', '网站logo', '0', '', '网站logo', '0', '0', '0', '330', '0');
INSERT INTO `by_config` VALUES ('108', 'COLOR', 'color', '主题', '1', '', '推荐值#2982ce,#0099cc', '0', '0', '0', '#03a9f4 ', '0');
INSERT INTO `by_config` VALUES ('91', 'GROUP', 'text', '配置分组', '-1', '', '', '0', '0', '0', '基本|高级|接口', '0');
INSERT INTO `by_config` VALUES ('102', 'DIALOG_STYLE', 'select', '提示框弹窗类型', '1', '0:旧式风格,\r\n1:Dialog', '处理成功后弹出类型', '0', '0', '0', '1', '0');
INSERT INTO `by_config` VALUES ('106', 'USER_ALLOW_REGISTER', 'select', '是否开启会员注册', '1', '0:关闭,1:开启', '0:关闭,1:开启', '0', '0', '0', '1', '0');
INSERT INTO `by_config` VALUES ('107', 'DOCUMENT_GROUP', 'string', '文档分组', '1', '', '', '0', '0', '0', '基本|高级', '0');
INSERT INTO `by_config` VALUES ('109', 'BTN', 'color', '按钮背景色', '1', '#5ebc62', '', '0', '0', '0', '#10926B', '0');
INSERT INTO `by_config` VALUES ('110', 'HUYI_USERNAME', 'string', '互亿短信用户名', '2', '', '申请地址：http://www.ihuyi.com/，由平台提供', '0', '0', '0', '', '0');
INSERT INTO `by_config` VALUES ('111', 'HUYI_PASSWORD', 'string', '互亿短信密码', '2', '', '申请地址：http://www.ihuyi.com/，由平台提供', '0', '0', '0', '', '0');

-- ----------------------------
-- Table structure for `by_count`
-- ----------------------------
DROP TABLE IF EXISTS `by_count`;
CREATE TABLE `by_count` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `mark` text NOT NULL COMMENT '名称',
  `num` tinyint(10) NOT NULL DEFAULT '0' COMMENT '数量',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `model` varchar(225) DEFAULT NULL,
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of by_count
-- ----------------------------
INSERT INTO `by_count` VALUES ('3', '访客数+1', '67', '1495735475', '0', 'visitor', '20170526');
INSERT INTO `by_count` VALUES ('2', '访客数+1', '39', '1495650488', '0', 'visitor', '20170525');
INSERT INTO `by_count` VALUES ('4', '访客数+1', '40', '1495816863', '0', 'visitor', '20170527');
INSERT INTO `by_count` VALUES ('5', '访客数+1', '127', '1495904307', '0', 'visitor', '20170528');
INSERT INTO `by_count` VALUES ('6', '访客数+1', '127', '1495989967', '0', 'visitor', '20170529');
INSERT INTO `by_count` VALUES ('7', '访客数+1', '1', '1496075914', '0', 'visitor', '20170530');
INSERT INTO `by_count` VALUES ('8', '访客数+1', '1', '1496164635', '0', 'visitor', '20170531');
INSERT INTO `by_count` VALUES ('9', '访客数+1', '1', '1496246877', '0', 'visitor', '20170601');
INSERT INTO `by_count` VALUES ('10', '访客数+1', '1', '1496336434', '0', 'visitor', '20170602');
INSERT INTO `by_count` VALUES ('11', '访客数+1', '1', '1496426069', '0', 'visitor', '20170603');
INSERT INTO `by_count` VALUES ('12', '访客数+1', '1', '1496505639', '0', 'visitor', '20170604');
INSERT INTO `by_count` VALUES ('13', '访客数+1', '1', '1496596366', '0', 'visitor', '20170605');
INSERT INTO `by_count` VALUES ('14', '访客数+1', '1', '1496682539', '0', 'visitor', '20170606');
INSERT INTO `by_count` VALUES ('15', '访客数+1', '1', '1496772827', '0', 'visitor', '20170607');
INSERT INTO `by_count` VALUES ('16', '会员注册数+1', '1', '1496805687', '0', 'member', '20170607');
INSERT INTO `by_count` VALUES ('17', '访客数+1', '1', '1496857593', '0', 'visitor', '20170608');
INSERT INTO `by_count` VALUES ('18', '访客数+1', '1', '1496944253', '0', 'visitor', '20170609');
INSERT INTO `by_count` VALUES ('19', '访客数+1', '1', '1497040379', '0', 'visitor', '20170610');
INSERT INTO `by_count` VALUES ('20', '访客数+1', '1', '1497153562', '0', 'visitor', '20170611');
INSERT INTO `by_count` VALUES ('21', '访客数+1', '1', '1497954839', '0', 'visitor', '20170620');
INSERT INTO `by_count` VALUES ('22', '访客数+1', '1', '1497982230', '0', 'visitor', '20170621');
INSERT INTO `by_count` VALUES ('23', '访客数+1', '1', '1498064055', '0', 'visitor', '20170622');
INSERT INTO `by_count` VALUES ('24', '访客数+1', '1', '1498148498', '0', 'visitor', '20170623');
INSERT INTO `by_count` VALUES ('25', '访客数+1', '1', '1498257524', '0', 'visitor', '20170624');
INSERT INTO `by_count` VALUES ('26', '访客数+1', '1', '1498582577', '0', 'visitor', '20170628');
INSERT INTO `by_count` VALUES ('27', '访客数+1', '1', '1498665956', '0', 'visitor', '20170629');
INSERT INTO `by_count` VALUES ('28', '访客数+1', '1', '1498753988', '0', 'visitor', '20170630');
INSERT INTO `by_count` VALUES ('29', '访客数+1', '1', '1498851439', '0', 'visitor', '20170701');
INSERT INTO `by_count` VALUES ('30', '访客数+1', '1', '1499281581', '0', 'visitor', '20170706');
INSERT INTO `by_count` VALUES ('31', '访客数+1', '1', '1499534594', '0', 'visitor', '20170709');
INSERT INTO `by_count` VALUES ('32', '访客数+1', '1', '1499662369', '0', 'visitor', '20170710');
INSERT INTO `by_count` VALUES ('33', '访客数+1', '1', '1499704702', '0', 'visitor', '20170711');
INSERT INTO `by_count` VALUES ('34', '访客数+1', '1', '1499908769', '0', 'visitor', '20170713');
INSERT INTO `by_count` VALUES ('35', '访客数+1', '1', '1500184184', '0', 'visitor', '20170716');
INSERT INTO `by_count` VALUES ('36', '会员注册数+1', '1', '1500197997', '0', 'member', '20170716');
INSERT INTO `by_count` VALUES ('37', '访客数+1', '1', '1500220871', '0', 'visitor', '20170717');
INSERT INTO `by_count` VALUES ('38', '访客数+1', '1', '1500319829', '0', 'visitor', '20170718');
INSERT INTO `by_count` VALUES ('39', '访客数+1', '1', '1500395930', '0', 'visitor', '20170719');
INSERT INTO `by_count` VALUES ('40', '访客数+1', '1', '1500480077', '0', 'visitor', '20170720');
INSERT INTO `by_count` VALUES ('41', '访客数+1', '1', '1500568421', '0', 'visitor', '20170721');
INSERT INTO `by_count` VALUES ('42', '访客数+1', '1', '1500653339', '0', 'visitor', '20170722');
INSERT INTO `by_count` VALUES ('43', '访客数+1', '1', '1500744937', '0', 'visitor', '20170723');
INSERT INTO `by_count` VALUES ('44', '访客数+1', '1', '1500825832', '0', 'visitor', '20170724');
INSERT INTO `by_count` VALUES ('45', '访客数+1', '1', '1500912309', '0', 'visitor', '20170725');
INSERT INTO `by_count` VALUES ('46', '访客数+1', '1', '1501008105', '0', 'visitor', '20170726');
INSERT INTO `by_count` VALUES ('47', '访客数+1', '1', '1501086454', '0', 'visitor', '20170727');
INSERT INTO `by_count` VALUES ('48', '访客数+1', '1', '1501176331', '0', 'visitor', '20170728');
INSERT INTO `by_count` VALUES ('49', '会员注册数+1', '1', '1501220465', '0', 'member', '20170728');
INSERT INTO `by_count` VALUES ('50', '访客数+1', '1', '1501257967', '0', 'visitor', '20170729');
INSERT INTO `by_count` VALUES ('51', '访客数+1', '1', '1501344502', '0', 'visitor', '20170730');
INSERT INTO `by_count` VALUES ('52', '访客数+1', '1', '1501432188', '0', 'visitor', '20170731');
INSERT INTO `by_count` VALUES ('53', '访客数+1', '1', '1501517545', '0', 'visitor', '20170801');
INSERT INTO `by_count` VALUES ('54', '会员注册数+1', '1', '1501569174', '0', 'member', '20170801');

-- ----------------------------
-- Table structure for `by_document`
-- ----------------------------
DROP TABLE IF EXISTS `by_document`;
CREATE TABLE `by_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(80) DEFAULT NULL COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `content` text NOT NULL,
  `sort` tinyint(2) NOT NULL DEFAULT '0',
  `description` varchar(225) DEFAULT NULL,
  `comments` int(10) NOT NULL DEFAULT '0',
  `position` int(10) NOT NULL DEFAULT '0',
  `model_id` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`) USING BTREE,
  KEY `idx_status_type_pid` (`status`,`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of by_document
-- ----------------------------
INSERT INTO `by_document` VALUES ('88', '1', '登山爱好者在森林里拍摄到的外星人', '161', '182', '1927', '1496118710', '1496118710', '1', '<span style=\"color:#777777;font-family:tahoma, arial, 宋体, sans-serif;background-color:#FFFFFF;\">中广网上海11月7日消息 日前，广州市工商局公布的第三季度三类食品质量检验结果公布，...</span>', '0', '', '3', '2', '1');
INSERT INTO `by_document` VALUES ('89', '1', '公安部：年内完成好1300万人落户硬任务', '161', '290', '1480', '1496118486', '1500519833', '1', '<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　新华社北京４月２８日电（记者 刘奕湛）记者２８日从公安部获悉，公安机关将切实在重点群体落户、居住证制度全覆盖、促进“新市民”社会融入上下功夫，进一步放宽落户条件、拓宽落户通道，完成好年内１３００万人落户硬任务。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　　据介绍，今年７月份在全国范围内全面实施居民身份证异地受理、挂失申报和丢失招领制度；建立解决无户口人员登记户口问题工作机制，清除政策性障碍，年底前基本解决无户口人员落户问题，并防止产生新的无户口人员。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　　今年，全面深化公安改革将进一步突出五个方面的重点改革任务，主要包括民生领域改革、深化“放管服”改革、执法权力运行机制改革、人民警察管理制度改革、警务机制改革等。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　　记者了解到，公安机关围绕实施京津冀协同发展、长江经济带发展等国家战略，将不断推出更多服务经济社会发展和便民利民惠民新举措，激发社会创造活力；进一步简化优化服务流程、方便群众办事创业，公安部确定的２８项措施全部落实到位。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　　此外，在执法权力运行机制改革方面，深化执法监督管理体系建设，持续推动受立案制度改革，进一步提升执法监督管理水平；深化执法办案制度改革，推行刑事案件法制部门统一审核、统一出口制度，大力推进办案中心建设和执法信息化建设。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　　公安部改革办负责人表示，全国公安机关将投入更多力量抓改革推进落实，投入更多精力抓改革督察问效，不断巩固和扩大改革成果，确保年内公安改革重点任务如期完成、取得实效。\r\n</p>', '0', '', '1', '2', '1');
INSERT INTO `by_document` VALUES ('90', '1', '李克强考察中国航天科工集团', '161', '288', '1206', '1496118419', '1500519722', '1', '<p class=\"detailPic\" style=\"vertical-align:baseline;font-family:\" font-size:16px;color:#222222;text-align:justify;text-indent:2em;background-color:#ffffff;\"=\"\"> <img src=\"http://p0.ifengimg.com/fck/2017_17/77686f0632b8895_w800_h545.jpg\" width=\"600\" alt=\"\" style=\"height:auto;\" /> \r\n	</p>\r\n<p style=\"vertical-align:baseline;font-family:\" font-size:16px;color:#222222;text-align:justify;text-indent:2em;background-color:#ffffff;\"=\"\">\r\n	原标题：李克强在考察中国航天科工集团时强调依靠抓改革调结构促创新推央企提质增效促实体经济转型升级\r\n</p>\r\n<p style=\"vertical-align:baseline;font-family:\" font-size:16px;color:#222222;text-align:justify;text-indent:2em;background-color:#ffffff;\"=\"\">\r\n	新华社北京4月28日电\r\n	</p>\r\n<p style=\"vertical-align:baseline;font-family:\" font-size:16px;color:#222222;text-align:justify;text-indent:2em;background-color:#ffffff;\"=\"\">\r\n	4月27日，中共中央政治局常委、国务院总理李克强考察中国航天科工集团并主持召开现场会。\r\n</p>\r\n<p style=\"vertical-align:baseline;font-family:\" font-size:16px;color:#222222;text-align:justify;text-indent:2em;background-color:#ffffff;\"=\"\">\r\n	李克强来到雍和航星科技园，航天科工集团负责人汇报了他们打造航天云网、开展“双创”的情况。听到企业依托“互联网＋”平台，不仅内部活跃着2000多个“双创”团队，而且广泛聚集社会上各类创客和创新资源，既解决自身难题，更带动提升全社会创业创新热情和创造能力，李克强表示赞许。他详细了解企业开展“双创”在机制和模式上有哪些创新，在降成本、拓市场方面成效如何，能带动多少社会就业。他还与在航天云网平台上注册的外地创客视频连线、互动交流，勉励他们借助平台优势，通过“双创”不断攀登新的高峰。李克强说，“双创”既是小企业生存发展之路，也是大企业繁荣昌盛之道。央企技术、人才、资金、资源雄厚，开展“双创”站位更高、潜力更大、机遇更多，大有可为。“双创”实质上是一场改革，它抓住了生产力中“人”这个关键，依托“互联网＋”把无数“个脑”联接成“群脑”，实现企业需求与社会海量创新资源的精准对接，既可以提升大企业创新能力，又能够催生出无数个小创客CEO，将极大增强经济社会发展动力。中航工业、中国电科、中国电信、中国移动、中国电子、招商局集团、中国普天等中央企业负责人现场也向李克强汇报了他们开展“双创”的情况和相关成果。李克强对央企积极探索各具特色的“双创”和创新产品中的巧妙创意予以肯定。\r\n	</p>\r\n<p style=\"vertical-align:baseline;font-family:\" font-size:16px;color:#222222;text-align:justify;text-indent:2em;background-color:#ffffff;\"=\"\">\r\n	随后，李克强主持召开中央企业现场会，国资委负责人作了汇报。李克强说，国资系统和国有企业广大员工在以习近平同志为核心的党中央坚强领导下，积极贯彻新发展理念，努力深化改革、攻坚克难，为经济社会发展作出了重要贡献。面对当前国际国内新形势，国企特别是央企要以供给侧结构性改革为主线，坚持以提高发展质量和效益为中心，主动作为，苦练内功，积极深化改革和调整结构，实施创新驱动发展战略，加快建设现代企业制度，着力推进瘦身健体、提质增效、增强核心竞争力，在淘汰落后、挖潜降本、做强主业上下功夫，保持效益回升态势，为巩固和发展经济向好势头提供有力支撑。\r\n</p>\r\n<p style=\"vertical-align:baseline;font-family:\" font-size:16px;color:#222222;text-align:justify;text-indent:2em;background-color:#ffffff;\"=\"\">\r\n	李克强指出，振兴实体经济必须加快新旧动能转换、走转型升级之路，\r\n	</p>', '0', '', '2', '4', '1');
INSERT INTO `by_document` VALUES ('92', '1', '云南白药总裁王明辉被免职 不保留国企领导身份待遇', '161', '289', '1111', '1493400134', '1500519760', '1', '<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p3.ifengimg.com/a/2017_17/e3381f815624ce8_size17_w268_h357.jpg\" width=\"268\" height=\"357\" alt=\"\" style=\"height:auto;\" /> \r\n</p>\r\n<p class=\"picIntro\" style=\"font-size:14px;text-align:center;font-family:楷体_gb2312, 楷体;color:#2B2B2B;background-color:#FFFFFF;\">\r\n	王明辉\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	原标题：关于王明辉等三名同志免职的通知\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	云南白药控股有限公司、云南世博旅游控股集团有限公司、云南文化产业投资控股集团有限责任公司：\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	省人民政府决定：\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	王明辉免去云南白药控股有限公司总裁职务，不再保留省属国有企业领导人员身份和相关待遇；\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	王冲免去云南世博旅游控股集团有限公司董事长职务；\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	陶国相免去云南文化产业投资控股集团有限责任公司董事长职务，不再保留省属国有企业领导人员身份和相关待遇。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	云南省人民政府\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	2017年4月22日\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p3.ifengimg.com/a/2017_17/d132c5da58d79dc_size13_w331_h287.jpg\" width=\"331\" height=\"287\" alt=\"\" style=\"height:auto;\" /> \r\n</p>', '0', '', '3', '0', '1');
INSERT INTO `by_document` VALUES ('93', '0', ' 外逃贪官就住隔壁！海外网友接力爆料', '166', '183', '772', '1493400440', '1493400440', '1', '<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	针对外逃的腐败分子，中国再次“放大招”了！\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	4月27日下午，中央追逃办公布了《关于部分外逃人员藏匿线索的公告》，该公告共包含22名外逃人员在海外可能的藏匿地，具体地址细化到了所在的街道和社区等。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/0a5c76b0813159e_w500_h317.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	据新华社报道，这22名外逃人员均为2015年4月国际刑警组织中国国家中心局集中公布的“百名红通人员”。<strong>而根据公告透露出的信息，本次被公开曝光的名单中人员，集中居住在美国、加拿大、新西兰、澳大利亚、英国、圣基茨和尼维斯等6个国家。</strong>\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/34acb90d5d604a5_w550_h639.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	这份从27日下午开始在互联网上被广泛转发的名单，很快也在海外网友中引发连锁性轰动效应。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<strong>“快看，你的邻居！”</strong>\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	“Max，你的邻居！”这是一个名为“Milos Petrovic”的澳大利亚网友28日发的一条脸书留言。留言所评述的，正是澳大利亚媒体发布的中国对外逃人员吉东升（Ji Dongsheng）进行通缉的新闻。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/937d1afd49439f5_w500_h111.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p class=\"picIntro\" style=\"font-size:14px;text-align:center;font-family:楷体_gb2312, 楷体;color:#2B2B2B;background-color:#FFFFFF;\">\r\n	&nbsp;\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<strong>参考消息网-锐参考</strong>顺着该留言发现，那个被朋友“艾特”了的、名为“Max Taddeo”的外国网友资料显示，其居住地是悉尼，而中央追逃办刚刚公布的吉东升可能藏身的具体地址也是悉尼同一区域：Ethel Street， Burwood， New South Wales，&nbsp;Australia。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	很快，这位澳大利亚网友Max回应了朋友的留言：“哈哈，我们隔壁街道究竟发生了什么？”\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/a89cd783489fe3c_w500_h113.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	从“邻居”的回应可以看出，Max的家确实与媒体披露的外逃人员吉东升的住址距离很近。这让人不禁好奇，是否可以通过Max的居住信息等，顺藤摸瓜挖出“红通”人员吉东升的居住地？\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	点击进入Max脸书发现，虽然他平时没有“晒”自家和邻居街区，但仍可以看出其生活环境相当优越。Max除了不时到海边晒晒太阳，还会西装革履地与女伴出席正式场合，小日子过得有滋有味。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/f7905781136560e_w473_h396.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p class=\"picIntro\" style=\"font-size:14px;text-align:center;font-family:楷体_gb2312, 楷体;color:#2B2B2B;background-color:#FFFFFF;\">\r\n	▲Max的脸书主页截图\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	根据中央追逃办公告披露的地址，吉东升可能身处悉尼宝活区的Ethel街道，这是华人聚居的高档社区。<strong>参考消息网-锐参考</strong>登录当地一家二手房交易网站搜索发现，Ethel街路段的住宅售价不菲，独栋住宅价格区间折合人民币在1000万到3000万之间。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/82aa83f93da42da_w492_h303.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p class=\"picIntro\" style=\"font-size:14px;text-align:center;font-family:楷体_gb2312, 楷体;color:#2B2B2B;background-color:#FFFFFF;\">\r\n	▲当地房屋交易网站截图显示：Ethel街上的某栋住宅售价为466万澳元（约合2400万元人民币）。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<strong>海外网友热议“怎样去抓丁义珍”</strong>\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	中央追逃办27日发布的公告，同样引发了更多其它地区海外网友的热烈响应。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	当地时间27日晚，一位身居非洲博茨瓦纳的外国网友，在脸书“中国发布‘红通’信息”新闻下留言“爆料”：“他们（外逃人员）就住在博茨瓦纳，不用跑那么远找了。”\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/94cc7fb753d1506_w500_h103.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	这位非洲网友所言是否属实尚待求证，但他的留言不禁让人想到《人民的名义》中的外逃贪官丁义珍，剧中，他正是从美国辗转逃往了非洲。直到最后在非洲“领了盒饭”——被射杀身亡。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/40c8960b2308b57_w500_h338.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p class=\"picIntro\" style=\"font-size:14px;text-align:center;font-family:楷体_gb2312, 楷体;color:#2B2B2B;background-color:#FFFFFF;\">\r\n	&nbsp;\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	&nbsp;\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<strong>与国内网友纷纷在社交媒体上为中央追逃办首次集中曝光贪官藏匿处叫好相比，对于生活在国外的网民来说，那些外逃贪官可能就“潜伏”在自己身边。</strong>\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	在海外华人论坛“北美华人e网”上，身居国外的华人也纷纷为此展开热烈讨论。“要不要做侯亮平”、“怎样去抓丁义珍”成为华人网友讨论的热门话题。有网友更是在帖子里披露了自己曾经接触的外逃贪官的行为特征：\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/5c1e28375822f78_w600_h128.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/7b32a5898f9fda9_w600_h158.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p class=\"picIntro\" style=\"font-size:14px;text-align:center;font-family:楷体_gb2312, 楷体;color:#2B2B2B;background-color:#FFFFFF;\">\r\n	&nbsp;\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	&nbsp;\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<strong>外逃者有人住大别墅，有人藏身“脏乱差”</strong>\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	根据中央追逃办公告披露的地址，<strong>参考消息网-锐参考</strong>通过谷歌地图将22名外逃分子的地址做了一番查找，发现了一个特别的现象。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	与电视剧《人民的名义》中丁义珍遭遇黑社会威胁、四处藏匿最后死于非洲不同，上了名单的这22人可能藏匿的地点，大多数在华人聚居区或当地的中高档社区，只有个别藏身贫民区。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	根据<strong>参考消息网-锐参考</strong>查询整理，<strong>22名外逃人员中，有11人的居住地属于当地的高档社区或度假别墅区。</strong>例如，2012年11月外逃至美国加州的徐雪伟。他可能居住的兰士堂小区（Lansdowne Place）在当地就属于富人区。在二手房交易网站上，该小区一套住宅售价为189万美元（约合约1300万元人民币）。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/6b7ad954f08f6bf_w486_h252.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	再比如先后在1998年和1999年外逃至美国的河北唐山豪门集团驻北京办事处原会计黄红，以及该集团原总裁贺业军。这两人很可能藏匿在同一个地点——佛罗里达州的一处海景豪宅。从谷歌街景上看，这是一处人气颇高的度假胜地。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/30b2cb5354542d2_w500_h320.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/5d43d2c010af699_w500_h348.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p class=\"picIntro\" style=\"font-size:14px;text-align:center;font-family:楷体_gb2312, 楷体;color:#2B2B2B;background-color:#FFFFFF;\">\r\n	▲谷歌地图显示，贺业军和黄红的潜逃目的地是佛罗里达州一处海景社区。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	还有10人则没有藏身豪宅，只是选择了当地普通中产街区，甚至有人住进了相对偏僻的小镇。如2013年7月外逃至美国的刘勖，他可能的藏身地是美国得克萨斯州舒格兰市。当地同一条街道上一套3卧2卫的住宅售价约为21万美元（约合145万元人民币）。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	22人名单中也有个例：只有一个人在海外的藏身地是当地远近闻名的“脏乱差”地区。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	2004年10月外逃到英国的刘湘建，他可能的住处显示为伦敦斯特拉特福德车站附近。这里位于伦敦东区，是少数族裔聚居区，居民收入水平偏低。在2012年伦敦举办奥运会之前，该地区长期被治安问题困扰。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/b3c8539ceb53c21_w450_h245.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p class=\"picIntro\" style=\"font-size:14px;text-align:center;font-family:楷体_gb2312, 楷体;color:#2B2B2B;background-color:#FFFFFF;\">\r\n	▲谷歌地图上的伦敦斯特拉特福德车站及周边地区\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<strong>专家：“让海内外‘侯亮平’们出手，是追逃方式的创新”</strong>\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	事实上，这22人名单也令一些外媒感到惊叹。“这是一次前所未有的举措。”美国《时代》周刊网站称赞道。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/8a676f603507808_w500_h200.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	而让“丁义珍”们在海外惶惶不可终日的，显然是中国最近几年的反腐行动。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	中央追逃办27日公布的一组数据显示，截至2017年3月31日，通过“天网行动”先后从90多个国家和地区追回外逃人员2873人，追回赃款89.9亿元人民币。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/fck/2017_17/87fef49ab3afcc6_w400_h224.jpg\" alt=\"\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	“这组数字说明我国反腐追逃追赃的成效十分显著，也必将震慑那些至今仍在外逃中的人员。”中国人民公安大学法学院教授陈志军告诉<strong>参考消息网-锐参考</strong>。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	而对于这次公布22名外逃人员可能的藏匿地点和详细信息，陈志军认为这是一个非常大的动作，也是一种工作方法上的创新。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<strong>“发动人民群众的力量来追逃，显然震慑作用更大，也有利于收到更多有价值的线索。”陈志军说，这样的追逃方式给外逃人员施加了强大的心理压力、同时加大了继续潜逃的难度，“让他们认识到，不要抱有侥幸心理、打消幻想，尽快回国接受法律的处理。”</strong><span class=\"ifengLogo\"><a href=\"http://www.ifeng.com/\" target=\"_blank\"><img src=\"http://p2.ifengimg.com/a/2016/0810/204c433878d5cf9size1_w16_h16.png\" style=\"height:auto;\" /></a></span>\r\n</p>', '0', '', '0', '0', '1');
INSERT INTO `by_document` VALUES ('94', '1', ' 朝鲜外务省发言人：正密切关注美国对朝动向', '166', '285', '623', '1493400749', '1500519603', '1', '<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	据朝中社报道，朝鲜外务省发言人21号发表谈话，称朝鲜正密切关注、美国对朝动向，并做好与美国对决的准备。发言人还谴责了澳大利亚外长毕晓普近日的涉朝言论。另外，在朝鲜首都平壤，多个加油站近日提供有限度服务，有报道指，当地已陷入油荒。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	朝鲜外务省发言人表示，朝鲜爱好和平，但也不会惧怕、回避战争。朝鲜军队已做好充分准备，如果美国要发动战争，朝鲜将奉陪到底，以全面战争应对全面战争，以[朝鲜式核打击战]应对核战争。&nbsp;\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	对于澳大利亚外长毕晓普日前指责朝鲜、严重威胁地区和世界和平，支持美国对朝政策。朝鲜外务省发言人表示谴责，并称毕晓普盲目追随美国，缺乏对半岛局势的基本常识。&nbsp;\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	而在朝鲜首都平壤，多个加油站本周开始提供有限度服务，站外大排长龙。有加油站张贴告示，表示当前只向持外交牌照的汽车售油。据悉，油价已经大幅上升，每公斤汽油比早前上涨大约五角半美元。有报道指，当地已经陷入油荒；也有报道称，事件与上调油价有关。凤凰卫视综合报道\r\n</p>', '0', '', '1', '0', '1');
INSERT INTO `by_document` VALUES ('95', '1', ' 不用关门了！美国会通过临时支出法案避免政府停摆', '166', '286', '380', '1493400812', '1500519643', '1', '<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p3.ifengimg.com/a/2017_17/d9d861eec71037c_size37_w646_h340.png\" width=\"550\" height=\"289\" alt=\"\" style=\"height:auto;\" /> \r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	原标题：美国国会通过临时支出法案避免了“停摆”\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	原本4月28日美国联邦政府再度面临“停摆”的风险，但就在刚刚美国国会参众两院成功通过“临时支出法案”将维持联邦政府运转至下周五(5月5日)，以求能够达成一项可使联邦政府预算支撑到9月的协议，此项法案随后将立即交由总统特朗普签字生效。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	美国联邦政府上一次停摆发生在2013年10月，再往前一次则是在1995-1996年。这些实际关门的事件都持续了一段时间，并对经济造成了影响。（央视记者 肖贺佳）\r\n</p>', '0', '', '1', '0', '1');
INSERT INTO `by_document` VALUES ('96', '1', '   蒂勒森：美国已做好对“流氓政府”动武的准备', '166', '287', '214', '1493400851', '1500519689', '1', '<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p1.ifengimg.com/a/2017_17/45957f2c66cd033_size43_w983_h576.png\" width=\"983\" height=\"576\" alt=\"\" style=\"height:auto;\" /> \r\n</p>\r\n<p class=\"picIntro\" style=\"font-size:14px;text-align:center;font-family:楷体_gb2312, 楷体;color:#2B2B2B;background-color:#FFFFFF;\">\r\n	美国国务卿蒂勒森\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	原标题：美国已经做好了对“流氓政府”动武的准备\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	美国国务卿蒂勒森，28日在一场由美国组织的联合国特殊会议上，敦促国际社会加大对朝鲜的施压力度，如若不然，结果将是灾难性的。在会上，蒂勒森表示“所有应对未来挑衅的手段目前都不排除，外交手段、经济制裁如有必要将与军事打击相结合。”（央视记者 肖贺佳）\r\n</p>', '0', '', '0', '0', '1');
INSERT INTO `by_document` VALUES ('97', '1', '《拆弹专家》今日上映 “隧道那场戏太震撼了”', '168', '185', '425', '1496119028', '1496119028', '1', '<p align=\"center\" style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p align=\"center\" class=\"pictext\" style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　　姜皓文、吴卓羲、蔡翰亿、张竣杰（从左到右）\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　　广州日报讯 （全媒体记者 黄岸/文 王维宣/图） 由刘德华监制、邱礼涛执导的电影《拆弹专家》今日正式上映。昨日，影片主演姜皓文、吴卓羲、蔡翰亿、张竣杰亮相广州新闻发布会，刘德华本人则因为受伤未到现场。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　　据悉，《拆弹专家》制作费用高达2亿，更是1:1搭建了一条全新的红磡隧道以供多场重头戏拍摄。回忆起在隧道里拍戏的感受，姜皓文坦言相当辛苦：“隧道是封顶的，几百部车在里面同时启动，我们还要跑来跑去，真是热得不行。”姜皓文表示，看到成片又很感动：“因为真的太震撼了。”而青年演员蔡瀚亿在戏中虽然戏份不多，但其饰演的青年警察牺牲一幕却被不少提前看片的观众称为最大泪点，对此，蔡瀚亿回应道，自己看过电影后也哭得不行：“这其实是一部文艺片，其他警匪片都是塑造英雄，这部电影讲的是英雄背后的孤独。”\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　　而凭借该片踏足影坛的吴卓羲则表示，初演电影就能遇到这么大制作的好电影，让他倍感荣幸，拍电影时也深感还有很多地方需要学习，更希望未来能有更多机会登上大银幕。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　　新闻链接\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　　刘德华视频助阵：我还是那个很帅的刘德华\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　　广州日报讯 （全媒体记者 林芳） 前日，刘德华监制并主演的城市反恐警匪题材电影《拆弹专家》首映。刘德华早前在泰国拍摄广告坠马受伤，被医生勒令卧床养伤，因此不得不缺席此次宣传活动。不过病床上的刘德华依然心系该片，专门拍了视频助阵。他在视频里表示自己目前恢复状况良好，只是不能做太多运动，请大家放心。“现在的身体上、思想上还是很健康的，我还是那个很帅的刘德华。”谈到拆弹，刘德华说：“拆弹是一个非常孤独的职业，‘生命保护生命’是影片想表达的，不只拆弹专家，医生、警察等等都很伟大。\r\n</p>', '0', '', '0', '2', '1');
INSERT INTO `by_document` VALUES ('98', '1', '投票：《人民的名义》戏骨云集 谁是最强“演技担当”？', '168', '293', '187', '1500520048', '1500520065', '1', '<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	【文艺星青年按】近日，《人民的名义》成为“爆款”。剧中扮演“达康书记”“育良书记”等官员形象的吴刚、张志坚、侯勇等“老戏骨”个个亮眼，成了剧中的“流量担当”。人民网文化频道“文艺星青年”工作室发起互动投票活动“《人民的名义》戏骨云集，谁是最强‘演技担当’？”欢迎大家扫描屏幕下方二维码投出你的关键一票！\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;text-align:center;\">\r\n	<img alt=\"\" src=\"http://culture.people.com.cn/NMediaFile/2017/0414/MAIN201704140850000333708141065.jpg\" width=\"500\" height=\"844\" /> \r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;text-align:center;\">\r\n	<img alt=\"\" src=\"http://culture.people.com.cn/NMediaFile/2017/0414/MAIN201704140850000463671499222.jpg\" width=\"500\" height=\"393\" /> \r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;text-align:center;\">\r\n	<img alt=\"\" src=\"http://culture.people.com.cn/NMediaFile/2017/0414/MAIN201704140850000595968218593.jpg\" width=\"500\" height=\"398\" /> \r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;text-align:center;\">\r\n	<img alt=\"\" src=\"http://culture.people.com.cn/NMediaFile/2017/0414/MAIN201704140851000053488097663.jpg\" width=\"500\" height=\"398\" /> \r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;text-align:center;\">\r\n	<img alt=\"\" src=\"http://culture.people.com.cn/NMediaFile/2017/0414/MAIN201704140852000058252648267.jpg\" width=\"500\" height=\"398\" /> \r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;text-align:center;\">\r\n	<img alt=\"\" src=\"http://culture.people.com.cn/NMediaFile/2017/0414/MAIN201704140852000113508002033.jpg\" width=\"500\" height=\"398\" /> \r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;text-align:center;\">\r\n	<img alt=\"\" src=\"http://culture.people.com.cn/NMediaFile/2017/0414/MAIN201704140852000192222114792.jpg\" width=\"500\" height=\"398\" /> \r\n</p>', '0', '', '0', '0', '1');
INSERT INTO `by_document` VALUES ('100', '1', '国家文物局调研部署雄安新区建设中文物保护和考古工作', '168', '292', '167', '1493401174', '1500519988', '1', '<p align=\"center\" class=\"pictext\" style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	雄县境内的宋辽边关地道 图片来源于网络 摄\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	河北省文物局27日透露，为贯彻落实党中央、国务院关于建设河北雄安新区的重大决策部署，国家文物局副局长宋新潮日前带队赴雄安新区现场调研，并召开工作会议，部署推进雄安新区建设中的文物保护和考古工作。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	中国社会科学院考古研究所所长陈星灿、中国文化遗产研究院院长柴晓明、河北省文化厅厅长张妹芝、河北省文物局局长张立方等领导一同参与了本次调研。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	宋新潮称，国家文物局高度重视雄安新区建设中的文物保护和考古工作，将与河北省和相关市县一起深入贯彻习近平总书记关于在雄安新区建设中坚持保护弘扬中华优秀传统文化、延续历史文脉的重要指示，按照“保护为主、抢救第一、合理利用、加强管理”的文物工作方针，将文物作为雄安新区发展建设的重要资源，为新区建设增光添彩。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	国家文物局将根据新区建设的实际需要，从队伍协调及技术力量组织上对涉及的文物保护和考古项目予以全力支持。建议河北省出台做好雄安新区文物保护工作的意见，省文物局要成立专门工作机构，加强对此项工作的领导、组织、协调、指导和检查，统筹省内文物考古的专业力量，重点保障雄安新区建设。雄安新区要尽快建立文物保护机构，落实文物保护责任。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	宋新潮表示，各级文物部门要抓紧展开对新区规划范围特别是先行开发地区文物资源的深入调查，组织考古单位有重点地进行考古调查、勘探，进一步摸清文物资源的准确情况。在此基础上编制雄安新区文物保护规划，科学谋划新区的文物保护和展示利用，明确文物保护的重点区域和保护要求。加强与新区建设规划部门的沟通协调，将文物保护规划的主要内容纳入新区建设的总体规划，对涉及文物保护的建设项目的选址、选线等提出优化完善的合理建议。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	张立方表示，河北省文物局将按照河北省委、省政府和国家文物局的总体部署和要求，尽快开展文物调查、勘探工作，保障新区建设的顺利进行。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	据悉，雄安新区涉及雄县、容城、安新三县及周边部分区域，历史文化底蕴深厚，新石器时期、东周燕文化、宋辽军事遗迹、抗战红色文物等文物资源丰富。已登记不可移动文物189处，其中有全国重点文物保护单位2处，省级文物保护单位8处，市县级文物保护单位78处。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	其中，容城南阳遗址为第六批全国重点文物保护单位，面积达42万平方米，曾经发现有“燕王职戈”、“西宫”、“左征”等铭文的鼎、簋、壶、戈等青铜器和大量的陶器。出土文物和文字具有明显的燕国风格，有专家学者认为可能是燕中都所在地，与燕国中期的都城“易都”有关。雄县境内的宋辽边关地道为第七批全国重点文物保护单位，是宋辽边界附近的重要军事设施，结构复杂、战争功能齐全，可堪称中国宋辽史上的“地下长城”。安新县白洋淀雁翎队纪念馆是河北省爱国主义教育基地。(肖光明 张帆 王天译)\r\n</p>\r\n<div>\r\n	<br />\r\n</div>\r\n<div class=\"box_pic\" style=\"margin:0px auto;text-align:center;font-size:14px;font-family:宋体;color:#0F0F0F;\">\r\n</div>', '0', '', '0', '0', '1');
INSERT INTO `by_document` VALUES ('101', '1', '《记忆大师》烧脑 黄渤:希望有生之年科技别太发达', '168', '291', '149', '1493401246', '1500519953', '1', '<div class=\"otitle\" style=\"margin:0px auto;font-size:14px;font-family:宋体;color:#0F0F0F;\">\r\n	原标题：陈正道《记忆大师》太烧脑 黄渤：希望有生之年科技别太发达\r\n</div>\r\n<p align=\"center\" style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	<img alt=\"\" src=\"http://www.people.com.cn/mediafile/pic/20170428/10/16677018699062210822.jpg\" /> \r\n</p>\r\n<p align=\"center\" class=\"pictext\" style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	《记忆大师》电影剧照。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	由陈正道执导的电影《记忆大师》即将于2017年4月28日全国上映。该剧讲述了未来世界一个关于记忆提取的悬疑故事。陈正道之前曾执导过《催眠大师》，此次再做仍旧有“烧脑”、悬疑等多重元素的《记忆大师》，究竟放了哪些新招？昨日，陈正道和剧中两位大男主黄渤、段奕宏接受了记者的采访。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	黄渤本人与角色反差极大 导演称演得很“震撼”\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	2014年，由台湾陈正道导演的《催眠大师》国内票房斩获2.74亿元，成为当年度国产悬疑片最高票房片，成绩不俗。时隔两年，陈正道导演携“大师”系列第二部《记忆大师》来袭。陈正道表示，这是一个很复杂的悬疑推理故事，有三条叙事线，多达七个主要角色。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	“这个故事讲了一个作家跟妻子离婚，但是他爱她，他忘不掉她，所以他就去动了一个记忆手术。这个手术是我们在电影中架空虚设出来的。但是后来他们的感情又有挽回的余地，他妻子就希望他能够把记忆拿回来，结果他就拿到了一个杀人犯的记忆。然后他觉得他如果一直持续这段记忆，就可以找到这个凶手犯案的证据。但是，杀人犯的性格或是杀意也同时影响着他的个性……”，陈正道说，如此复杂的一部电影对他来说是一个挑战，“从剧本完成的时候，我就知道我没有能力把它拍好，但我觉得现在是中国电影市场最好的时候，任何时候都比不上现在更适合冒险，更适合展现自己的勇气去拍一个我自认为其实是快无法驾驭的故事。”谈到演员，他觉得最大的震撼是因为和黄渤老师第二次合作，“黄渤本人是一个‘敦和’没有脾气的人，这样一个有喜感和人缘的演员，来演一个凶手，在现场看那几场戏还是蛮震撼我的。”\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	“双雄对决”\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	段奕宏：剧本吸引人，欣赏“对手”黄渤\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	《记忆大师》中，段奕宏和黄渤的“双雄对决”也是很强的看点。作为两个中国当下很会演戏的代表，在片中饰演警察沈汉强的段奕宏表示，他是因为“烧脑”和“黄渤”这四个字才下定决心和导演合作的，“整个剧本的故事情节，包括故事架构、人物关系的这种层层叠起的多变性，非常吸引人。它是一个不同于寻常的电影剧本，同时我也看到了这个人物很难把握、没有一个结论的表现空间，这个是非常迷人的，对我来说非常迷恋。当然里面还有黄渤、徐静蕾这样优秀的演员在一起合作，我相信一定会有非常棒的感觉迸发出来。”\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	谈到“对手”黄渤，段奕宏流露出欣赏之情，“他是我非常喜欢的一个中国男演员，他非常之优秀，我能看得出来他塑造的每一部电影或电视剧里面的人物，一定是经过他不断地创作之后的呈现，所以这个演员是非常了不得的，心里真的有一种非常喜爱他的心情，想和他合作。我听陈正道也说，好像这个本子最早也是给黄渤的，黄渤说这个警察一定要请老段来。首先我非常喜欢这个剧本，然后是冲着黄渤来演，那真是挺棒的。我们在生活当中，用黄渤的话来说，老段哪里都好，就是太素了。因为我不怎么喜欢喝酒，但有几次和他们喝酒挺嗨的。生活当中的黄渤更可爱、更好玩，总是被他逗得前仰后合的感觉，愿意在一起聊天、谈剧本、游泳。我们在酒店的时候就说，这是在拍电影吗，是在度假吧，拍戏工作量不是太大，还一起过了一个春节，吃了黄渤爸爸妈妈包的饺子，在一起有很多共同的话题。”\r\n</p>\r\n<div class=\"ad_hh\" style=\"margin:10px 10px 10px 0px;font-family:宋体;border:1px solid #CDCDCD;padding:5px;color:#0F0F0F;\">\r\n	<div id=\"BAIDU_SSP__wrapper_u2700432_0\" style=\"margin:0px auto;\">\r\n		<iframe id=\"iframeu2700432_0\" src=\"http://pos.baidu.com/ncbm?rdid=2700432&dc=3&di=u2700432&dri=0&dis=0&dai=2&ps=2037x180&dcb=___adblockplus&dtm=HTML_POST&dvi=0.0&dci=-1&dpt=none&tsr=0&tpr=1493401223890&ti=%E3%80%8A%E8%AE%B0%E5%BF%86%E5%A4%A7%E5%B8%88%E3%80%8B%E7%83%A7%E8%84%91%C2%A0%E9%BB%84%E6%B8%A4%3A%E5%B8%8C%E6%9C%9B%E6%9C%89%E7%94%9F%E4%B9%8B%E5%B9%B4%E7%A7%91%E6%8A%80%E5%88%AB%E5%A4%AA%E5%8F%91%E8%BE%BE--%E6%96%87%E5%8C%96--%E4%BA%BA%E6%B0%91%E7%BD%91&ari=2&dbv=2&drs=1&pcs=1349x589&pss=1349x2083&cfv=0&cpl=5&chi=1&cce=true&cec=GBK&tlm=1493339954&rw=589&ltu=http%3A%2F%2Fculture.people.com.cn%2Fn1%2F2017%2F0428%2Fc22219-29242467.html&ltr=http%3A%2F%2Fculture.people.com.cn%2F&ecd=1&uc=1366x728&pis=-1x-1&sr=1366x768&tcn=1493401224&qn=4c62e6ee272cd554&tt=1493401223864.186.263.265\" width=\"200\" height=\"200\" frameborder=\"0\" style=\"width:200px;height:200px;\">\r\n		</iframe>\r\n	</div>\r\n</div>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	黄渤：角色跨度大，演完后心里有“阴影”\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	《记忆大师》中，黄渤演的正是那个带动整个剧情往下发展的作家，因为存取记忆的失误，他陷入到了一段又一段的危险关系中。黄渤用三个名词来定义这个角色，“作家、丈夫、犯罪者（好复杂的身份）”。吸引黄渤来参演的也是该剧的推理悬疑，“最喜欢里边的故事以及人物，故事的桥段连接以及它一层一层的推理、断定。包括人物的内心丰富性。这是演员会比较兴奋的地方吧，在同一个角色中有不同的维度跨度。表演起来会比较过瘾。”\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	拍戏数月，最深刻的一场戏是哪一场？黄渤却表示，“我觉得都挺深刻的，因为有的凶杀的戏一拍就拍好几天，当然就会很深刻。还有这次里边的场景道具、场景的置景也都挺巧妙的。”与段奕宏合作，他也盛赞对手，“他特别优秀，这次可以跟他合作，听说他要来这部戏我也很高兴，一部戏里有几个这样的演员整个这部戏的品质就会有所保证。他很有个性，对角色的见解也很独到。很有自己的特点。”演完这部“记忆”可以取走的电影，黄渤表示，心里有阴影，希望他有生之年科技不要发达成这个样子，“拍这部片子时候仔细考虑过这个事情，还是被吓到了。”（记者 张漪）\r\n</p>\r\n<div>\r\n	<br />\r\n</div>\r\n<div class=\"box_pic\" style=\"margin:0px auto;text-align:center;font-size:14px;font-family:宋体;color:#0F0F0F;\">\r\n</div>', '0', '', '0', '0', '1');
INSERT INTO `by_document` VALUES ('102', '1', '西甲-梅西两球小马哥处子球 巴萨7-1狂胜奥萨苏纳', '170', '186', '453', '1496007070', '1496007070', '1', '<div class=\"box_pic\" style=\"margin:15px 10px;text-align:center;font-size:14px;font-family:SimSun;color:#333333;background-color:#FFFFFF;\">\r\n	<table width=\"450\" cellspacing=\"0\" cellpadding=\"3\" align=\"center\">\r\n		<tbody>\r\n			<tr>\r\n				<td align=\"center\">\r\n					<a href=\"http://sports.people.com.cn/n1/2017/0427/c22141-29239552-2.html\"><img src=\"http://sports.people.com.cn/NMediaFile/2017/0427/MAIN201704270846000054099616271.jpg\" alt=\"梅西庆祝进球\" /></a> \r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td align=\"center\">\r\n					<span>梅西庆祝进球</span> \r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div class=\"box_pic\" style=\"margin:15px 10px;text-align:center;font-size:14px;font-family:SimSun;color:#333333;background-color:#FFFFFF;\">\r\n</div>\r\n<p style=\"font-size:14px;font-family:宋体;color:#333333;background-color:#FFFFFF;text-indent:2em;\">\r\n	<a class=\"show_tip\" href=\"http://www.people.com.cn/\">人民网</a>北京4月27日电（杨磊） 北京时间4月27日凌晨，2016/17赛季<a class=\"show_tip\" href=\"http://sports.people.com.cn/xijia/\">西甲</a>第34轮展开争夺，<a class=\"show_tip\" href=\"http://sports.people.com.cn/GB/22141/22145/33524/index.html\">巴塞罗那</a>主场7比1大胜<a class=\"show_tip\" href=\"http://sports.people.com.cn/GB/22141/22145/33538/index.html\">奥萨苏纳</a>，<a class=\"show_tip\" href=\"http://sports.people.com.cn/GB/149273/149395/149472/index.html\">梅西</a>、戈麦斯和帕科均打入2球，马斯切拉诺也收获处子球。\r\n</p>\r\n<p style=\"font-size:14px;font-family:宋体;color:#333333;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span><strong>巴萨第12分钟取得领先，法斯托回传被梅西断球后形成单刀，<a class=\"show_tip\" href=\"http://worldcup2010.people.com.cn/GB/187582/187618/index.html\">阿根廷</a>人甩开2名后卫在12码处单刀挑射破门。</strong>这是他本赛季第48粒入球，其中联赛打入32球。帕科追逐长传球在禁区右侧回敲，梅西12码处半凌空抽射高出。</span> \r\n</p>\r\n<p style=\"font-size:14px;font-family:宋体;color:#333333;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span><strong>巴萨第30分钟扩大比分，拉基蒂奇角球混战中右路传中，戈麦斯11码处第一时间扫射，皮球擦右侧立柱入网，2-0。</strong>马斯切拉诺斜传，反越位成功的<a class=\"show_tip\" href=\"http://sports.people.com.cn/GB/31928/242574/index.html\">图</a>兰小禁区边缘冲顶偏出。梅西左路任意球传中，帕科12码处头球攻门又被西里古飞身救出。</span> \r\n</p>\r\n<p style=\"font-size:14px;font-family:宋体;color:#333333;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span><strong>奥萨苏纳第48分钟扳回一城，布斯克茨禁区前犯规，罗伯托-托雷斯25码处任意球直接破门，1-2。</strong>帕科角球混战中左路斜传，马斯切拉诺小禁区边缘头球攻门被西里古扑挡后击中右侧立柱弹回。</span> \r\n</p>\r\n<p style=\"font-size:14px;font-family:宋体;color:#333333;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span><strong>巴萨第57分钟再次拉开差距，拉基蒂奇开出角球，皮克远点10码处胸部停球后抽射，皮球击中右侧立柱弹回，无人防守的戈麦斯10码处补射入网，3-1。</strong></span> \r\n</p>\r\n<p style=\"font-size:14px;font-family:宋体;color:#333333;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span><strong>第62分钟，拉基蒂奇传球，梅西突破至禁区弧内弧线球射门，皮球紧贴左侧立柱入网，4-1。</strong></span> \r\n</p>\r\n<p style=\"font-size:14px;font-family:宋体;color:#333333;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span>梅西被阿雷尼亚换下。<strong>第64分钟，图兰直传马斯切拉诺，帕科拿球突入小禁区右侧铲射远角入网，5-1。第67分钟，丹<a class=\"show_tip\" href=\"http://sports.people.com.cn/GB/22141/25860/33461/index.html\">尼斯</a>禁区右侧被梅里达绊倒，马斯切拉诺点球怒射破门，6-1。</strong>这是他自2010年8月转入巴萨以来的首粒入球。</span> \r\n</p>\r\n<p style=\"font-size:14px;font-family:宋体;color:#333333;background-color:#FFFFFF;text-indent:2em;\">\r\n	<strong>第86分钟，丹尼斯直传，帕科晃过出击的西里古后射入空门，7-1。</strong> \r\n</p>\r\n<p style=\"font-size:14px;font-family:宋体;color:#333333;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span>巴萨(3-3-1-3)：1-特尔施特根；14-马斯切拉诺，3-皮克，19-迪涅；4-拉基蒂奇，5-布斯克茨，21-戈麦斯；10-梅西(63\',28-阿雷尼亚)；6-丹尼斯，17-帕科，7-图兰</span> \r\n</p>\r\n<p style=\"font-size:14px;font-family:宋体;color:#333333;background-color:#FFFFFF;text-indent:2em;\">\r\n	奥萨苏纳(4-4-2)：25-西里古；34-布努埃尔，6-奥耶尔，37-蒙德拉贡，16-富恩特斯；10-罗伯托-托雷斯，14-法斯托，18-梅里达，20-奎瓦斯；17-罗梅罗(72\',35-奥拉维德)，7-塞尔吉奥-莱昂(73\',19-科德罗)\r\n</p>', '0', '', '0', '1', '1');
INSERT INTO `by_document` VALUES ('103', '1', '南美洲足联内部调查确认官员挪用1.29亿美元', '170', '283', '145', '1493401499', '1500519519', '1', '<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　新华社里约热内卢４月２６日电（记者赵焱　陈威华）正在智利圣地亚哥举行的南美洲足联大会２６日公布了该组织在２０００年至２０１５年间损失１．２９亿美元（１美元约合６.９０元人民币）资金的证据。参与调查的人员认为，该组织因部分领导人腐败造成的损失数额可能更大，估计超过１．５亿美元。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　　南美洲足联展示的证据是在最近１０个月内通过内部调查获得的结果。调查期间，所有南美洲足联官员的电子邮件和电脑内的文件都被检查，此外被调查的还有各种会计文件、银行账目、合同等。分析取证的文件超过２００万份，并进行了４０次证人对话。所有这些资料都送到纽约专门负责国际足联案件的机构和巴拉圭（南美洲足联总部所在国）检察院备案。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　　在２０００年至２０１５年期间，莱奥斯、菲格雷多和纳波特担任过南美洲足联主席，现在这三人均已被捕。其中莱奥斯收取的非法资金最多，向莱奥斯个人账户直接汇款额就达到２６９０万美元，目前莱奥斯在其亚松森的家中软禁，正在等候被引渡到美国接受判决。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;color:#222222;\">\r\n	　　南美洲足联现任主席多明格斯说：“这是足球史上历史性的一天，我们也承诺这种事情不会再发生。”\r\n</p>', '0', '', '0', '0', '1');
INSERT INTO `by_document` VALUES ('104', '1', '李楠、杜峰出任中国男篮“双主教练”', '171', '284', '464', '1496119060', '1500519562', '1', '<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	人民网北京4月28日电（杨磊） 4月28日，中国篮协官网公布了新一届国家男篮主教练人员，李楠和杜峰分别担任两支男篮国家队主教练。此前，中国篮协公布了国家队主教练选拔办法，将组建两支国家队，两队教练员、球员互不交叉，两支队伍将分别承担2017年和2018年比赛任务，2019年男篮世界杯前合并为一支队伍。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	篮协公告原文如下：\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	中国篮球协会关于任命中国男篮主教练的公告\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	篮协字〔2017〕64号\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	根据《篮球项目国家队教练员、运动员选拔与监督办法及实施细则》和《中国男篮主教练选拔方案》，本着“公平、公开、公正”的原则，经过国家男篮主教练选拔组充分讨论研究，经中国篮协主席办公会同意，并报请国家体育总局批准，中国篮协聘用李楠、杜锋两名同志分别担任两支中国男篮主教练。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	特此公告。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	中国篮球协会\r\n</p>', '0', '', '0', '2', '1');
INSERT INTO `by_document` VALUES ('105', '1', 'NBA颁奖盛典增设6大奖项 将由球迷投票产生', '171', '282', '84', '1493401594', '1500519456', '1', '<div class=\"box_pic\" style=\"margin:0px auto;text-align:center;font-size:14px;font-family:宋体;color:#0F0F0F;\">\r\n	<table width=\"450\" cellspacing=\"0\" cellpadding=\"3\" align=\"center\" style=\"width:646px;margin:0px auto;\">\r\n		<tbody>\r\n			<tr>\r\n				<td align=\"center\">\r\n					<img src=\"http://sports.people.com.cn/NMediaFile/2017/0428/MAIN201704280903000057464980139.jpg\" alt=\"NBA颁奖盛典增设6大奖项 将由球迷投票产生\" /> \r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td align=\"center\">\r\n					<span></span> \r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	<a class=\"show_tip\" href=\"http://www.people.com.cn/\">人民网</a>北京4月28日电（杨磊） 北京时间4月28日，据<a class=\"show_tip\" href=\"http://sports.people.com.cn/nba/\">NBA</a>官网报道，在今年的第一届NBA颁奖盛典上，除了传统奖项之外，还有6项全新奖项将由球迷投票产生。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	联盟此前宣布常规赛各奖项将在季后赛结束后单设颁奖晚会进行颁发，此次颁奖更是另设了六大奖项，包括年度最佳扣篮、最佳潮流、最佳封盖、最佳助攻、最佳制胜球以及最佳表现。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	球迷们从本周开始就可以通过社交网络投票选出这六大奖项的归属。\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	NBA官方还给出了各个奖项的候选名单，详情如下：\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	最佳风尚奖：拉塞尔-威斯布鲁克、德维恩-<a class=\"show_tip\" href=\"http://sports.people.com.cn/GB/149273/149396/150745/index.html\">韦德</a>和伊曼-香珀特\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	年度最佳扣篮奖：小拉里-南斯（对阵<a class=\"show_tip\" href=\"http://sports.people.com.cn/GB/22149/22151/136838/index.html\">篮网</a>）、扎克-拉文（对阵<a class=\"show_tip\" href=\"http://sports.people.com.cn/GB/4/63/581/index.html\">太阳</a>）和维克托-奥拉迪波（对阵<a class=\"show_tip\" href=\"http://sports.people.com.cn/GB/4/63/559/index.html\">老鹰</a>）\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	年度最佳盖帽奖：哈桑-怀特塞德（对阵<a class=\"show_tip\" href=\"http://sports.people.com.cn/GB/4/63/586/index.html\">猛龙</a>）、克里斯塔普斯-<a class=\"show_tip\" href=\"http://sports.people.com.cn/GB/149273/149398/149968/index.html\">波尔</a>津吉斯（对阵篮网）和科怀-伦纳德（对阵<a class=\"show_tip\" href=\"http://sports.people.com.cn/GB/4/63/570/index.html\">火箭</a>）\r\n</p>\r\n<p style=\"font-size:18px;font-family:微软雅黑;text-indent:2em;color:#222222;\">\r\n	年度最佳助攻奖：德雷蒙德-格林+斯蒂芬-\r\n</p>', '0', '', '0', '0', '1');
INSERT INTO `by_document` VALUES ('113', '1', '关于我们', '173', '295', '20', '1495990715', '1500520189', '0', '34654765', '0', '', '0', '0', '1');
INSERT INTO `by_document` VALUES ('115', '1', '贝云cms(bycms) V1.0正式版发布了!', '181', '294', '1073', '1501572860', '1501572883', '0', '<p>\r\n	byCms是一套简单，易用的内容管理系统,包含文章，图片，下载，视频模型，，基于最新版thinkphp5.0.10，旨在帮助开发者节约web应用后台开发时间和精力，以最快的速度开发出高质量的web应用。包含pc端，手机端，微信端，安卓app，苹果app，多端数据同步！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/uploads/Editor/2017-07-29/597c2c18ed7dc.png\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	精美后台\r\n</p>\r\n<p>\r\n	<img src=\"/uploads/Editor/2017-07-29/597c358e21b0e.png\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '0', '', '1', '3', '1');
INSERT INTO `by_document` VALUES ('116', '1', '用了21年的USB数据接口，要被彻底抛弃了用了21年的USB数据接口，要被彻底抛弃了', '161', '213', '109', '1496258057', '1496258057', '0', '<div class=\"__kindeditor_paste__\">\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		<img src=\"http://img.mp.itc.cn/upload/20170529/cc00cbd1857e4832a8e28b5780455ecb_th.jpg\" alt=\"\" style=\"height:auto;\" /> \r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		苹果最新发布的MacBook Pro 电脑将使用USB-C接口。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		文 | 高小倩\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		过去21年的时间里，我们一直都在使用一种名为USB-A的数据接口。随着Intel的USB-C数据接口的推出，以前的那种数据接口可能很快就被取代。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		▎30秒就可以传输完一部4K电影\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		在上个世纪90年代末的时候，Intel发明了USB数据接口，可以让外部设备更容易和快捷的连接到电脑。如今Intel又要对USB进行第六代的更新了。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		据Intel官网日前发布的信息显示，公司又发明了新的数据传输技术Thunderbolt™ 3，该连接器也被称为USB-C。在Intel的愿景里，希望各种各样的内容都可以通过该接口实现快速的传输。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		比起以前的数据接口，USB-C有更多的优势，比如可以接入更多的设备、传输速度更快、更清晰的像素以及更快速的充电功能。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		　　<img src=\"http://img.mp.itc.cn/upload/20170529/a43553d86ee1477a8c4fa499232de514_th.jpg\" alt=\"\" style=\"height:auto;\" /> \r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		具体来说，随着网络的普及，人们创造的数据量也越来越大。比如1000张高清照片可能需要20GB的储存空间，而一小时的4K视频大概要1.5TB。如果用之前的USB数据线，传输起来可能需要大量的时间。但如果使用USB-C数据线进行传输，一部4K电影大概只需要30秒。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		　　<img src=\"http://img.mp.itc.cn/upload/20170529/2e4e860e72ae4433a0b43e67b8bc5560_th.jpg\" alt=\"\" style=\"height:auto;\" /> \r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		▎苹果和微软两个科技大佬已经使用\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		为了让更多人的使用该接口，公司还打算把Thunderbolt 3整合到Intel CPU中，并将于明年发布使用Thunderbolt的规范协议。如果Thunderbolt 3被整合到CPU中，那么电脑生产商就可以制造更薄和更轻的系统。这也是首次，电脑上所有的接口都变的一样了。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		同时，Intel还将以非排他性和免版税的方式向业界提供Thunderbolt的协议规范。这样做的话，可以让更多的第三方芯片生产商采用Thunderbolt 并制作兼容Thunderbolt 的芯片。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		　　<img src=\"http://img.mp.itc.cn/upload/20170529/aee67055f0934cf88b7198e3cafc97ab_th.jpg\" alt=\"\" style=\"height:auto;\" /> \r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		对此，苹果负责硬件工程的高级副总裁Dan Riccio表示：“从一开始，苹果就与Intel合作采用了Thunderbolt。如果未来Thunderbolt技术会被整合到CPU中并提供给更多的公司，这是再好不过的一件事情了。”\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		另外，在Windows 10 Creators Update中，微软也加强了Thunderbolt 3即插即用的功能。据微软Windows设备的负责人Roanne Sones介绍，未来微软还将与Intel合作把 Thunderbolt 3带到更多的Windows PC以及其他OS设备中。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		除了苹果和微软，很多采用7th Generation Intel® Core™处理器系统的电脑生产商也都打算使用Thunderbolt 3技术。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		▎离普遍使用还有一段距离\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		虽然USB-C 和Thunderbolt 3有诸多的优势，但离普遍使用还有一段的距离。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		因为很多用户仍然在使用比较老旧的电脑，他们还需要用到USB-A数据接口。如果使用旧电脑的用户想买可以使用USB-C数据线的组件，那他们还需要买调试器进行连接。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		　　<img src=\"http://img.mp.itc.cn/upload/20170529/b74553fca4c748eb9f748bdf5532024a_th.jpg\" alt=\"\" style=\"height:auto;\" /> \r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		另外，Intel最新发布的一些处理器也不支持Thunderbolt 3技术，这意味着很大部分的电脑用户都不能体验到Thunderbolt 3的快速传输速度。正如Intel所说的，明年的处理器才会支持Thunderbolt 3 ，所以部分用户只能等到明年了。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		此外，《华尔街日报》的消息称，在苹果下一代智能手机中，苹果计划取消现有的闪电接口，和笔记本电脑一样切换到单一USB-C接口，这样苹果所有的电子设备充电接口将实现统一，苹果用户出门时，只需要携带一个充电设备即可。\r\n	</p>\r\n</div>', '0', null, '0', '0', '1');
INSERT INTO `by_document` VALUES ('117', '1', '亚冠-埃神破门上港总分5-3晋级8强', '159', '219', '329', '1496259084', '1496259084', '0', '<p align=\"center\" style=\"font-size:16px;color:#333333;text-indent:2em;font-family:微软雅黑, Arial;\">\r\n	<br />\r\n</p>\r\n<p align=\"center\" class=\"pictext\" style=\"font-size:16px;color:#333333;text-indent:2em;font-family:微软雅黑, Arial;\">\r\n	<span style=\"color:#555555;font-family:&quot;font-size:14px;background-color:#FFFFFF;\"><img src=\"/uploads/Editor/2017-06-01/592f19fd0bf64.jpg\" alt=\"\" />北京时间5月31日20:00，2017年亚冠1/8决赛次回合继续进行，上港客场3-2再次击败苏宁，总比分5-3杀进八强。埃尔克森第34分钟破门，又在第43分钟制造杨笑天乌龙球，助上港2-0领先。洪正好和吴曦下半场连入两球扳平比分，胡尔克第94分钟绝杀。此外，洪正好和戈伟各有一次射门击中门框。</span>\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;text-indent:2em;font-family:微软雅黑, Arial;\">\r\n	<br />\r\n</p>', '0', null, '0', '0', '1');
INSERT INTO `by_document` VALUES ('118', '1', '索赔7500万元！高德起诉滴滴拉拢员工跳槽', '159', '215', '140', '1496258296', '1496258296', '0', '<div class=\"__kindeditor_paste__\">\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		<img src=\"http://img.mp.itc.cn/upload/20170531/9e3398897b02459886f88db0146f7b7d_th.jpg\" alt=\"\" style=\"height:auto;\" /> \r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;text-align:justify;\">\r\n		据中国之声《新闻晚高峰》报道，被指虚假宣传、侵犯商业秘密。近日高德地图公司起诉“滴滴”公司不正当竞争案继续引发关注。高德表示“滴滴”伙同高德公司内部高级经理，拉拢掌握核心机密的六员工跳槽，给公司造成严重损失，高德方面要求“滴滴”以及跳槽员工赔偿总计7500万元。近日记者从朝阳区法院获悉，针对这8起案件“滴滴”公司等均提出管辖异议，但均被朝阳法院一审驳回，目前“滴滴”公司已提出上诉。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		8起诉讼，共计索赔7500万元。今年年初《反不正当竞争法》实施24年之后迎来首次大修，而高德和“滴滴”这两家知名互联网科技公司之间的诉讼则引发了社会广泛关注。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		据了解，这8起由高德公司提起的不正当竞争诉讼中，有7起源于高德软件公司高级经理胡先生及另外6名工程师的集体离职。高德公司诉称，他们发现胡先生从高德公司离职后，在竞业限制期内加入与高德有直接竞争关系的“滴滴”公司，此外胡先生还利用职务便利与“滴滴”方面劝诱公司另外6名高级或资深工程师跳槽“滴滴”。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		高德公司透露，这些资深员工掌握高德公司商业秘密，部分人在离职前还大量拷贝了公司商业秘密，致使公司正常经营秩序被干扰和破坏，侵害了公司利益和消费者利益，违反了《反不正当竞争法》第二条。为此，高德公司对“滴滴”公司以及上述各前员工分别索赔1000万元经济损失。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		针对业内人士口中涉嫌恶意挖角的这7起案件，“滴滴”等分别提起管辖异议，以涉及技术秘密的案件北京朝阳法院无管辖权为由申请移送北京知识产权法院审理。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		但是记者从朝阳区法院了解到，法院经审理后驳回了“滴滴”公司等提出的管辖异议。北京市朝阳区法院新闻办表示：“朝阳法院经审理认为，7起案件案由为不正当竞争纠纷，该类案件并非知识产权法院管辖的一审民事案件，且高德一方明确其中部分诉讼既不涉及技术秘密，也不涉及计算机软件，故朝阳法院一审驳回了‘滴滴’公司和中智公司的管辖异议。”\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		“全球最大的一站式多元化出行平台”、“滴滴师傅最好”……高德公司认为“滴滴”方面的广告语，使用了最高级用语和虚假数据进行夸张和引人误解的片面宣传，属于虚假宣传，对消费者购买决策产生影响，扰乱市场竞争秩序，给高德造成巨大损失，因此另案提起不正当竞争诉讼。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		对此，“滴滴”方面也同样提出管辖异议，但被朝阳区法院予以了驳回，“本案系涉嫌虚假宣传而产生的不正当竞争纠纷，相关行为通过官网、微信、微博等信息网络途径实施，属于信息网络侵权行为。高德软件公司主要办事机构所在地的朝阳区作为侵权结果发生地，属于该法院辖区，故亦裁定驳回了‘滴滴’公司的管辖异议。”\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		朝阳区法院表示，针对法院8起案件的一审管辖异议裁定，“滴滴”公司以及第三方劳务公司均已提出上诉，相关管辖异议已移送二审法院审理。对于案件的下一步动作，“滴滴”公司以及高德公司公关部门负责人告诉记者，目前不便透露更多信息，以法院裁定或判决结果为准，“不管怎么样，还是一切先按照司法程序走。”\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		上海汇业律师事务所合伙人洪桂彬律师告诉记者，高德公司要想获得商业秘密侵权案件的胜诉，须举证商业秘密的客观存在、“滴滴”公司侵权行为的存在、实际损失大小、侵权行为与实际损失之间存在必然因果关系。根据过往的商业秘密侵权案件的观察，高德公司举证难度较高，获得巨额赔偿概率相对较低。\r\n	</p>\r\n</div>', '0', null, '0', '0', '1');
INSERT INTO `by_document` VALUES ('119', '1', '家里发现保护动物 你知道“原麝”吗？', '159', '216', '103', '1496258473', '1496258473', '0', '<p style=\"font-size:14px;color:#333333;font-family:宋体, Arial;\">\r\n	<p style=\"font-family:SimSun;font-size:13.3333px;background-color:#FFFFFF;text-align:center;\">\r\n		<img alt=\"家里发现保护动物 是一级保护动物原麝保护站人员已对其救治\" src=\"http://www.aihami.com/uploads/allimg/170529/172-1F5291111135F.jpg\" style=\"height:295px;width:500px;\" />\r\n	</p>\r\n	<p style=\"font-family:SimSun;font-size:13.3333px;background-color:#FFFFFF;text-align:center;\">\r\n		家里发现保护动物 是一级保护动物原麝保护站人员已对其救治\r\n	</p>\r\n	<p style=\"font-family:SimSun;font-size:14px;background-color:#FFFFFF;\">\r\n		　　近日一则家里发现保护动物的新闻引发关注。日前，陕西省延安市黄龙县一位村民在家中发现一只国家一级野生保护动物--原麝。这也是陕北地区首次发现原麝。\r\n	</p>\r\n	<p style=\"font-family:SimSun;font-size:14px;background-color:#FFFFFF;\">\r\n		　　5月23日一早，陕西延安黄龙县水磨湾村的赵师傅刚刚起床，就发现自己家里“来了”一只不知名的小动物。这只小动物卡在两间房屋的夹缝中动弹不得。赵师傅立即联系当地野生动物保护部门进行求助。保护站的工作人员赶到现场，成功将小动物救出。\r\n	</p>\r\n</p>\r\n<p style=\"font-size:14px;color:#333333;font-family:宋体, Arial;\">\r\n	<br />\r\n</p>', '0', null, '0', '0', '1');
INSERT INTO `by_document` VALUES ('120', '1', '   世乒赛-许昕4-2险胜晋级次轮 第五局17-19告负', '159', '217', '118', '1496258806', '1496258806', '0', '<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img alt=\"null\" src=\"http://d.ifengimg.com/q100/img1.ugc.ifeng.com/newugc/20170531/22/wemedia/4538078d8f497bb91b54f68164dfa35ff5107e82_size151_w470_h242.png\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	北京时间5月31日晚，世乒赛男子单打第一轮比赛进行，许昕4-2艰难战胜捷克选手波兰斯基，取得开门红。六局的比分分别是10-12，11-9，11-6，11-6，17-19，11-9。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	对手实力不算强，但是许昕进入比赛的状态非常慢。首局比赛，双方就打得难解难分，许昕在关键分上连丢2分最终10-12落败。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	第二局许昕依然没有调整好状态，好在关键时候他稳住局势，11-9拿下将大比分追平。此后的许昕表现稳健，连续两个11-6拿下，总比分已是3-1领先。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	第五局，许昕遭遇到了对手的顽强反扑，双方展开了激烈的拉锯战，比分一路战平，直到17平的情况下，许昕状态波动连丢2分，双方打出了罕见的17-19的比分，许昕被拖入到第六局。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	关键第六局中，许昕依然打得艰苦，好在他把握住了机会，11-9拿下后，总比分4-2惊险击败对手，晋级下一轮。\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	（艾马）<span class=\"ifengLogo\"><a href=\"http://www.ifeng.com/\" target=\"_blank\"><img src=\"http://p2.ifengimg.com/a/2016/0810/204c433878d5cf9size1_w16_h16.png\" style=\"height:auto;\" /></a></span>\r\n</p>', '0', null, '0', '0', '1');
INSERT INTO `by_document` VALUES ('121', '1', '世界百大著名运动员：C罗居首压詹皇+梅西 中国三将入围', '159', '218', '176', '1496258867', '1496258867', '0', '<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img alt=\"null\" src=\"http://d.ifengimg.com/q100/img1.ugc.ifeng.com/newugc/20170531/9/wemedia/abe641ab9d1174e09581f7b23841e332e20d50e5_size17_w477_h326.jpg\" style=\"height:auto;\" />\r\n</p>\r\n<p class=\"picIntro\" style=\"font-size:14px;text-align:center;font-family:楷体_gb2312, 楷体;color:#2B2B2B;background-color:#FFFFFF;\">\r\n	C罗被评为世界最著名运动员\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	北京时间5月31日，专业体育媒体《ESPN》评选出了当今体坛最著名的100位运动员。皇马巨星C罗力压詹姆斯和梅西两大巨头登顶这份榜单，中国三位著名运动员宁泽涛、马龙和林丹也成功入围。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img alt=\"null\" src=\"http://d.ifengimg.com/q100/img1.ugc.ifeng.com/newugc/20170531/9/wemedia/c8c7d011d8076f4a2fdd6a2d11ea55fb367ce9e0_size22_w464_h324.jpg\" style=\"height:auto;\" />\r\n</p>\r\n<p class=\"picIntro\" style=\"font-size:14px;text-align:center;font-family:楷体_gb2312, 楷体;color:#2B2B2B;background-color:#FFFFFF;\">\r\n	梅西排名第3\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	《ESPN》最新出炉的这份名单当中，出现了相当多的足球界巨星的名字。皇马巨星C罗力压勒布朗-詹姆斯和巴萨巨星梅西，排名首位。在他们的身后，网坛天王费德勒排名第4，排名第5位的是高尔夫球巨星菲尔-迈克尔森。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img alt=\"null\" src=\"http://d.ifengimg.com/q100/img1.ugc.ifeng.com/newugc/20170531/9/wemedia/1ae7eb129e42ce880677a40f3c1085860a94d722_size31_w617_h419.jpg\" width=\"520\" height=\"353\" style=\"height:auto;\" />\r\n</p>\r\n<p class=\"picIntro\" style=\"font-size:14px;text-align:center;font-family:楷体_gb2312, 楷体;color:#2B2B2B;background-color:#FFFFFF;\">\r\n	詹皇排名第2位\r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	另一位足球巨星，巴萨天王内马尔排名第6，牙买加“飞人”博尔特排名第7位；杜兰特、纳达尔和泰格-伍兹分列8-10位。\r\n</p>', '0', null, '0', '0', '1');
INSERT INTO `by_document` VALUES ('123', '1', '众生相：1993年的上海生活印记', '159', '0', '240', '1496283007', '1496283007', '0', '<span style=\"font-family:simSun, \'Arial Narrow\', HELVETICA;font-size:14px;line-height:26px;background-color:rgba(245, 245, 245, 0.6);\">【社会历史】雨中的交通高峰。</span>', '0', null, '0', '0', '1');
INSERT INTO `by_document` VALUES ('124', '1', ' 火箭神塔都累死了，周琦能跟得上德帅和哈登死命跑吗？', '171', '281', '68', '1500217846', '1500519416', '0', '<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/pmop/2017/0601/408C40BFB3DA07E012FE10F31392409196203502_size39_w594_h396.jpeg\" style=\"height:auto;\" /> \r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/pmop/2017/0601/7EF8FBFC94A9A4E9988E44A9011022CFFF30BFF4_size31_w445_h594.jpeg\" style=\"height:auto;\" /> \r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	内内的报销实际上给火箭队提了一个很严峻的问题：不仅仅轮转问题，这样的打法真的不伤身吗？任何事情，都是需要平衡的，包括体能。而体能和对抗，恰恰就是NBA和世界篮球之间最大的本质区别。35岁的内内曾几何时也是叱咤风云的野兽派人物，但是这一次受伤和火箭的打法不无关系，火箭队作为如今跑动第一大队，真的适合周琦生存吗？\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/pmop/2017/0601/0F689EEE619E20BD5AA3C7B4243558074DA7AF70_size21_w594_h387.jpeg\" style=\"height:auto;\" /> \r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	周琦登陆NBA加盟火箭的事情甚嚣尘上，从现在的消息和训练来说，火箭应该是和周琦情投意合的，双方之间都有对彼此的需要，火箭队需要周琦的中国市场，周琦需要火箭队登陆NBA。但是不可否认的是，周琦虽然在今年夺冠，而且从运动能力上来说已经足够出色，但是身高接近2.20米的大魔王在NBA的生存状态，并不容乐观。身高体重如周琦这样的比如爵士队的封盖王戈贝尔，也只是在爵士队才风生水起。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/pmop/2017/0601/FB9494801285C1D645364C695A27825E9887EBE1_size40_w594_h415.jpeg\" style=\"height:auto;\" /> \r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	爵士和勇士的系列赛，戈贝尔打得好是因为爵士队是全NBA节奏最慢的球队，他们的阵地战是主要手段之一，大量的挡拆和内线进攻，对于勇士的内线来说是一种威胁，也是唯一的威胁，所以戈贝尔在爵士队肯定是有市场的，但是他的速率去了火箭队和勇士队这样的球队，不见得会大杀四方。刚刚进入联盟的戈贝尔瘦的和周琦一样，但是毕竟欧洲身体素质的成长速度远远高于亚洲体质，这就是为什么戈贝尔会成长到今天这个级别的原因，而且他一直都是在爵士队成长，这很重要。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/pmop/2017/0601/C781858DEA99E43B437F2F9FD9CFBB4E247B37B5_size41_w397_h594.jpeg\" style=\"height:auto;\" /> \r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	姚明在刚刚进入联盟的时候，实际上打法很轻灵，什么上海舞步，什么梦幻转身，什么一条龙突破，当时汤帅要求的姚明就是那样的发展路线。但是在这之后姚明成长为第一中锋的路上是以对抗和增重作为代价的，在什么环境下成长成什么样子就是什么样，姚明最终的体重实际上也是双刃剑。易建联在湖人队没有被留下，绝对不是因为他的投篮，或者根本上是因为他的体能和速率，已经跟不上现在的湖人队打法，毕竟沃顿也是崇尚进攻和快攻的。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/pmop/2017/0601/BAB47DF046A302DA7CB59FA3BD834E724F750999_size47_w640_h472.jpeg\" style=\"height:auto;\" /> \r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/pmop/2017/0601/CA0EC792BF6D43E61EC0115E6B7A5054226F8E54_size42_w594_h416.jpeg\" style=\"height:auto;\" /> \r\n</p>\r\n<p class=\"detailPic\" style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	<img src=\"http://p0.ifengimg.com/pmop/2017/0601/4C55720C37E3C8C4ADAA418FFEA367276031D74A_size47_w594_h396.jpeg\" style=\"height:auto;\" /> \r\n</p>\r\n<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n	火箭队现在的打法，哈登也在出现各种小伤小病，这个球队的三分球是建立在腿上，不是“手”，他们的威力是跑起来，否则德帅的战术就一文不值。那么周琦现在的对抗能力以及跑动能力，实际上和NBA正常的球队差距不大，但是直接进入火箭队或许会适得其反。中国球星进入NBA都需要循序渐进，周琦增重就势必会影响速率，如果不增重那么就会没有对抗。所以说很多人表示内内可能不会续约给了周琦一个位置进入球队，这个假设可以理解，但是以现在周琦的特点来说，他能克服体能障碍跟着德帅和哈登没死没活的跑吗？如果这个做不到，那么他在火箭队的所谓的未来，就无从谈起\r\n</p>', '0', null, '0', '0', '1');
INSERT INTO `by_document` VALUES ('174', '1', 'Google Chrome浏览器 61.0', '185', '236', '74', '1500218244', '1500218353', '0', 'content', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('178', '1', 'Firefox火狐浏览器 55.0', '185', '237', '20', '1500218515', '1500218515', '0', 'content', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('179', '1', '傲游云浏览器 5.0.4', '185', '238', '27', '1500218567', '1500218567', '0', 'content', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('180', '1', ' 360安全浏览器 9.1', '185', '239', '27', '1500218647', '1500218674', '0', 'content', '0', null, '1', '0', '3');
INSERT INTO `by_document` VALUES ('181', '1', 'opera 浏览器46.0.2597.39', '185', '241', '23', '1500218768', '1500218838', '0', 'content', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('182', '1', '微信电脑版 2.4.5', '184', '243', '31', '1500218976', '1500218976', '0', 'content', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('183', '1', '千牛|阿里旺旺卖家版 5.11', '184', '244', '37', '1500219032', '1500219032', '0', 'content千牛|阿里旺旺卖家版 5.11', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('184', '1', '百度Hi 5.2.6', '184', '245', '20', '1500219071', '1500219071', '0', 'content百度Hi 5.2.6', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('185', '1', 'QT语音 4.6.22', '184', '247', '24', '1500219146', '1500219146', '0', 'content', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('186', '1', '酷狗音乐播放器', '186', '248', '36', '1500219296', '1500219296', '0', 'content', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('187', '1', '网易云音乐', '186', '249', '21', '1500219360', '1500219360', '0', 'content', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('190', '1', '多米音乐', '186', '251', '25', '1500219438', '1500219438', '0', 'content', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('191', '1', 'qq音乐', '186', '252', '32', '1500219535', '1500219535', '0', 'content<a target=\"_blank\" href=\"https://www.baidu.com/s?wd=qq%E9%9F%B3%E4%B9%90&amp;tn=50000022_hao_pg&amp;ie=utf-8&amp;rsv_cq=%E9%9F%B3%E4%B9%90%E6%92%AD%E6%94%BE%E8%BD%AF%E4%BB%B6%E6%8E%92%E5%90%8D&amp;rsv_dl=0_right_recommends_merge_21102&amp;euri=92ffa6db6cb349faa24cb7ca12d607bf\">qq音乐</a>', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('192', '1', '天天动听', '186', '253', '23', '1500219619', '1500219619', '0', 'content', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('193', '1', '美图秀秀', '187', '254', '27', '1500219702', '1500219702', '0', 'content', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('196', '1', 'photoshop', '187', '256', '26', '1500219865', '1500219865', '0', 'content<a target=\"_blank\" href=\"https://www.baidu.com/s?tn=50000022_hao_pg&amp;wd=photoshop+cc&amp;usm=2&amp;ie=utf-8&amp;rsv_cq=%E5%9B%BE%E5%83%8F%E7%BC%96%E8%BE%91&amp;rsv_dl=0_right_recommends_merge_21102&amp;cq=%E5%9B%BE%E5%83%8F%E7%BC%96%E8%BE%91&amp;srcid=28310&amp;rt=%E5%9B%BE%E5%83%8F%E6%B5%8F%E8%A7%88%E7%BC%96%E8%BE%91%E8%BD%AF%E4%BB%B6&amp;recid=21102&amp;euri=8ca4b2d13da7494fbe86cf45b8737474\">photoshop&nbsp;</a>', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('197', '1', '光影魔术手', '187', '258', '32', '1500244516', '1501312456', '0', 'content', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('198', '1', ' 2345看图王', '187', '298', '37', '1500244591', '1501312521', '0', 'content', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('199', '1', 'Picasa', '187', '260', '136', '1500244773', '1500246710', '0', 'content', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('200', '1', '北京暴雨过后 市民捉鱼忙', '183', '265', '445', '1501186489', '1501186502', '0', '<span style=\"color:#555555;font-family:\" font-size:14px;background-color:#ffffff;\"=\"\">2017年7月15日，北京石景山区莲石湖畔因受凌晨暴雨影响，湖面水位上涨，水面溢出大桥下停车场，吸引市民前来捉鱼。来源：视觉中国<span style=\"color:#555555;font-family:\" font-size:14px;background-color:#ffffff;\"=\"\">2017年7月15日，北京石景山区莲石湖畔因受凌晨暴雨影响，湖面水位上涨，水面溢出大桥下停车场，吸引市民前来捉鱼。来源：视觉中国</span><span style=\"color:#555555;font-family:\" font-size:14px;background-color:#ffffff;\"=\"\">2017年7月15日，北京石景山区莲石湖畔因受凌晨暴雨影响，湖面水位上涨，水面溢出大桥下停车场，吸引市民前来捉鱼。来源：视觉中国</span><span style=\"color:#555555;font-family:\" font-size:14px;background-color:#ffffff;\"=\"\">2017年7月15日，北京石景山区莲石湖畔因受凌晨暴雨影响，湖面水位上涨，水面溢出大桥下停车场，吸引市民前来捉鱼。来源：视觉中国<span style=\"color:#555555;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">2017年7月15日，北京石景山区莲石湖畔因受凌晨暴雨影响，湖面水位上涨，水面溢出大桥下停车场，吸引市民前来捉鱼。来源：视觉中国</span></span></span>', '0', null, '1', '0', '2');
INSERT INTO `by_document` VALUES ('203', '1', '陕师大老教授坚持11年为新生手写录取通知书', '183', '279', '463', '1500255311', '1501184254', '0', '<p style=\"font-family:宋体;font-size:12pt;color:#454545;\">\r\n	7月15日，陕师大一会议室里纸墨飘香，陕西师大的老教授们又开启为新一届刚刚录取的大学生毛笔手书高考录取通知书的序幕。据了解，陕师大毛笔手写通知书今年已坚持11个年头。\r\n</p>\r\n<p style=\"font-family:宋体;font-size:12pt;color:#454545;\">\r\n	　　7月15日上午9时许，高温酷暑下，陕西师大雁塔校区办公楼的一间会议室内，文占申、吕九如等10多位满头银发的老教授，手持小楷笔，凝神静气，使用标准的毛笔楷书，精心书写一封封录取通知书，今年被录取的4500名大学生每人将获得这样一封毛笔手书的高考录取通知书。\r\n</p>\r\n<p style=\"font-family:宋体;font-size:12pt;color:#454545;\">\r\n	　　一位教师介绍，陕西师大从2007年考试招收免费师范生开始，就开始了使用毛笔为新生书写高考录取通知，这样做是源于学校历来就有重视培养学生中国文化素养的传统，学校历史上涌现出一大批国内外知名的著名书法家。\r\n</p>\r\n<p style=\"font-family:宋体;font-size:12pt;color:#454545;\">\r\n	　　陕西师范大学副校长党怀兴表示，书法是最具有代表性的文化标识，书法在培育家国情怀、孕育君子品格、涵养大学精神等方面具有重要作用。“作为师范院校，要求学生写好粉笔字、钢笔字、毛笔字成为未来作为教师的基本功是一贯的坚持。”他表示，学校坚持手书录取通知，希望为新一届学生送上入学首礼，捎去老师们的一纸墨香，借此启发引导学生注重书法在内的传统文化素养的学习，在收藏这份关爱的同时，领略中国书法的内在之美。\r\n</p>\r\n<p style=\"font-family:宋体;font-size:12pt;color:#454545;\">\r\n	　　在书写仪式上，当年拿着老师们毛笔手书录取通知书入学的2010级免费师范生李健顺也来参加活动了。他说，自己就是受到老师们的影响和熏陶习练书法的，现在作为一名中学数学教师，平时也组织学生习练书法并在比赛中获奖，参加活动就是为了更好的传承学校这项优良传统。\r\n</p>', '0', null, '0', '0', '2');
INSERT INTO `by_document` VALUES ('173', '1', 'qq2013下载', '184', '242', '103', '1500216595', '1500218887', '0', 'content', '0', null, '0', '0', '3');
INSERT INTO `by_document` VALUES ('214', '1', '加德满都的风铃', '188', '307', '39', '1501416187', '1501416215', '0', 'content', '0', null, '0', '0', '4');
INSERT INTO `by_document` VALUES ('215', '1', '亚洲最强歼20战机现身阅兵！正面霸气照帅瞎你', '182', '308', '2', '1501559423', '1501559539', '0', 'content', '0', null, '0', '0', '2');
INSERT INTO `by_document` VALUES ('216', '1', '俄罗斯海军的两只钢铁巨兽：冷战遗物', '182', '314', '4', '1501568946', '1501568980', '0', 'content', '0', null, '0', '0', '2');
INSERT INTO `by_document` VALUES ('211', '1', '黑夜的光-橄榄枝乐队', '188', '303', '56', '1501414720', '1501414766', '0', 'content', '0', null, '1', '0', '4');
INSERT INTO `by_document` VALUES ('212', '1', '雨一直下-张宇', '188', '304', '19', '1501414956', '1501414956', '0', 'content', '0', null, '1', '0', '4');
INSERT INTO `by_document` VALUES ('213', '1', '从今以后-陈百强', '188', '306', '14', '1501415492', '1501553591', '0', 'content', '0', null, '1', '0', '4');
INSERT INTO `by_document` VALUES ('208', '1', '当周星驰遇到小苹果', '188', '299', '16', '1501413997', '1501413997', '0', 'content', '0', null, '1', '0', '4');
INSERT INTO `by_document` VALUES ('209', '1', ' 北京祝福你', '188', '300', '11', '1501414220', '1501414220', '0', 'content', '0', null, '0', '0', '4');
INSERT INTO `by_document` VALUES ('210', '1', '火火的世界-华语童星', '188', '301', '16', '1501414254', '1501414330', '0', 'content', '0', null, '0', '0', '4');
INSERT INTO `by_document` VALUES ('207', '1', '小苹果', '188', '302', '27', '1501413794', '1501414404', '0', '<embed src=\"http://he.yinyuetai.com/uploads/videos/common/042501536B5E5281CC4AF1840E689F99.flv?sc\\u003dba026a6faba5b46b\\u0026br\\u003d3104\\u0026vid\\u003d2061637\\u0026aid\\u003d11962\\u0026area\\u003dML\\u0026vst\\u003d0\" type=\"application/x-shockwave-flash\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" />', '0', null, '1', '0', '4');
INSERT INTO `by_document` VALUES ('217', '1', '解放军展示无人机蜂群的图解：可摧毁航空母舰', '182', '326', '2', '1501570193', '1501570193', '0', '<span style=\"color:#666666;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">中国也拥有了类似的装备。近日，中国电子科技集团成功完成了119架固定翼无人机集群飞行试验，刷新了此前2016年珠海航展披露的67架固定翼无人机集群试验记录，这标志着智能无人集群领域的又一突破，奠定了中国在该领域的领先地位。</span>', '0', null, '0', '0', '2');

-- ----------------------------
-- Table structure for `by_download`
-- ----------------------------
DROP TABLE IF EXISTS `by_download`;
CREATE TABLE `by_download` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `download` int(10) NOT NULL DEFAULT '0',
  `size` int(10) NOT NULL DEFAULT '0',
  `attach` int(10) NOT NULL DEFAULT '0',
  `file_id` int(2) NOT NULL DEFAULT '1',
  `authorize` varchar(225) DEFAULT NULL,
  `language` varchar(225) DEFAULT NULL,
  `platform` varchar(225) DEFAULT NULL,
  `type` varchar(225) DEFAULT NULL,
  `level` int(2) NOT NULL DEFAULT '0',
  `url` varchar(225) NOT NULL DEFAULT 'http://www.yershop.com/yershop_v2.zip',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COMMENT='下载表';

-- ----------------------------
-- Records of by_download
-- ----------------------------
INSERT INTO `by_download` VALUES ('173', '0', '100', '12', '0', '1', null, null, null, null, '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('174', '0', '2110', '10', '0', '1', '', '', 'windows', '', '5', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('178', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('179', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('180', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('181', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('182', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('183', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('184', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('185', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('186', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('187', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('190', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('191', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('192', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('193', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('196', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('197', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('198', '0', '0', '0', '0', '1', '', '', '', '', '0', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('199', '0', '4550', '10', '0', '1', '', '', 'win', '', '6', 'http://www.yershop.com/yershop_v2.zip');
INSERT INTO `by_download` VALUES ('202', '0', '0', '0', '0', '1', '', '', '', '', '0', '435345');

-- ----------------------------
-- Table structure for `by_friendlink`
-- ----------------------------
DROP TABLE IF EXISTS `by_friendlink`;
CREATE TABLE `by_friendlink` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` varchar(225) DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of by_friendlink
-- ----------------------------
INSERT INTO `by_friendlink` VALUES ('1', '官网', 'http://www.yershop.com/', '0', '0', '0', '1', '_blank');

-- ----------------------------
-- Table structure for `by_group`
-- ----------------------------
DROP TABLE IF EXISTS `by_group`;
CREATE TABLE `by_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `module` varchar(225) DEFAULT NULL,
  `icon` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of by_group
-- ----------------------------
INSERT INTO `by_group` VALUES ('1', '系统', '0', '1', 'config/systems', '0', '1', null, null);
INSERT INTO `by_group` VALUES ('7', '文章', '40', '3', 'document/index', '0', '1', null, null);
INSERT INTO `by_group` VALUES ('18', '用户', '0', '3', '', '0', '1', null, null);
INSERT INTO `by_group` VALUES ('20', '广告', '0', '4', 'slide/index', '0', '1', null, null);

-- ----------------------------
-- Table structure for `by_history`
-- ----------------------------
DROP TABLE IF EXISTS `by_history`;
CREATE TABLE `by_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `key` varchar(225) DEFAULT '' COMMENT 'key',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(2) DEFAULT '1' COMMENT '数据状态',
  `doc_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '广告图片',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=370 DEFAULT CHARSET=utf8 COMMENT='记录表';

-- ----------------------------
-- Records of by_history
-- ----------------------------
INSERT INTO `by_history` VALUES ('9', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('10', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '94', '0');
INSERT INTO `by_history` VALUES ('11', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('12', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('13', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('14', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '93', '0');
INSERT INTO `by_history` VALUES ('15', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '95', '0');
INSERT INTO `by_history` VALUES ('16', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('17', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '182', '0');
INSERT INTO `by_history` VALUES ('18', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '117', '0');
INSERT INTO `by_history` VALUES ('19', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '203', '0');
INSERT INTO `by_history` VALUES ('20', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '179', '0');
INSERT INTO `by_history` VALUES ('21', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500837776', '0', '1', '100', '0');
INSERT INTO `by_history` VALUES ('22', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '180', '0');
INSERT INTO `by_history` VALUES ('23', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '198', '0');
INSERT INTO `by_history` VALUES ('24', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '173', '0');
INSERT INTO `by_history` VALUES ('25', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '116', '0');
INSERT INTO `by_history` VALUES ('26', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '118', '0');
INSERT INTO `by_history` VALUES ('27', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '124', '0');
INSERT INTO `by_history` VALUES ('28', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '183', '0');
INSERT INTO `by_history` VALUES ('29', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '104', '0');
INSERT INTO `by_history` VALUES ('30', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500889102', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('31', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500889102', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('32', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500889927', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('33', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500889927', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('34', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '199', '0');
INSERT INTO `by_history` VALUES ('35', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '196', '0');
INSERT INTO `by_history` VALUES ('36', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500700357', '0', '1', '174', '0');
INSERT INTO `by_history` VALUES ('37', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500890718', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('38', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500890718', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('39', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500896228', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('40', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500896228', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('41', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500896228', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('42', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500896228', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('43', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500896228', '0', '1', '93', '0');
INSERT INTO `by_history` VALUES ('44', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500896228', '0', '1', '94', '0');
INSERT INTO `by_history` VALUES ('45', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500896228', '0', '1', '95', '0');
INSERT INTO `by_history` VALUES ('46', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500896228', '0', '1', '119', '0');
INSERT INTO `by_history` VALUES ('47', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500896228', '0', '1', '121', '0');
INSERT INTO `by_history` VALUES ('48', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500896228', '0', '1', '174', '0');
INSERT INTO `by_history` VALUES ('49', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500896228', '0', '1', '117', '0');
INSERT INTO `by_history` VALUES ('50', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898216', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('51', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500896228', '0', '1', '186', '0');
INSERT INTO `by_history` VALUES ('52', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('53', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('54', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('55', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('56', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '93', '0');
INSERT INTO `by_history` VALUES ('57', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '95', '0');
INSERT INTO `by_history` VALUES ('58', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '104', '0');
INSERT INTO `by_history` VALUES ('59', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '105', '0');
INSERT INTO `by_history` VALUES ('60', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '116', '0');
INSERT INTO `by_history` VALUES ('61', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '118', '0');
INSERT INTO `by_history` VALUES ('62', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '117', '0');
INSERT INTO `by_history` VALUES ('63', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '121', '0');
INSERT INTO `by_history` VALUES ('64', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '123', '0');
INSERT INTO `by_history` VALUES ('65', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '124', '0');
INSERT INTO `by_history` VALUES ('66', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '174', '0');
INSERT INTO `by_history` VALUES ('67', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '179', '0');
INSERT INTO `by_history` VALUES ('68', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '183', '0');
INSERT INTO `by_history` VALUES ('69', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '94', '0');
INSERT INTO `by_history` VALUES ('70', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '197', '0');
INSERT INTO `by_history` VALUES ('71', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '199', '0');
INSERT INTO `by_history` VALUES ('72', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('73', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '182', '0');
INSERT INTO `by_history` VALUES ('74', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '184', '0');
INSERT INTO `by_history` VALUES ('75', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '185', '0');
INSERT INTO `by_history` VALUES ('76', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500901327', '0', '1', '124', '0');
INSERT INTO `by_history` VALUES ('77', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '196', '0');
INSERT INTO `by_history` VALUES ('78', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500904058', '0', '1', '93', '0');
INSERT INTO `by_history` VALUES ('79', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500911195', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('80', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500911195', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('81', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500911195', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('82', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '203', '0');
INSERT INTO `by_history` VALUES ('83', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500929228', '0', '1', '93', '0');
INSERT INTO `by_history` VALUES ('84', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '119', '0');
INSERT INTO `by_history` VALUES ('85', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500931475', '0', '1', '116', '0');
INSERT INTO `by_history` VALUES ('86', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500933113', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('87', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500933226', '0', '1', '96', '0');
INSERT INTO `by_history` VALUES ('88', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '100', '0');
INSERT INTO `by_history` VALUES ('89', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '96', '0');
INSERT INTO `by_history` VALUES ('90', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '101', '0');
INSERT INTO `by_history` VALUES ('91', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '97', '0');
INSERT INTO `by_history` VALUES ('92', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '120', '0');
INSERT INTO `by_history` VALUES ('93', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '113', '0');
INSERT INTO `by_history` VALUES ('94', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '115', '0');
INSERT INTO `by_history` VALUES ('95', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '178', '0');
INSERT INTO `by_history` VALUES ('96', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '180', '0');
INSERT INTO `by_history` VALUES ('97', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '181', '0');
INSERT INTO `by_history` VALUES ('98', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '187', '0');
INSERT INTO `by_history` VALUES ('99', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '191', '0');
INSERT INTO `by_history` VALUES ('100', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '193', '0');
INSERT INTO `by_history` VALUES ('101', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '198', '0');
INSERT INTO `by_history` VALUES ('102', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '186', '0');
INSERT INTO `by_history` VALUES ('103', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '190', '0');
INSERT INTO `by_history` VALUES ('104', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1500898666', '0', '1', '98', '0');
INSERT INTO `by_history` VALUES ('105', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501038378', '0', '1', '93', '0');
INSERT INTO `by_history` VALUES ('106', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501038378', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('107', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501038378', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('108', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501038378', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('109', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501041008', '0', '1', '117', '0');
INSERT INTO `by_history` VALUES ('110', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501042269', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('111', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501042269', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('112', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501043769', '0', '1', '103', '0');
INSERT INTO `by_history` VALUES ('113', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501042029', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('114', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501042029', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('115', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501049214', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('116', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501049214', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('117', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501049285', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('118', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('119', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501052230', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('120', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('121', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('122', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('123', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '93', '0');
INSERT INTO `by_history` VALUES ('124', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '94', '0');
INSERT INTO `by_history` VALUES ('125', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('126', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501057174', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('127', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '95', '0');
INSERT INTO `by_history` VALUES ('128', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '100', '0');
INSERT INTO `by_history` VALUES ('129', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '103', '0');
INSERT INTO `by_history` VALUES ('130', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '105', '0');
INSERT INTO `by_history` VALUES ('131', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '113', '0');
INSERT INTO `by_history` VALUES ('132', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '116', '0');
INSERT INTO `by_history` VALUES ('133', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '117', '0');
INSERT INTO `by_history` VALUES ('134', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '98', '0');
INSERT INTO `by_history` VALUES ('135', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501066125', '0', '1', '98', '0');
INSERT INTO `by_history` VALUES ('136', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '104', '0');
INSERT INTO `by_history` VALUES ('137', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '115', '0');
INSERT INTO `by_history` VALUES ('138', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '118', '0');
INSERT INTO `by_history` VALUES ('139', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '120', '0');
INSERT INTO `by_history` VALUES ('140', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '121', '0');
INSERT INTO `by_history` VALUES ('141', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '124', '0');
INSERT INTO `by_history` VALUES ('142', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501071760', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('143', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501072884', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('144', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '101', '0');
INSERT INTO `by_history` VALUES ('145', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '184', '0');
INSERT INTO `by_history` VALUES ('146', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '191', '0');
INSERT INTO `by_history` VALUES ('147', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501075199', '0', '1', '98', '0');
INSERT INTO `by_history` VALUES ('148', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501076535', '0', '1', '203', '0');
INSERT INTO `by_history` VALUES ('149', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '203', '0');
INSERT INTO `by_history` VALUES ('150', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501078189', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('151', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501078447', '0', '1', '94', '0');
INSERT INTO `by_history` VALUES ('152', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501078926', '0', '1', '102', '0');
INSERT INTO `by_history` VALUES ('153', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501079593', '0', '1', '93', '0');
INSERT INTO `by_history` VALUES ('154', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501080844', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('155', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501082069', '0', '1', '98', '0');
INSERT INTO `by_history` VALUES ('156', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '174', '0');
INSERT INTO `by_history` VALUES ('157', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501082684', '0', '1', '100', '0');
INSERT INTO `by_history` VALUES ('158', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501083328', '0', '1', '105', '0');
INSERT INTO `by_history` VALUES ('159', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501084449', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('160', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501086536', '0', '1', '203', '0');
INSERT INTO `by_history` VALUES ('161', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '96', '0');
INSERT INTO `by_history` VALUES ('162', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '102', '0');
INSERT INTO `by_history` VALUES ('163', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501090987', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('164', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501091162', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('165', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501092346', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('166', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501092636', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('167', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501092636', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('168', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501093970', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('169', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501094348', '0', '1', '95', '0');
INSERT INTO `by_history` VALUES ('170', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '119', '0');
INSERT INTO `by_history` VALUES ('171', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '97', '0');
INSERT INTO `by_history` VALUES ('172', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501095854', '0', '1', '96', '0');
INSERT INTO `by_history` VALUES ('173', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501095935', '0', '1', '116', '0');
INSERT INTO `by_history` VALUES ('174', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501105734', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('175', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501106596', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('176', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501144408', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('177', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501145463', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('178', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '123', '0');
INSERT INTO `by_history` VALUES ('179', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '179', '0');
INSERT INTO `by_history` VALUES ('180', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '181', '0');
INSERT INTO `by_history` VALUES ('181', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '183', '0');
INSERT INTO `by_history` VALUES ('182', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '187', '0');
INSERT INTO `by_history` VALUES ('183', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '192', '0');
INSERT INTO `by_history` VALUES ('184', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '180', '0');
INSERT INTO `by_history` VALUES ('185', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '185', '0');
INSERT INTO `by_history` VALUES ('186', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '199', '0');
INSERT INTO `by_history` VALUES ('187', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '197', '0');
INSERT INTO `by_history` VALUES ('188', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '198', '0');
INSERT INTO `by_history` VALUES ('189', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501045609', '0', '1', '173', '0');
INSERT INTO `by_history` VALUES ('190', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501182174', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('191', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501182174', '0', '1', '203', '0');
INSERT INTO `by_history` VALUES ('192', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501182174', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('193', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501182174', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('194', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501182174', '0', '1', '93', '0');
INSERT INTO `by_history` VALUES ('195', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501182174', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('196', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501182174', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('197', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501182174', '0', '1', '117', '0');
INSERT INTO `by_history` VALUES ('198', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501182174', '0', '1', '95', '0');
INSERT INTO `by_history` VALUES ('199', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501182174', '0', '1', '94', '0');
INSERT INTO `by_history` VALUES ('200', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501182174', '0', '1', '116', '0');
INSERT INTO `by_history` VALUES ('201', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501185145', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('202', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501185145', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('203', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501185203', '0', '1', '103', '0');
INSERT INTO `by_history` VALUES ('204', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501187663', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('205', '', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('206', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501189188', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('207', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501190098', '0', '1', '93', '0');
INSERT INTO `by_history` VALUES ('208', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501191776', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('209', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('210', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('211', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('212', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('213', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '203', '0');
INSERT INTO `by_history` VALUES ('214', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('215', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501194238', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('216', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501194550', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('217', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '117', '0');
INSERT INTO `by_history` VALUES ('218', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501196804', '0', '1', '116', '0');
INSERT INTO `by_history` VALUES ('219', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '93', '0');
INSERT INTO `by_history` VALUES ('220', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '102', '0');
INSERT INTO `by_history` VALUES ('221', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '120', '0');
INSERT INTO `by_history` VALUES ('222', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '187', '0');
INSERT INTO `by_history` VALUES ('223', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '191', '0');
INSERT INTO `by_history` VALUES ('224', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501214514', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('225', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '173', '0');
INSERT INTO `by_history` VALUES ('226', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501219470', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('227', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501221825', '0', '1', '93', '0');
INSERT INTO `by_history` VALUES ('228', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '95', '0');
INSERT INTO `by_history` VALUES ('229', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501224294', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('230', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '100', '0');
INSERT INTO `by_history` VALUES ('231', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501224895', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('232', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '94', '0');
INSERT INTO `by_history` VALUES ('233', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '179', '0');
INSERT INTO `by_history` VALUES ('234', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '180', '0');
INSERT INTO `by_history` VALUES ('235', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '181', '0');
INSERT INTO `by_history` VALUES ('236', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '182', '0');
INSERT INTO `by_history` VALUES ('237', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '183', '0');
INSERT INTO `by_history` VALUES ('238', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '185', '0');
INSERT INTO `by_history` VALUES ('239', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '184', '0');
INSERT INTO `by_history` VALUES ('240', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '198', '0');
INSERT INTO `by_history` VALUES ('241', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '197', '0');
INSERT INTO `by_history` VALUES ('242', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501226996', '0', '1', '96', '0');
INSERT INTO `by_history` VALUES ('243', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '178', '0');
INSERT INTO `by_history` VALUES ('244', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501231606', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('245', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501232046', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('246', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '121', '0');
INSERT INTO `by_history` VALUES ('247', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '105', '0');
INSERT INTO `by_history` VALUES ('248', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '104', '0');
INSERT INTO `by_history` VALUES ('249', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '124', '0');
INSERT INTO `by_history` VALUES ('250', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '97', '0');
INSERT INTO `by_history` VALUES ('251', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '115', '0');
INSERT INTO `by_history` VALUES ('252', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '101', '0');
INSERT INTO `by_history` VALUES ('253', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '186', '0');
INSERT INTO `by_history` VALUES ('254', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '190', '0');
INSERT INTO `by_history` VALUES ('255', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '196', '0');
INSERT INTO `by_history` VALUES ('256', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '199', '0');
INSERT INTO `by_history` VALUES ('257', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '98', '0');
INSERT INTO `by_history` VALUES ('258', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '113', '0');
INSERT INTO `by_history` VALUES ('259', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '174', '0');
INSERT INTO `by_history` VALUES ('260', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '96', '0');
INSERT INTO `by_history` VALUES ('261', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '103', '0');
INSERT INTO `by_history` VALUES ('262', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '116', '0');
INSERT INTO `by_history` VALUES ('263', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '118', '0');
INSERT INTO `by_history` VALUES ('264', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '123', '0');
INSERT INTO `by_history` VALUES ('265', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '119', '0');
INSERT INTO `by_history` VALUES ('266', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '192', '0');
INSERT INTO `by_history` VALUES ('267', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '0', '1', '193', '0');
INSERT INTO `by_history` VALUES ('268', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501359411', '0', '1', '101', '0');
INSERT INTO `by_history` VALUES ('269', '', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('270', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501365951', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('271', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501367667', '0', '1', '97', '0');
INSERT INTO `by_history` VALUES ('272', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501368752', '0', '1', '100', '0');
INSERT INTO `by_history` VALUES ('273', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501389955', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('274', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501389955', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('275', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501389955', '0', '1', '93', '0');
INSERT INTO `by_history` VALUES ('276', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501391818', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('277', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501392133', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('278', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501393859', '0', '1', '101', '0');
INSERT INTO `by_history` VALUES ('279', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501389955', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('280', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501389955', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('281', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501389955', '0', '1', '203', '0');
INSERT INTO `by_history` VALUES ('282', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501389955', '0', '1', '199', '0');
INSERT INTO `by_history` VALUES ('283', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501389955', '0', '1', '198', '0');
INSERT INTO `by_history` VALUES ('284', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501389955', '0', '1', '197', '0');
INSERT INTO `by_history` VALUES ('285', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501389955', '0', '1', '173', '0');
INSERT INTO `by_history` VALUES ('286', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501389955', '0', '1', '105', '0');
INSERT INTO `by_history` VALUES ('287', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501394125', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('288', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501389955', '0', '1', '94', '0');
INSERT INTO `by_history` VALUES ('289', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501394424', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('290', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501397328', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('291', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501398997', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('292', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501398350', '0', '1', '203', '0');
INSERT INTO `by_history` VALUES ('293', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501398350', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('294', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501398350', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('295', '', '0', '1', '101', '0');
INSERT INTO `by_history` VALUES ('296', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501400592', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('297', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501400592', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('298', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501398350', '0', '1', '93', '0');
INSERT INTO `by_history` VALUES ('299', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501398350', '0', '1', '96', '0');
INSERT INTO `by_history` VALUES ('300', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501398350', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('301', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501398350', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('302', '', '0', '1', '94', '0');
INSERT INTO `by_history` VALUES ('303', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501398350', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('304', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501402754', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('305', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501398350', '0', '1', '117', '0');
INSERT INTO `by_history` VALUES ('306', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501398350', '0', '1', '95', '0');
INSERT INTO `by_history` VALUES ('307', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501398350', '0', '1', '121', '0');
INSERT INTO `by_history` VALUES ('308', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501405052', '0', '1', '116', '0');
INSERT INTO `by_history` VALUES ('309', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501398350', '0', '1', '204', '0');
INSERT INTO `by_history` VALUES ('310', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '207', '0');
INSERT INTO `by_history` VALUES ('311', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('312', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('313', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('314', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('315', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('316', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '203', '0');
INSERT INTO `by_history` VALUES ('317', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407570', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('318', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '94', '0');
INSERT INTO `by_history` VALUES ('319', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '184', '0');
INSERT INTO `by_history` VALUES ('320', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '182', '0');
INSERT INTO `by_history` VALUES ('321', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '173', '0');
INSERT INTO `by_history` VALUES ('322', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '192', '0');
INSERT INTO `by_history` VALUES ('323', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '187', '0');
INSERT INTO `by_history` VALUES ('324', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '117', '0');
INSERT INTO `by_history` VALUES ('325', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '93', '0');
INSERT INTO `by_history` VALUES ('326', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '95', '0');
INSERT INTO `by_history` VALUES ('327', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '119', '0');
INSERT INTO `by_history` VALUES ('328', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '120', '0');
INSERT INTO `by_history` VALUES ('329', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '121', '0');
INSERT INTO `by_history` VALUES ('330', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501411014', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('331', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '97', '0');
INSERT INTO `by_history` VALUES ('332', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '98', '0');
INSERT INTO `by_history` VALUES ('333', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '100', '0');
INSERT INTO `by_history` VALUES ('334', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '101', '0');
INSERT INTO `by_history` VALUES ('335', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '102', '0');
INSERT INTO `by_history` VALUES ('336', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '115', '0');
INSERT INTO `by_history` VALUES ('337', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '116', '0');
INSERT INTO `by_history` VALUES ('338', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '124', '0');
INSERT INTO `by_history` VALUES ('339', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '123', '0');
INSERT INTO `by_history` VALUES ('340', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '179', '0');
INSERT INTO `by_history` VALUES ('341', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '178', '0');
INSERT INTO `by_history` VALUES ('342', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '183', '0');
INSERT INTO `by_history` VALUES ('343', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '199', '0');
INSERT INTO `by_history` VALUES ('344', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '208', '0');
INSERT INTO `by_history` VALUES ('345', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '210', '0');
INSERT INTO `by_history` VALUES ('346', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '209', '0');
INSERT INTO `by_history` VALUES ('347', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '211', '0');
INSERT INTO `by_history` VALUES ('348', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501414757', '0', '1', '90', '0');
INSERT INTO `by_history` VALUES ('349', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501414757', '0', '1', '98', '0');
INSERT INTO `by_history` VALUES ('350', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '212', '0');
INSERT INTO `by_history` VALUES ('351', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501415197', '0', '1', '200', '0');
INSERT INTO `by_history` VALUES ('352', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '213', '0');
INSERT INTO `by_history` VALUES ('353', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '214', '0');
INSERT INTO `by_history` VALUES ('354', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '104', '0');
INSERT INTO `by_history` VALUES ('355', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '96', '0');
INSERT INTO `by_history` VALUES ('356', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501418066', '0', '1', '88', '0');
INSERT INTO `by_history` VALUES ('357', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501423615', '0', '1', '92', '0');
INSERT INTO `by_history` VALUES ('358', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '105', '0');
INSERT INTO `by_history` VALUES ('359', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '118', '0');
INSERT INTO `by_history` VALUES ('360', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '174', '0');
INSERT INTO `by_history` VALUES ('361', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '197', '0');
INSERT INTO `by_history` VALUES ('362', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '198', '0');
INSERT INTO `by_history` VALUES ('363', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501430640', '0', '1', '89', '0');
INSERT INTO `by_history` VALUES ('364', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '186', '0');
INSERT INTO `by_history` VALUES ('365', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '191', '0');
INSERT INTO `by_history` VALUES ('366', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '196', '0');
INSERT INTO `by_history` VALUES ('367', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '193', '0');
INSERT INTO `by_history` VALUES ('368', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '216', '0');
INSERT INTO `by_history` VALUES ('369', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '0', '1', '215', '0');

-- ----------------------------
-- Table structure for `by_key`
-- ----------------------------
DROP TABLE IF EXISTS `by_key`;
CREATE TABLE `by_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `key` varchar(225) DEFAULT '' COMMENT 'key',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='密钥表';

-- ----------------------------
-- Records of by_key
-- ----------------------------

-- ----------------------------
-- Table structure for `by_member`
-- ----------------------------
DROP TABLE IF EXISTS `by_member`;
CREATE TABLE `by_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `account` decimal(50,2) DEFAULT NULL COMMENT '账号余额',
  `province` varchar(225) DEFAULT NULL COMMENT '支付密码',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` varchar(16) DEFAULT NULL COMMENT '生日',
  `xingzuo` char(10) DEFAULT NULL COMMENT 'qq号',
  `city` varchar(225) DEFAULT NULL COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `area` varchar(225) DEFAULT NULL,
  `cover_id` int(10) NOT NULL DEFAULT '0',
  `real_name` varchar(225) DEFAULT NULL,
  `home_province` varchar(225) DEFAULT NULL,
  `home_city` varchar(225) DEFAULT NULL,
  `home_area` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of by_member
-- ----------------------------
INSERT INTO `by_member` VALUES ('1', '123', '0.00', '0', '0', '0', '', '10', '94', '0', '1445318127', '0', '1493573237', '1', null, '0', null, null, null, null);
INSERT INTO `by_member` VALUES ('6', '123', null, '北京', '0', '2017-03-15', null, '市辖区', '9', '0', '1490334647', '0', '1491853250', '1', '东城区', '0', '', '湖北', '武汉市', '洪山区');
INSERT INTO `by_member` VALUES ('7', '123', null, '北京', '0', '', null, '市辖区', '0', '0', '1490416562', '0', '0', '1', '东城区', '0', '3242', '湖北', '武汉市', '洪山区');
INSERT INTO `by_member` VALUES ('8', '123', null, '北京', '0', '', null, '市辖区', '0', '0', '1490416578', '0', '0', '1', '东城区', '0', '3242', '湖北', '武汉市', '洪山区');
INSERT INTO `by_member` VALUES ('9', '123', null, '北京', '0', '', null, '市辖区', '3', '0', '1490416601', '0', '1493573283', '1', '东城区', '0', '', '湖北', '武汉市', '洪山区');

-- ----------------------------
-- Table structure for `by_menu`
-- ----------------------------
DROP TABLE IF EXISTS `by_menu`;
CREATE TABLE `by_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '允许发布的内容类型',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `model_id` int(2) NOT NULL DEFAULT '2',
  `category_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of by_menu
-- ----------------------------
INSERT INTO `by_menu` VALUES ('1', '', '首页', '0', '0', '0', '0', '1', '2', '1');
INSERT INTO `by_menu` VALUES ('159', '', '国内', '0', '0', '0', '0', '1', '2', '159');
INSERT INTO `by_menu` VALUES ('162', '', '图片', '0', '0', '0', '0', '1', '1', '183');
INSERT INTO `by_menu` VALUES ('163', '', '文化', '0', '0', '0', '0', '1', '1', '163');
INSERT INTO `by_menu` VALUES ('166', '', '视频', '0', '0', '0', '0', '1', '1', '166');
INSERT INTO `by_menu` VALUES ('168', '', '文学', '0', '0', '0', '0', '1', '1', '168');
INSERT INTO `by_menu` VALUES ('169', '', '体育', '0', '0', '0', '0', '1', '1', '169');
INSERT INTO `by_menu` VALUES ('170', '', '足球', '0', '0', '0', '0', '1', '1', '170');
INSERT INTO `by_menu` VALUES ('171', '', '篮球', '0', '0', '0', '0', '1', '1', '171');
INSERT INTO `by_menu` VALUES ('177', '', '欧洲', '0', '0', '0', '0', '1', '1', '177');
INSERT INTO `by_menu` VALUES ('178', '', '娱乐', '0', '0', '0', '0', '1', '1', '178');
INSERT INTO `by_menu` VALUES ('179', '', '明星', '0', '0', '0', '0', '1', '1', '179');
INSERT INTO `by_menu` VALUES ('182', '', '军事', '0', '0', '0', '0', '1', '2', '182');
INSERT INTO `by_menu` VALUES ('183', '', '影像', '0', '0', '0', '0', '1', '2', '183');
INSERT INTO `by_menu` VALUES ('184', '', '下载', '0', '0', '0', '0', '1', '3', '184');
INSERT INTO `by_menu` VALUES ('185', '', '历史', '0', '0', '0', '0', '1', '3', '185');

-- ----------------------------
-- Table structure for `by_message`
-- ----------------------------
DROP TABLE IF EXISTS `by_message`;
CREATE TABLE `by_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) NOT NULL DEFAULT '0',
  `content` text CHARACTER SET utf8 NOT NULL,
  `uid` int(10) NOT NULL DEFAULT '0',
  `doc_id` int(10) NOT NULL DEFAULT '0',
  `sort` int(10) NOT NULL DEFAULT '0',
  `key` varchar(225) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of by_message
-- ----------------------------
INSERT INTO `by_message` VALUES ('50', '1496114194', '3465547', '1', '92', '11', null, '1');
INSERT INTO `by_message` VALUES ('51', '1496114245', '45654765', '1', '92', '16', null, '1');
INSERT INTO `by_message` VALUES ('52', '1496115471', '43543', '1', '92', '9', null, '1');
INSERT INTO `by_message` VALUES ('53', '1496115808', '2342424', '1', '92', '3', null, '1');
INSERT INTO `by_message` VALUES ('54', '1496117342', '564645', '1', '115', '0', null, '1');
INSERT INTO `by_message` VALUES ('55', '0', '1232', '0', '90', '1', null, '1');
INSERT INTO `by_message` VALUES ('56', '0', '123', '0', '92', '9', '', '1');
INSERT INTO `by_message` VALUES ('57', '0', '123', '0', '88', '3', '', '1');
INSERT INTO `by_message` VALUES ('58', '0', '123456', '0', '94', '0', '', '1');
INSERT INTO `by_message` VALUES ('59', '0', '1233256546iukvjbnhvsdffhgjhdasjfhmv 1233256546iukvjbnhvsdffhgjhdasjfhmv 1233256546iukvjbnhvsdffhgjhdasjfhmv 1233256546iukvjbnhvsdffhgjhdasjfhmv 1233256546iukvjbnhvsdffhgjhdasjfhmv 1233256546iukvjbnhvsdffhgjhdasjfhmv ', '0', '200', '0', '', '1');
INSERT INTO `by_message` VALUES ('60', '0', '123456', '0', '180', '0', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '1');
INSERT INTO `by_message` VALUES ('61', '0', '113456', '0', '92', '4', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501193017', '1');
INSERT INTO `by_message` VALUES ('62', '0', '', '0', '88', '1', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501400592', '1');
INSERT INTO `by_message` VALUES ('63', '0', '', '0', '90', '7', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501414757', '1');
INSERT INTO `by_message` VALUES ('64', '0', '123', '0', '211', '0', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '1');
INSERT INTO `by_message` VALUES ('65', '0', '123', '0', '95', '0', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '1');
INSERT INTO `by_message` VALUES ('66', '0', '回复undefined:123456', '0', '88', '0', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '1');
INSERT INTO `by_message` VALUES ('67', '0', '122334556', '0', '92', '0', 'TVt95UgoFa%1&amp2dv!O#|jNh&gt^xGEb@B4u0LZ=RAY1501407177', '1');

-- ----------------------------
-- Table structure for `by_models`
-- ----------------------------
DROP TABLE IF EXISTS `by_models`;
CREATE TABLE `by_models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(225) DEFAULT '' COMMENT '标志',
  `title` varchar(225) NOT NULL DEFAULT '' COMMENT '标题',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) DEFAULT '1' COMMENT '数据状态',
  `sort` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of by_models
-- ----------------------------
INSERT INTO `by_models` VALUES ('1', 'document', '文章', '0', '0', '1', '0');
INSERT INTO `by_models` VALUES ('2', 'photo', '图片集', '0', '0', '1', '0');
INSERT INTO `by_models` VALUES ('3', 'download', '下载', '0', '0', '1', '0');
INSERT INTO `by_models` VALUES ('4', 'video', '视频', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for `by_module`
-- ----------------------------
DROP TABLE IF EXISTS `by_module`;
CREATE TABLE `by_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `group_id` int(2) DEFAULT '0',
  `icon` varchar(225) DEFAULT NULL,
  `name` varchar(225) NOT NULL,
  `font` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of by_module
-- ----------------------------
INSERT INTO `by_module` VALUES ('1', '系统管理', '0', '1', '', '0', '1', '1', null, '', 'align-justify');
INSERT INTO `by_module` VALUES ('3', '模块管理', '1', '0', 'module/index', '0', '1', '1', '', '', 'sitemap');
INSERT INTO `by_module` VALUES ('147', '导航管理', '1', '0', 'channel/index', '0', '0', '1', null, '', 'location-arrow');
INSERT INTO `by_module` VALUES ('8', '文章分类', '1', '0', 'category/index', '0', '1', '1', null, '', 'list-ul');
INSERT INTO `by_module` VALUES ('9', '文章管理', '43', '0', 'document/index', '0', '1', '7', null, '', 'file-text');
INSERT INTO `by_module` VALUES ('143', '增加', '142', '0', 'slide/add', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('135', '用户组授权', '74', '0', 'auth/group', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('134', '删除', '74', '0', 'auth/del', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('150', '删除', '147', '0', 'channel/del', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('141', '删除', '9', '0', 'document/del', '0', '0', '7', null, '', null);
INSERT INTO `by_module` VALUES ('140', '编辑', '9', '0', 'document/edit', '0', '0', '7', null, '', null);
INSERT INTO `by_module` VALUES ('139', '增加', '9', '0', 'document/add', '0', '0', '7', null, '', null);
INSERT INTO `by_module` VALUES ('138', '删除', '8', '0', 'category/del', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('137', '编辑', '8', '0', 'category/edit', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('136', '增加', '8', '0', 'category/add', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('68', '配置管理', '1', '1', 'config/index', '0', '0', '1', null, '', 'wrench');
INSERT INTO `by_module` VALUES ('151', '日志管理', '157', '0', 'log/index', '0', '0', '18', null, '', 'calendar');
INSERT INTO `by_module` VALUES ('43', '文章管理', '0', '0', '', '0', '1', '7', null, '', 'align-justify');
INSERT INTO `by_module` VALUES ('133', '写入用户组', '74', '0', 'auth/writeGrou', '0', '0', '0', null, '', null);
INSERT INTO `by_module` VALUES ('132', '访问授权', '74', '0', 'auth/access', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('131', '编辑', '74', '0', 'auth/edit', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('130', '增加', '74', '0', 'auth/add', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('129', '删除', '78', '0', 'ucenter/del', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('128', '编辑', '78', '0', 'ucenter/edit', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('127', '增加', '78', '0', 'ucenter/add', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('73', '分组管理', '1', '0', 'group/index', '0', '0', '1', null, '', 'list-alt');
INSERT INTO `by_module` VALUES ('148', '增加', '147', '0', 'channel/add', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('149', '编辑', '147', '0', 'channel/edit', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('70', '系统设置', '1', '2', 'config/systems', '0', '0', '1', null, '', 'cog');
INSERT INTO `by_module` VALUES ('74', '角色管理', '77', '0', 'auth/index', '0', '0', '18', null, '', 'user-circle');
INSERT INTO `by_module` VALUES ('75', '增加', '3', '0', 'module/add', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('76', '编辑', '3', '2', 'module/edit', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('77', '用户管理', '0', '0', '', '0', '0', '18', null, '', 'users');
INSERT INTO `by_module` VALUES ('78', '用户列表', '77', '0', 'ucenter/index', '0', '0', '18', null, '', 'user');
INSERT INTO `by_module` VALUES ('79', '广告管理', '158', '0', 'ad/index', '0', '0', '20', null, '', 'area-chart');
INSERT INTO `by_module` VALUES ('81', '删除', '3', '0', 'module/del', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('82', '增加', '68', '0', 'config/add', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('83', '编辑', '68', '0', 'config/edit', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('84', '删除', '68', '0', 'config/del', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('85', '增加', '73', '0', 'group/add', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('86', '编辑', '73', '0', 'group/edit', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('87', '删除', '73', '0', 'group/del', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('88', '增加', '79', '0', 'ad/add', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('89', '编辑', '79', '0', 'ad/edit', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('90', '删除', '79', '0', 'ad/del', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('91', '增加', '7', '0', 'category/add', '0', '0', '3', null, '', null);
INSERT INTO `by_module` VALUES ('92', '编辑', '7', '0', 'category/edit', '0', '0', '3', null, '', null);
INSERT INTO `by_module` VALUES ('93', '删除', '7', '0', 'category/del', '0', '0', '3', null, '', null);
INSERT INTO `by_module` VALUES ('142', '幻灯片管理', '158', '0', 'slide/index', '0', '0', '20', null, '', 'sliders');
INSERT INTO `by_module` VALUES ('144', '编辑', '142', '0', 'slide/edit', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('145', '删除', '142', '0', 'slide/del', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('146', '切换分类', '142', '0', 'slide/change', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('157', '用户行为', '0', '0', '', '0', '0', '18', null, '', 'user-plus');
INSERT INTO `by_module` VALUES ('158', '图片管理', '0', '0', '', '0', '0', '20', null, '', 'align-justify');
INSERT INTO `by_module` VALUES ('159', '图片库', '158', '0', 'picture/index', '0', '0', '20', null, '', 'file-photo-o');
INSERT INTO `by_module` VALUES ('169', '删除', '159', '0', 'picture/del', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('167', '增加', '159', '0', 'picture/add', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('168', '编辑', '159', '0', 'picture/edit', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('164', '增加', '151', '0', 'log/add', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('165', '编辑', '151', '0', 'log/edit', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('166', '删除', '151', '0', 'log/del', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('171', '友情链接', '1', '0', 'friendlink/index', '0', '0', '1', null, '', 'link');
INSERT INTO `by_module` VALUES ('172', '增加', '171', '0', 'friendlink/add', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('173', '编辑', '171', '0', 'friendlink/edit', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('174', '删除', '171', '0', 'friendlink/del', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('175', '模型管理', '180', '0', 'models/index', '0', '0', '1', null, '', 'table');
INSERT INTO `by_module` VALUES ('176', '增加', '175', '0', 'models/add', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('177', '编辑', '175', '0', 'models/edit', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('178', '删除', '175', '0', 'models/del', '0', '0', '1', null, '', null);
INSERT INTO `by_module` VALUES ('179', '属性管理', '180', '0', 'attributes/index', '0', '0', '1', null, '', 'sort-amount-asc');
INSERT INTO `by_module` VALUES ('180', '模型管理', '0', '0', '', '0', '0', '1', null, '', 'align-justify');
INSERT INTO `by_module` VALUES ('181', '增加', '179', '0', 'attributes/add', '0', '0', '1', null, '', '');
INSERT INTO `by_module` VALUES ('182', '编辑', '179', '0', 'attributes/edit', '0', '0', '1', null, '', '');
INSERT INTO `by_module` VALUES ('183', '删除', '179', '0', 'attributes/del', '0', '0', '1', null, '', '');

-- ----------------------------
-- Table structure for `by_photo`
-- ----------------------------
DROP TABLE IF EXISTS `by_photo`;
CREATE TABLE `by_photo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(80) DEFAULT NULL COMMENT '标题',
  `covers` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_type_pid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COMMENT='文档模型相册表';

-- ----------------------------
-- Records of by_photo
-- ----------------------------
INSERT INTO `by_photo` VALUES ('200', '0', '北京暴雨过后 市民捉鱼忙', '278');
INSERT INTO `by_photo` VALUES ('203', '0', '陕师大老教授坚持11年为新生手写录取通知书', '280');
INSERT INTO `by_photo` VALUES ('215', '0', '亚洲最强歼20战机现身阅兵！正面霸气照帅瞎你', '311,312');
INSERT INTO `by_photo` VALUES ('216', '0', '俄罗斯海军的两只钢铁巨兽：冷战遗物', '323,324,325');
INSERT INTO `by_photo` VALUES ('217', '0', '解放军展示无人机蜂群的图解：可摧毁航空母舰', '327,328,329');

-- ----------------------------
-- Table structure for `by_picture`
-- ----------------------------
DROP TABLE IF EXISTS `by_picture`;
CREATE TABLE `by_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of by_picture
-- ----------------------------
INSERT INTO `by_picture` VALUES ('175', '/uploads/Picture/2017-04-28/59034a4b9f003.jpg', '', '23fa782a941a6528f60893bb174c9888', '8c54a8b28023e09d656ba91ccf3a926ef5b78c20', '0', '1493387851');
INSERT INTO `by_picture` VALUES ('176', '/uploads/Picture/2017-04-28/59034ab93f3f5.jpg', '', '1d1b93194d0195e27e6963f1d321a7f4', 'c745973e45e2d629b4c48dd5b4c4cc1fdd785e84', '0', '1493387961');
INSERT INTO `by_picture` VALUES ('177', '/uploads/Picture/2017-04-28/59034b104e88b.jpg', '', '570e41c7ce63f91c818df31c5182dbed', '33589360d97562d670f47efc731d4d776f9180ef', '0', '1493388048');
INSERT INTO `by_picture` VALUES ('178', '/uploads/Picture/2017-04-28/59034b89e9d83.png', '', 'bf5cede34ae0ef049c7b270622f9856a', 'f56d5ff2bb6b6bdd26600c3e55c5ccf67aa92578', '0', '1493388169');
INSERT INTO `by_picture` VALUES ('179', '/uploads/Picture/2017-04-28/59034bc962f11.png', '', 'bf5cede34ae0ef049c7b270622f9856a', 'f56d5ff2bb6b6bdd26600c3e55c5ccf67aa92578', '0', '1493388233');
INSERT INTO `by_picture` VALUES ('180', '/uploads/Picture/2017-04-28/59034c1067813.jpg', '', 'e26348f9346681b65fb5a5719537e7c3', '201147051f13958d6f3c144030e4afff42e7f8f4', '0', '1493388304');
INSERT INTO `by_picture` VALUES ('181', '/uploads/Picture/2017-04-28/59034cbe1068f.jpg', '', '69a6fb0dcb8e726b3676a21e13920e4b', '9ebdd07483c6d7904f5ea07daf072a7c7c66d28a', '0', '1493388478');
INSERT INTO `by_picture` VALUES ('182', '/uploads/Picture/2017-04-28/59035e220cf7e.jpg', '', '570e41c7ce63f91c818df31c5182dbed', '33589360d97562d670f47efc731d4d776f9180ef', '0', '1493392930');
INSERT INTO `by_picture` VALUES ('183', '/uploads/Picture/2017-04-29/59037b67ab6dd.jpg', '', '74145ada189fb1746abaf3782336c2db', '6fa8d48efb78d4319566f0115e5c5f73a76d490d', '0', '1493400423');
INSERT INTO `by_picture` VALUES ('184', '/uploads/Picture/2017-04-29/59037d7d745fc.jpg', '', '74145ada189fb1746abaf3782336c2db', '6fa8d48efb78d4319566f0115e5c5f73a76d490d', '0', '1493400957');
INSERT INTO `by_picture` VALUES ('185', '/uploads/Picture/2017-04-29/59037d8279657.jpg', '', '5db49cfe0a40d4e1cb1e46d82a888b79', '7ca71a9fe1dc689eda7d4abb180f50e2c0e866bb', '0', '1493400962');
INSERT INTO `by_picture` VALUES ('186', '/uploads/Picture/2017-04-29/59037f317d15b.jpg', '', 'b0897b6123ff28d985b24c4ef906efd9', '7e9ccdf25d6bd7b8883d0de2fc83b77da41b8313', '0', '1493401393');
INSERT INTO `by_picture` VALUES ('187', '/uploads/Picture/2017-04-30/5905479fea473.png', '', '7074c8e8f6941744b98ad9e4bc686bc6', '0001431c44ed3f72e65aa64a6a57c2da2c32e544', '0', '1493518239');
INSERT INTO `by_picture` VALUES ('188', '/uploads/Picture/2017-04-30/5905483fed088.png', '', '7074c8e8f6941744b98ad9e4bc686bc6', '0001431c44ed3f72e65aa64a6a57c2da2c32e544', '0', '1493518399');
INSERT INTO `by_picture` VALUES ('189', '/uploads/Picture/2017-04-30/59054bf966d81.png', '', '7074c8e8f6941744b98ad9e4bc686bc6', '0001431c44ed3f72e65aa64a6a57c2da2c32e544', '0', '1493519353');
INSERT INTO `by_picture` VALUES ('190', '/uploads/Picture/2017-05-14/5918670724155.jpg', '', 'b139cc21af935702986488e71bf1736b', '648a5f92df1472dfda9b0c3857eba5cb3c080d84', '0', '1494771463');
INSERT INTO `by_picture` VALUES ('191', '/uploads/Picture/2017-05-14/591867989107a.png', '', '7b12e981a668671491e8fe1e7a8c5af5', '40ea0fbd251b44220687b41b68e87531f1f2a573', '0', '1494771608');
INSERT INTO `by_picture` VALUES ('192', '/uploads/Picture/2017-05-14/591867db1dcf8.jpg', '', 'b139cc21af935702986488e71bf1736b', '648a5f92df1472dfda9b0c3857eba5cb3c080d84', '0', '1494771675');
INSERT INTO `by_picture` VALUES ('193', '/uploads/Picture/2017-05-14/591868b2c3a0b.jpg', '', 'b139cc21af935702986488e71bf1736b', '648a5f92df1472dfda9b0c3857eba5cb3c080d84', '0', '1494771890');
INSERT INTO `by_picture` VALUES ('194', '/uploads/Picture/2017-05-14/59186914eba25.jpg', '', 'b139cc21af935702986488e71bf1736b', '648a5f92df1472dfda9b0c3857eba5cb3c080d84', '0', '1494771988');
INSERT INTO `by_picture` VALUES ('195', '/uploads/Picture/2017-05-14/59186be9c06a2.jpg', '', 'b139cc21af935702986488e71bf1736b', '648a5f92df1472dfda9b0c3857eba5cb3c080d84', '0', '1494772713');
INSERT INTO `by_picture` VALUES ('196', '/uploads/Picture/2017-05-14/59186c2a25f9b.png', '', '7b12e981a668671491e8fe1e7a8c5af5', '40ea0fbd251b44220687b41b68e87531f1f2a573', '0', '1494772778');
INSERT INTO `by_picture` VALUES ('197', '/uploads/Picture/2017-05-14/59186cc37b9eb.png', '', '7b12e981a668671491e8fe1e7a8c5af5', '40ea0fbd251b44220687b41b68e87531f1f2a573', '0', '1494772931');
INSERT INTO `by_picture` VALUES ('198', '/uploads/Picture/2017-05-14/5918704758212.png', '', '7b12e981a668671491e8fe1e7a8c5af5', '40ea0fbd251b44220687b41b68e87531f1f2a573', '0', '1494773831');
INSERT INTO `by_picture` VALUES ('199', '/uploads/Picture/2017-05-14/5918708571b95.png', '', '7b12e981a668671491e8fe1e7a8c5af5', '40ea0fbd251b44220687b41b68e87531f1f2a573', '0', '1494773893');
INSERT INTO `by_picture` VALUES ('200', '/uploads/Picture/2017-05-14/591873655f6a5.png', '', '7b12e981a668671491e8fe1e7a8c5af5', '40ea0fbd251b44220687b41b68e87531f1f2a573', '0', '1494774629');
INSERT INTO `by_picture` VALUES ('201', '/uploads/Picture/2017-05-15/59188f85897a6.jpg', '', 'b139cc21af935702986488e71bf1736b', '648a5f92df1472dfda9b0c3857eba5cb3c080d84', '0', '1494781829');
INSERT INTO `by_picture` VALUES ('202', '/uploads/Picture/2017-05-15/59188fe63d297.jpg', '', 'b139cc21af935702986488e71bf1736b', '648a5f92df1472dfda9b0c3857eba5cb3c080d84', '0', '1494781926');
INSERT INTO `by_picture` VALUES ('203', '/uploads/Picture/2017-05-15/5918912d70cac.jpg', '', 'b139cc21af935702986488e71bf1736b', '648a5f92df1472dfda9b0c3857eba5cb3c080d84', '0', '1494782253');
INSERT INTO `by_picture` VALUES ('204', '/uploads/Picture/2017-05-15/591891aad3eae.jpg', '', 'b139cc21af935702986488e71bf1736b', '648a5f92df1472dfda9b0c3857eba5cb3c080d84', '0', '1494782378');
INSERT INTO `by_picture` VALUES ('205', '/uploads/Picture/2017-05-15/59189c25e1fff.png', '', 'ee86f3c6021303f6bf06ed77797bd64e', '738cc58bf5f2f5b0b600eb48cdfa936d664bcd87', '0', '1494785061');
INSERT INTO `by_picture` VALUES ('206', '/uploads/Picture/2017-05-17/591b4ecf47d3b.png', '', '7b12e981a668671491e8fe1e7a8c5af5', '40ea0fbd251b44220687b41b68e87531f1f2a573', '0', '1494961871');
INSERT INTO `by_picture` VALUES ('207', '/uploads/Picture/2017-05-17/591b507bb3163.jpg', '', 'b139cc21af935702986488e71bf1736b', '648a5f92df1472dfda9b0c3857eba5cb3c080d84', '0', '1494962299');
INSERT INTO `by_picture` VALUES ('208', '/uploads/Picture/2017-05-17/591b50935df75.png', '', '7b12e981a668671491e8fe1e7a8c5af5', '40ea0fbd251b44220687b41b68e87531f1f2a573', '0', '1494962323');
INSERT INTO `by_picture` VALUES ('209', '/uploads/Picture/2017-05-17/591b51523b5c8.png', '', 'e462862536588d3711896fc501455bc1', 'bf4cc516d03fc026edd53ea14734c4c2e1ad8e96', '0', '1494962514');
INSERT INTO `by_picture` VALUES ('210', '/uploads/Picture/2017-05-17/591b51caab36d.png', '', '7b12e981a668671491e8fe1e7a8c5af5', '40ea0fbd251b44220687b41b68e87531f1f2a573', '0', '1494962634');
INSERT INTO `by_picture` VALUES ('211', '/uploads/Picture/2017-05-17/591b5a93486fc.png', '', '7b12e981a668671491e8fe1e7a8c5af5', '40ea0fbd251b44220687b41b68e87531f1f2a573', '0', '1494964883');
INSERT INTO `by_picture` VALUES ('212', '/uploads/Picture/2017-05-18/591d51dfbf030.jpg', '', 'b139cc21af935702986488e71bf1736b', '648a5f92df1472dfda9b0c3857eba5cb3c080d84', '0', '1495093727');
INSERT INTO `by_picture` VALUES ('213', '/uploads/Picture/2017-06-01/592f1483a2db4.jpg', '', 'e91d7b93dd88d79eb1ab6029b9420e87', '4f15a3484196aabef7996f514ec9079ff815a4b3', '0', '1496257667');
INSERT INTO `by_picture` VALUES ('214', '/uploads/Picture/2017-06-01/592f167f9c2ca.png', '', '75356a2a15e63fa891af7a807bf31668', '8924131662d159c1217ea893aee1fe4edeca4a05', '0', '1496258175');
INSERT INTO `by_picture` VALUES ('215', '/uploads/Picture/2017-06-01/592f16f632797.jpg', '', '4eef4ef4cba9a9083c1595945244bedf', '7a182f8e30613a365eca05f5c09d9a21cb50e04a', '0', '1496258294');
INSERT INTO `by_picture` VALUES ('216', '/uploads/Picture/2017-06-01/592f17a643624.jpg', '', '1d1089d0560b6d52e7b475931325c5c1', '5af8aab5e80401cdb368ffaf833b0087f893299a', '0', '1496258470');
INSERT INTO `by_picture` VALUES ('217', '/uploads/Picture/2017-06-01/592f18f4b154a.png', '', '1626da12bf5a0a4f9a870476bf85e3d9', '1f414eed373034ed205f92cd207ee59cb6d49bbb', '0', '1496258804');
INSERT INTO `by_picture` VALUES ('218', '/uploads/Picture/2017-06-01/592f19315df9d.jpg', '', 'de51477ac01a0e718bdded99fab190fa', '441bd35c3c6b19bc532b93c70dcdb37160afc3d3', '0', '1496258865');
INSERT INTO `by_picture` VALUES ('219', '/uploads/Picture/2017-06-01/592f1a0a0fe60.jpg', '', 'bd1e230e0974891d9b822b887fac5e34', 'cfcf912bc910376f8f38b88527169fd6a4e72c77', '0', '1496259082');
INSERT INTO `by_picture` VALUES ('220', '/uploads/Picture/2017-06-01/592f1a84d3997.jpg', '', 'bd1e230e0974891d9b822b887fac5e34', 'cfcf912bc910376f8f38b88527169fd6a4e72c77', '0', '1496259204');
INSERT INTO `by_picture` VALUES ('221', '/uploads/Picture/2017-06-22/594abf78b598d.jpg', '', '24d12a976c2b0387ed6582dd87f5dfd9', '0795b56a9ad6cf91ad98cbde4ba78243c864921b', '0', '1498070904');
INSERT INTO `by_picture` VALUES ('222', '/uploads/Picture/2017-06-22/594abfe93f762.png', '', 'f5d0060749705cb3aaf97e03e98b650c', '5c05a634f208f06957e2723b68bb6e42132a8041', '0', '1498071017');
INSERT INTO `by_picture` VALUES ('223', '/uploads/Picture/2017-06-22/594ac0359569f.png', '', 'f5d0060749705cb3aaf97e03e98b650c', '5c05a634f208f06957e2723b68bb6e42132a8041', '0', '1498071093');
INSERT INTO `by_picture` VALUES ('224', '/uploads/Picture/2017-06-22/594ac07f8e970.png', '', 'f5d0060749705cb3aaf97e03e98b650c', '5c05a634f208f06957e2723b68bb6e42132a8041', '0', '1498071167');
INSERT INTO `by_picture` VALUES ('225', '/uploads/Picture/2017-06-22/594ac17be62fb.png', '', 'f5d0060749705cb3aaf97e03e98b650c', '5c05a634f208f06957e2723b68bb6e42132a8041', '0', '1498071419');
INSERT INTO `by_picture` VALUES ('226', '/uploads/Picture/2017-06-22/594ac1ad595d7.png', '', 'f5d0060749705cb3aaf97e03e98b650c', '5c05a634f208f06957e2723b68bb6e42132a8041', '0', '1498071469');
INSERT INTO `by_picture` VALUES ('227', '/uploads/Picture/2017-06-22/594ac1dc2b7cb.png', '', 'f5d0060749705cb3aaf97e03e98b650c', '5c05a634f208f06957e2723b68bb6e42132a8041', '0', '1498071516');
INSERT INTO `by_picture` VALUES ('228', '/uploads/Picture/2017-06-22/594ac2313c732.png', '', 'f5d0060749705cb3aaf97e03e98b650c', '5c05a634f208f06957e2723b68bb6e42132a8041', '0', '1498071601');
INSERT INTO `by_picture` VALUES ('229', '/uploads/Picture/2017-06-22/594ac24eb60cc.png', '', 'f5d0060749705cb3aaf97e03e98b650c', '5c05a634f208f06957e2723b68bb6e42132a8041', '0', '1498071630');
INSERT INTO `by_picture` VALUES ('230', '/uploads/Picture/2017-06-28/5952d85966d77.png', '', '4f0f65fbedeed9540b9c83bb335397fc', '690dcd113d989661aa40881a28b76c023c4bb37d', '0', '1498601561');
INSERT INTO `by_picture` VALUES ('231', '/uploads/Picture/2017-06-28/5952d8bdcb1eb.png', '', '4f0f65fbedeed9540b9c83bb335397fc', '690dcd113d989661aa40881a28b76c023c4bb37d', '0', '1498601661');
INSERT INTO `by_picture` VALUES ('232', '/uploads/Picture/2017-06-28/5952d90c39f4f.png', '', '4f0f65fbedeed9540b9c83bb335397fc', '690dcd113d989661aa40881a28b76c023c4bb37d', '0', '1498601740');
INSERT INTO `by_picture` VALUES ('233', '/uploads/Picture/2017-06-28/5952d975bcd6d.png', '', 'f1ec2b860fd02c3db5fb1bfad64fd935', '671ff3cddf7113800686ef6b836263463e634b95', '0', '1498601845');
INSERT INTO `by_picture` VALUES ('234', '/uploads/Picture/2017-07-01/5956aff5ceece.jpg', '', 'a1ed2886deaa869cdf43699e883298d5', '6805a9dc1f526b020d8f226cfc1b01682c0fe61b', '0', '1498853365');
INSERT INTO `by_picture` VALUES ('235', '/uploads/Picture/2017-07-01/5956b22643f17.jpg', '', 'a1ed2886deaa869cdf43699e883298d5', '6805a9dc1f526b020d8f226cfc1b01682c0fe61b', '0', '1498853926');
INSERT INTO `by_picture` VALUES ('236', '/uploads/Picture/2017-07-16/596b83567d637.jpg', '', '298af5481c770caaa9c8f8e1ffa7048a', '92b5331363392af7c3db9f072c2c0f319c371537', '0', '1500218198');
INSERT INTO `by_picture` VALUES ('237', '/uploads/Picture/2017-07-16/596b848a6d33a.jpg', '', '803b77efc5e00d80adb988deb71cea88', '1d228463a630f637d12c5b830c5e24c7423fd8d5', '0', '1500218506');
INSERT INTO `by_picture` VALUES ('238', '/uploads/Picture/2017-07-16/596b84c406bea.jpg', '', '34eb19a86ac49d0bc09040cbb57a3ae8', 'a5e7a390437e14fea6bca35d6e7a7786f4091461', '0', '1500218564');
INSERT INTO `by_picture` VALUES ('239', '/uploads/Picture/2017-07-16/596b8529becdd.jpg', '', '392663312b42b11daca332ec2ce34a87', 'b1f9174d8ef24d6400f0587c2b6f3c96741df508', '0', '1500218665');
INSERT INTO `by_picture` VALUES ('240', '/uploads/Picture/2017-07-16/596b858bd69ca.jpg', '', 'adb92f665edc9fdc0ebee88e62cdbd02', '51a481923b2e9f5b63f7fdc6aaa39eb22e770029', '0', '1500218763');
INSERT INTO `by_picture` VALUES ('241', '/uploads/Picture/2017-07-16/596b85d1427d3.jpg', '', '4542f3dbc5352cec36261aea81a39f01', 'ef6a50b52ff2ad78d23e303506a19478fda21ac2', '0', '1500218833');
INSERT INTO `by_picture` VALUES ('242', '/uploads/Picture/2017-07-16/596b8603cc4ad.jpg', '', '7bf692e15c17b7489fc6029913121435', '83a8a0c63bec7ed8b2d35adc7addc095e6d0e783', '0', '1500218883');
INSERT INTO `by_picture` VALUES ('243', '/uploads/Picture/2017-07-16/596b865bc1ac3.jpg', '', '29cb17be93f00e2694302c009c91a279', '183303734889c199961d1ef824678e000415fa34', '0', '1500218971');
INSERT INTO `by_picture` VALUES ('244', '/uploads/Picture/2017-07-16/596b86908521d.jpg', '', 'c704338306e181bd4cdfe6c97436e948', '54d40719f878cf9f5129986848604b1e13440dff', '0', '1500219024');
INSERT INTO `by_picture` VALUES ('245', '/uploads/Picture/2017-07-16/596b86ba94c90.jpg', '', '61976eda4f302930ec6e379a0443d5f1', 'ebb570a4703a1f068d7332165372ea4f9c24e332', '0', '1500219066');
INSERT INTO `by_picture` VALUES ('246', '/uploads/Picture/2017-07-16/596b86f250a4a.jpg', '', '6dbacf4631aa006bd2a4d61affe49f91', '3a311d21941ff1dbca634244a3c403086f7a8829', '0', '1500219122');
INSERT INTO `by_picture` VALUES ('247', '/uploads/Picture/2017-07-16/596b87046f54a.jpg', '', '6dbacf4631aa006bd2a4d61affe49f91', '3a311d21941ff1dbca634244a3c403086f7a8829', '0', '1500219140');
INSERT INTO `by_picture` VALUES ('248', '/uploads/Picture/2017-07-16/596b879bf2737.jpg', '', 'f835218844da4116e48bea813e9256e9', 'c1ed38efc18a0d3cdd33a6502743f3f8a024bbbf', '0', '1500219291');
INSERT INTO `by_picture` VALUES ('249', '/uploads/Picture/2017-07-16/596b87d9381ad.jpg', '', '4627b7d99c12208c13444f8593998838', '9b7daf4656afa3f94a85a573972bf0a113126f76', '0', '1500219353');
INSERT INTO `by_picture` VALUES ('250', '/uploads/Picture/2017-07-16/596b8803f36d0.jpg', '', 'b190c15434ca6eb83acedb8631223316', '10b1f14caf7d524fb6374fe7835f853ed2d2c4b3', '0', '1500219395');
INSERT INTO `by_picture` VALUES ('251', '/uploads/Picture/2017-07-16/596b882ad545d.jpg', '', 'b190c15434ca6eb83acedb8631223316', '10b1f14caf7d524fb6374fe7835f853ed2d2c4b3', '0', '1500219434');
INSERT INTO `by_picture` VALUES ('252', '/uploads/Picture/2017-07-16/596b888abb780.jpg', '', 'ea746802e6ffc78f3a8cf5b008766ce0', '87f80a4efcb5502e81e69c913bce12a400d86e37', '0', '1500219530');
INSERT INTO `by_picture` VALUES ('253', '/uploads/Picture/2017-07-16/596b88df46017.jpg', '', '853e06fc9f115a41a1f041465eb01e41', '1fd37a8af1633d19a414798d8a6b03f0f7357719', '0', '1500219615');
INSERT INTO `by_picture` VALUES ('254', '/uploads/Picture/2017-07-16/596b892fa6207.jpg', '', '3e17c4e4abb8e2af4198711eaa1b8024', 'dbd8309d18c0eae4e35d4f42b7f97756b5d21912', '0', '1500219695');
INSERT INTO `by_picture` VALUES ('255', '/uploads/Picture/2017-07-16/596b89688fc5a.jpg', '', '4598758627d3d9349761af0b2c7a7318', '0590428578e6908a74f49a26bff1050f2c7811cb', '0', '1500219752');
INSERT INTO `by_picture` VALUES ('256', '/uploads/Picture/2017-07-16/596b89d1c9faa.jpg', '', '4598758627d3d9349761af0b2c7a7318', '0590428578e6908a74f49a26bff1050f2c7811cb', '0', '1500219857');
INSERT INTO `by_picture` VALUES ('257', '/uploads/Picture/2017-07-17/596bea05dd3d7.jpg', '', '4598758627d3d9349761af0b2c7a7318', '0590428578e6908a74f49a26bff1050f2c7811cb', '0', '1500244485');
INSERT INTO `by_picture` VALUES ('258', '/uploads/Picture/2017-07-17/596bea2141180.jpg', '', 'd7e1a68ba966257cdaf7198dd87f5af8', 'b9066b227e43e77a082b7a4fee831b9eedb9b7b4', '0', '1500244513');
INSERT INTO `by_picture` VALUES ('259', '/uploads/Picture/2017-07-17/596bea6b77320.jpg', '', 'edfe076eb8ab857c4e9dc8d19a74cd27', 'e6d0a13311ea0b154184d0e9da2350527fbac89b', '0', '1500244587');
INSERT INTO `by_picture` VALUES ('260', '/uploads/Picture/2017-07-17/596beb209b39d.jpg', '', '9fe0f421ee97fdde9b008b9398f5d20e', 'd503fb2d874527f2e04a0ad5441d54cf57572b5a', '0', '1500244768');
INSERT INTO `by_picture` VALUES ('261', '/uploads/Picture/2017-07-17/596bf6fcddd63.jpg', '', 'baf0621c3ca0f9f38c3d0be4a0d777bb', '0e3b419b0ecb01aa2ffe68140bc5ec51c1dfdd9e', '0', '1500247804');
INSERT INTO `by_picture` VALUES ('262', '/uploads/Picture/2017-07-17/596bf70873223.jpg', '', '340744e521e8730fc0a6aae6fc327eb1', '5d64faa53ec5e3234db622462ef63fe32e896fd8', '0', '1500247816');
INSERT INTO `by_picture` VALUES ('263', '/uploads/Picture/2017-07-17/596bf9047414d.jpg', '', 'baf0621c3ca0f9f38c3d0be4a0d777bb', '0e3b419b0ecb01aa2ffe68140bc5ec51c1dfdd9e', '0', '1500248324');
INSERT INTO `by_picture` VALUES ('264', '/uploads/Picture/2017-07-17/596bf90d68b8a.jpg', '', '340744e521e8730fc0a6aae6fc327eb1', '5d64faa53ec5e3234db622462ef63fe32e896fd8', '0', '1500248333');
INSERT INTO `by_picture` VALUES ('265', '/uploads/Picture/2017-07-17/596bf922a9c53.jpg', '', '340744e521e8730fc0a6aae6fc327eb1', '5d64faa53ec5e3234db622462ef63fe32e896fd8', '0', '1500248354');
INSERT INTO `by_picture` VALUES ('266', '/uploads/Picture/2017-07-17/596bf9c0b2e1a.jpg', '', 'd01b4bff985ab75d2a3d68da2d7995dd', '998f6ef3280d59aae2650dc9524705a93943ce34', '0', '1500248512');
INSERT INTO `by_picture` VALUES ('267', '/uploads/Picture/2017-07-17/596bfa261f0f0.jpg', '', 'd01b4bff985ab75d2a3d68da2d7995dd', '998f6ef3280d59aae2650dc9524705a93943ce34', '0', '1500248614');
INSERT INTO `by_picture` VALUES ('268', '/uploads/Picture/2017-07-17/596bfa348a017.jpg', '', '340744e521e8730fc0a6aae6fc327eb1', '5d64faa53ec5e3234db622462ef63fe32e896fd8', '0', '1500248628');
INSERT INTO `by_picture` VALUES ('269', '/uploads/Picture/2017-07-17/596bfa80460d0.jpg', '', 'd01b4bff985ab75d2a3d68da2d7995dd', '998f6ef3280d59aae2650dc9524705a93943ce34', '0', '1500248704');
INSERT INTO `by_picture` VALUES ('270', '/uploads/Picture/2017-07-17/596bfa872f3a3.jpg', '', 'baf0621c3ca0f9f38c3d0be4a0d777bb', '0e3b419b0ecb01aa2ffe68140bc5ec51c1dfdd9e', '0', '1500248711');
INSERT INTO `by_picture` VALUES ('271', '/uploads/Picture/2017-07-17/596bfad0b56e7.jpg', '', 'd01b4bff985ab75d2a3d68da2d7995dd', '998f6ef3280d59aae2650dc9524705a93943ce34', '0', '1500248784');
INSERT INTO `by_picture` VALUES ('272', '/uploads/Picture/2017-07-17/596bfad870d6d.jpg', '', 'baf0621c3ca0f9f38c3d0be4a0d777bb', '0e3b419b0ecb01aa2ffe68140bc5ec51c1dfdd9e', '0', '1500248792');
INSERT INTO `by_picture` VALUES ('273', '/uploads/Picture/2017-07-17/596bfb2aa3337.jpg', '', 'd01b4bff985ab75d2a3d68da2d7995dd', '998f6ef3280d59aae2650dc9524705a93943ce34', '0', '1500248874');
INSERT INTO `by_picture` VALUES ('274', '/uploads/Picture/2017-07-17/596bfb3aa72a7.jpg', '', 'baf0621c3ca0f9f38c3d0be4a0d777bb', '0e3b419b0ecb01aa2ffe68140bc5ec51c1dfdd9e', '0', '1500248890');
INSERT INTO `by_picture` VALUES ('275', '/uploads/Picture/2017-07-17/596bfbb389c80.jpg', '', 'd01b4bff985ab75d2a3d68da2d7995dd', '998f6ef3280d59aae2650dc9524705a93943ce34', '0', '1500249011');
INSERT INTO `by_picture` VALUES ('276', '/uploads/Picture/2017-07-17/596bfbc173060.jpg', '', 'baf0621c3ca0f9f38c3d0be4a0d777bb', '0e3b419b0ecb01aa2ffe68140bc5ec51c1dfdd9e', '0', '1500249025');
INSERT INTO `by_picture` VALUES ('277', '/uploads/Picture/2017-07-17/596bfc76df6da.jpg', '', 'd01b4bff985ab75d2a3d68da2d7995dd', '998f6ef3280d59aae2650dc9524705a93943ce34', '0', '1500249206');
INSERT INTO `by_picture` VALUES ('278', '/uploads/Picture/2017-07-17/596bfc9bd0754.jpg', '', 'd01b4bff985ab75d2a3d68da2d7995dd', '998f6ef3280d59aae2650dc9524705a93943ce34', '0', '1500249243');
INSERT INTO `by_picture` VALUES ('279', '/uploads/Picture/2017-07-17/596c124247da0.jpg', '', 'b0fc4ff75c69b58226c051955becbaf3', 'e7a809519511ad155dadc39a2f55c3809fbf653d', '0', '1500254786');
INSERT INTO `by_picture` VALUES ('280', '/uploads/Picture/2017-07-17/596c144dddb80.jpg', '', '49e320ca437a8ce468e9356fbad423ad', 'a9fcc4f7d5c04118b63b80b7922c58bc5f5858d3', '0', '1500255309');
INSERT INTO `by_picture` VALUES ('281', '/uploads/Picture/2017-07-20/59701be8dce6a.jpg', '', '1798f15471d03466703fec324f87f116', '27877e68562f833b31d7726e72edfba6d00630ec', '0', '1500519400');
INSERT INTO `by_picture` VALUES ('282', '/uploads/Picture/2017-07-20/59701c1e00257.jpg', '', '82274bb48cca4ea517c2128529d059e0', '67171e3121c082a5f130376d2c5c7e2ea6437341', '0', '1500519454');
INSERT INTO `by_picture` VALUES ('283', '/uploads/Picture/2017-07-20/59701c5c67ba7.jpg', '', '3675e127e7299665347ec872d9b5bf43', '2ec9cceb5a2ba0657735f5b475f303ac2da4121a', '0', '1500519516');
INSERT INTO `by_picture` VALUES ('284', '/uploads/Picture/2017-07-20/59701c84142d3.jpg', '', '1de72b29b8c95553e48a19ff161b2f0a', 'ecda02142390c87cea5dbd41739ae91c8b0b911b', '0', '1500519556');
INSERT INTO `by_picture` VALUES ('285', '/uploads/Picture/2017-07-20/59701cb26c597.jpg', '', '3ef184b25ca4cbee3b29c4efe9ea1eb6', '62e07eda66dbb9ef93cca469205eaa6f1d9ee0db', '0', '1500519602');
INSERT INTO `by_picture` VALUES ('286', '/uploads/Picture/2017-07-20/59701cd80d55a.png', '', 'e48a9c020a3c8a84889fa285283abf97', '2c8e4bc406fce6e182647dc863dbc05934492b6d', '0', '1500519640');
INSERT INTO `by_picture` VALUES ('287', '/uploads/Picture/2017-07-20/59701d046d1e3.jpg', '', '3f27b622448aa6d7178d1b91c6b6b1d7', '44bc847ab3cceae7a16243a9c88684150d73da5a', '0', '1500519684');
INSERT INTO `by_picture` VALUES ('288', '/uploads/Picture/2017-07-20/59701d278bf70.jpg', '', 'bfcb0069223dc28c1befdf4e74adf7b4', '2578f346acdef2eead8d6a7a6bf639de6aa88378', '0', '1500519719');
INSERT INTO `by_picture` VALUES ('289', '/uploads/Picture/2017-07-20/59701d493c2c0.jpg', '', '5a7d912199e1613dee1aff48c6716880', '8736376a42d1f04b6f47c861781a04662d8f5e15', '0', '1500519753');
INSERT INTO `by_picture` VALUES ('290', '/uploads/Picture/2017-07-20/59701d9631730.jpg', '', '313cbb2b87f9b30060831189159e5123', '683d3448d184ac24a2dd77ce369d721a1e4ed6b4', '0', '1500519830');
INSERT INTO `by_picture` VALUES ('291', '/uploads/Picture/2017-07-20/59701e0e8a50d.jpg', '', 'ccbe1f80f2372ae89352018b13a6f362', '73edc138b55135f1bf9e180d02b7808ecc9ba16e', '0', '1500519950');
INSERT INTO `by_picture` VALUES ('292', '/uploads/Picture/2017-07-20/59701e31ea03d.jpg', '', '088b17e859622729ad5854a3de687720', '471168b04e2f5bcc380c41cd724a413627ee5956', '0', '1500519985');
INSERT INTO `by_picture` VALUES ('293', '/uploads/Picture/2017-07-20/59701e6c2bd37.jpg', '', '2207ef91efe0e9a1026812b8eeadae7f', 'ea3fb11f523dbb6b6b740d0aa175e9a97c36e511', '0', '1500520044');
INSERT INTO `by_picture` VALUES ('294', '/uploads/Picture/2017-07-20/59701ece0698a.jpg', '', '5a7d912199e1613dee1aff48c6716880', '8736376a42d1f04b6f47c861781a04662d8f5e15', '0', '1500520142');
INSERT INTO `by_picture` VALUES ('295', '/uploads/Picture/2017-07-20/59701ef990557.jpg', '', '675d2dc2e1b92ec2dce4731e85c1b2f7', '8f3ed163eb23a01ffdf6c2bed9a1ad2d9c8add91', '0', '1500520185');
INSERT INTO `by_picture` VALUES ('296', '/uploads/Picture/2017-07-29/597c290a697e2.png', '', '2aea467e21817cd1ae36264c91d208da', '4c2d945a75fed8e5eb0efaabbbb5f818149e96b7', '0', '1501309194');
INSERT INTO `by_picture` VALUES ('297', '/uploads/Picture/2017-07-29/597c35ef0f86b.jpg', '', 'c1a19f58f9095cd1fdea0d8703e753f9', 'e96568cd980857ef43caac676e57a45c02f5bdc6', '0', '1501312495');
INSERT INTO `by_picture` VALUES ('298', '/uploads/Picture/2017-07-29/597c3605e18c8.jpg', '', '7dc9412fe2751eaebcf9e512ecbb6de7', '75d4b7cdfac54b4f2220a8ed5741b070f5045a87', '0', '1501312517');
INSERT INTO `by_picture` VALUES ('299', '/uploads/Picture/2017-07-30/597dc2695ffae.jpg', '', '91ee16f8c16a6aa5a2aaa0b93ea50a27', '43c0e5b7af9abc43a1b4a9dd57dd20064f4b2e76', '0', '1501413993');
INSERT INTO `by_picture` VALUES ('300', '/uploads/Picture/2017-07-30/597dc349df9e8.jpg', '', '8b85b2f89392ef9590523355495779b9', '6ea936f36c4278db6758419976d3f05048d86421', '0', '1501414217');
INSERT INTO `by_picture` VALUES ('301', '/uploads/Picture/2017-07-30/597dc3b931033.jpg', '', '205a1661a2a18a58f5a76ea3e9fca786', '8bdd87035a052ac4ea0188270614373a2e4331a9', '0', '1501414329');
INSERT INTO `by_picture` VALUES ('302', '/uploads/Picture/2017-07-30/597dc3ffe10a8.jpg', '', '125f65f2e5edfd51a74fada51afac1b8', '2463ab90d3e725d31b26cb67270323de06b3d07e', '0', '1501414399');
INSERT INTO `by_picture` VALUES ('303', '/uploads/Picture/2017-07-30/597dc53cb1ecc.jpg', '', '27ada8a3c1b185c8aaa53376707eeedf', '306f75830746fe01f4d15bfb4a3683c6e0b40a18', '0', '1501414716');
INSERT INTO `by_picture` VALUES ('304', '/uploads/Picture/2017-07-30/597dc62863a85.jpg', '', '2fade1709ba1651853ceabfa1b7f7874', '6611179affb15a194b394621e548d3effb3ae988', '0', '1501414952');
INSERT INTO `by_picture` VALUES ('305', '/uploads/Picture/2017-07-30/597dc793aef99.jpg', '', 'de0160689c9e9eade65d5f0e9715c998', '198919f25b01341bd954e3de807b516b9485f75e', '0', '1501415315');
INSERT INTO `by_picture` VALUES ('306', '/uploads/Picture/2017-07-30/597dc7ab576bf.jpg', '', 'de0160689c9e9eade65d5f0e9715c998', '198919f25b01341bd954e3de807b516b9485f75e', '0', '1501415339');
INSERT INTO `by_picture` VALUES ('307', '/uploads/Picture/2017-07-30/597dcaf7b5c19.jpg', '', '68a36a89a9a32b1867390933b59bfa4b', '33c306f47fcc4fdaf0a46f16bcf481bdfba69bc6', '0', '1501416183');
INSERT INTO `by_picture` VALUES ('308', '/uploads/Picture/2017-08-01/597ff6fc98975.jpg', '', '7da7e15d406e381f56efaa6690b9a99c', '035598fb65fbeeec352a104c847ca89036dd04d0', '0', '1501558524');
INSERT INTO `by_picture` VALUES ('309', '/uploads/Picture/2017-08-01/597ff8b9e2204.jpg', '', '313d23af70cd944aafc107cb620dda2a', 'c5aa3ace27e0f7bc5642d3b9e04761d4760c3284', '0', '1501558969');
INSERT INTO `by_picture` VALUES ('310', '/uploads/Picture/2017-08-01/597ff9fab7dbc.jpg', '', 'e3e6448acde971b512c3e3059bed7e16', '26b7cb1464cc8054a05c100865a330db942f379c', '0', '1501559290');
INSERT INTO `by_picture` VALUES ('311', '/uploads/Picture/2017-08-01/597ffa8fc4eec.jpg', '', '7da7e15d406e381f56efaa6690b9a99c', '035598fb65fbeeec352a104c847ca89036dd04d0', '0', '1501559439');
INSERT INTO `by_picture` VALUES ('312', '/uploads/Picture/2017-08-01/597ffae8be46c.jpg', '', '313d23af70cd944aafc107cb620dda2a', 'c5aa3ace27e0f7bc5642d3b9e04761d4760c3284', '0', '1501559528');
INSERT INTO `by_picture` VALUES ('313', '/uploads/Picture/2017-08-01/5980012520428.jpg', '', '0ca83da577a6a5eac06422e1dc912820', 'b4a79fc3f5aac3e3e97b9e835251c4fb85fc1bf6', '0', '1501561125');
INSERT INTO `by_picture` VALUES ('314', '/uploads/Picture/2017-08-01/5980018caa896.jpg', '', '0ca83da577a6a5eac06422e1dc912820', 'b4a79fc3f5aac3e3e97b9e835251c4fb85fc1bf6', '0', '1501561228');
INSERT INTO `by_picture` VALUES ('315', '/uploads/Picture/2017-08-01/598001d5572e5.jpg', '', '19491b4c329b4787ccf9a2ad026fe8e9', 'b60daa09f8b44bad277fb8960d4835ea09f8c568', '0', '1501561301');
INSERT INTO `by_picture` VALUES ('316', '/uploads/Picture/2017-08-01/598002d0b4b29.jpg', '', '19491b4c329b4787ccf9a2ad026fe8e9', 'b60daa09f8b44bad277fb8960d4835ea09f8c568', '0', '1501561552');
INSERT INTO `by_picture` VALUES ('317', '/uploads/Picture/2017-08-01/598002f43716f.png', '', '2aea467e21817cd1ae36264c91d208da', '4c2d945a75fed8e5eb0efaabbbb5f818149e96b7', '0', '1501561588');
INSERT INTO `by_picture` VALUES ('318', '/uploads/Picture/2017-08-01/5980035a93713.png', '', '3e53e8bddac1aea4b33588c7189bb487', 'e58e1be00657af4ed3144cbc21e9d58a233e44b3', '0', '1501561690');
INSERT INTO `by_picture` VALUES ('319', '/uploads/Picture/2017-08-01/598003904b61f.png', '', '2aea467e21817cd1ae36264c91d208da', '4c2d945a75fed8e5eb0efaabbbb5f818149e96b7', '0', '1501561744');
INSERT INTO `by_picture` VALUES ('320', '/uploads/Picture/2017-08-01/59800431a4619.png', '', '2aea467e21817cd1ae36264c91d208da', '4c2d945a75fed8e5eb0efaabbbb5f818149e96b7', '0', '1501561905');
INSERT INTO `by_picture` VALUES ('321', '/uploads/Picture/2017-08-01/5980046ecb018.png', '', '3e53e8bddac1aea4b33588c7189bb487', 'e58e1be00657af4ed3144cbc21e9d58a233e44b3', '0', '1501561966');
INSERT INTO `by_picture` VALUES ('322', '/uploads/Picture/2017-08-01/59801ee118de9.jpg', '', '81acaf307e199ee96e6d547ca908d59f', 'ef6947e00ca2c4028716fccded7b89b9d2250115', '0', '1501568737');
INSERT INTO `by_picture` VALUES ('323', '/uploads/Picture/2017-08-01/59801f230a54f.jpg', '', 'cdf5e7f71b69c9b4662a642c49275167', '960af648b66075bc265b346d2bec172b615cc8f6', '0', '1501568803');
INSERT INTO `by_picture` VALUES ('324', '/uploads/Picture/2017-08-01/59801f9b7675f.png', '', 'ff2475ae2da69ae2470c5520ea7be49f', '8094a5ae742b636aaf35528820da50aa23f9390e', '0', '1501568923');
INSERT INTO `by_picture` VALUES ('325', '/uploads/Picture/2017-08-01/59801fce91b90.jpg', '', '81acaf307e199ee96e6d547ca908d59f', 'ef6947e00ca2c4028716fccded7b89b9d2250115', '0', '1501568974');
INSERT INTO `by_picture` VALUES ('326', '/uploads/Picture/2017-08-01/5980246407536.jpg', '', '93a179a97ad48812e18219adf6ff628f', '07f89de4eba4e39daf02ec30f0e01ffbc910b13d', '0', '1501570148');
INSERT INTO `by_picture` VALUES ('327', '/uploads/Picture/2017-08-01/5980246b2d875.jpg', '', '6956f963d5c3d4c528955e6614978af8', '40dbfa8a8ad084796f4719debfbd8956577eae17', '0', '1501570155');
INSERT INTO `by_picture` VALUES ('328', '/uploads/Picture/2017-08-01/5980247316b3c.jpg', '', '63b5a066804bd377173b5f9d28e6c492', '5a7262e2276dccab5951b60f6cfdb52b3a0f1702', '0', '1501570163');
INSERT INTO `by_picture` VALUES ('329', '/uploads/Picture/2017-08-01/5980247d9c4c8.jpg', '', '7868538fb4f686222ffcedff5647070b', '4be9942d0231baeda7076ca6fe3c3a581b2c6a3f', '0', '1501570173');
INSERT INTO `by_picture` VALUES ('330', '/uploads/Picture/2017-08-01/598030ffad09b.png', '', '88cb170f2631b6dd8dd540aa201a8498', '623ccd3849ea7ee2bd94eab391817ce81ef12146', '0', '1501573375');

-- ----------------------------
-- Table structure for `by_slide`
-- ----------------------------
DROP TABLE IF EXISTS `by_slide`;
CREATE TABLE `by_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `title` varchar(225) DEFAULT '' COMMENT '标题',
  `url` varchar(225) DEFAULT '' COMMENT '链接',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `place` tinyint(30) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `time` int(10) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL,
  `extra` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='幻灯片图片储存表';

-- ----------------------------
-- Records of by_slide
-- ----------------------------
INSERT INTO `by_slide` VALUES ('18', '幻灯片3', 'article/detail?id=94', '0', '0', '1495672417', '1495067617', '1', '177', '0', '0', '200');
INSERT INTO `by_slide` VALUES ('17', '幻灯片2', 'article/detail?id=92', '0', '0', '1494958026', '1495735626', '1', '176', '0', '0', '203');
INSERT INTO `by_slide` VALUES ('16', '亚冠-埃神破门', 'article/detail?id=117', '0', '0', '1495845170', '1494894817', '1', '220', '1494894817', '0', '117');
INSERT INTO `by_slide` VALUES ('20', 'app', 'article/detail?id=115', '0', '0', '0', '0', '1', '296', '0', '1', '0');

-- ----------------------------
-- Table structure for `by_sync_login`
-- ----------------------------
DROP TABLE IF EXISTS `by_sync_login`;
CREATE TABLE `by_sync_login` (
  `uid` int(11) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方登陆表';

-- ----------------------------
-- Records of by_sync_login
-- ----------------------------

-- ----------------------------
-- Table structure for `by_ucenter_member`
-- ----------------------------
DROP TABLE IF EXISTS `by_ucenter_member`;
CREATE TABLE `by_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) DEFAULT NULL COMMENT '用户邮箱',
  `mobile` int(11) NOT NULL DEFAULT '0' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of by_ucenter_member
-- ----------------------------

-- ----------------------------
-- Table structure for `by_user_log`
-- ----------------------------
DROP TABLE IF EXISTS `by_user_log`;
CREATE TABLE `by_user_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `title` text NOT NULL COMMENT '名称',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,2为已使用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of by_user_log
-- ----------------------------

-- ----------------------------
-- Table structure for `by_video`
-- ----------------------------
DROP TABLE IF EXISTS `by_video`;
CREATE TABLE `by_video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `covers` varchar(225) DEFAULT NULL,
  `url` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=215 DEFAULT CHARSET=utf8 COMMENT='文档模型相册表';

-- ----------------------------
-- Records of by_video
-- ----------------------------
INSERT INTO `by_video` VALUES ('208', null, 'http://hc.yinyuetai.com/uploads/videos/common/99BE0146E0A889D5602AB47BEF41909E.flv?sc\\u003d263ebf9ffeeed307\\u0026br\\u003d1064\\u0026vid\\u003d2082681\\u0026aid\\u003d11962\\u0026area\\u003dML\\u0026vst\\u003d3');
INSERT INTO `by_video` VALUES ('207', null, 'http://he.yinyuetai.com/uploads/videos/common/042501536B5E5281CC4AF1840E689F99.flv?sc\\u003dba026a6faba5b46b\\u0026br\\u003d3104\\u0026vid\\u003d2061637\\u0026aid\\u003d11962\\u0026area\\u003dML\\u0026vst\\u003d0');
INSERT INTO `by_video` VALUES ('209', null, 'http://219.239.26.6/hd.yinyuetai.com/uploads/videos/common/69DC0138CCE3897A94D336D93BFA6F7A.flv?sc\\u003d08a34d49ee162933\\u0026br\\u003d1063\\u0026vid\\u003d468871\\u0026aid\\u003d708\\u0026area\\u003dOther\\u0026vst\\u003d0');
INSERT INTO `by_video` VALUES ('210', null, 'http://124.193.120.172/he.yinyuetai.com/uploads/videos/common/EEAA015D121A31551A69966E3AAD3A60.mp4?sc\\u003d459f15fbeba6dddc\\u0026br\\u003d3134\\u0026vid\\u003d2903766\\u0026aid\\u003d13972\\u0026area\\u003dML\\u0026vst\\u003d0');
INSERT INTO `by_video` VALUES ('211', null, 'http://124.193.120.172/he.yinyuetai.com/uploads/videos/common/C9A1015C8B40EE0CB2BADC29D7D2BC92.mp4');
INSERT INTO `by_video` VALUES ('212', null, 'http://124.193.120.172/hc.yinyuetai.com/uploads/videos/common/08AE01335097A02E676C77F90C71B6F5.flv?sc\\u003d4aae5d3693d83149\\u0026br\\u003d716\\u0026vid\\u003d13361\\u0026aid\\u003d201\\u0026area\\u003dHT\\u0026vst\\u003d0');
INSERT INTO `by_video` VALUES ('213', null, 'http://124.193.120.174/hd.yinyuetai.com/uploads/videos/common/868C01528379A783B5CBC7C091426EC5.flv?sc\\u003dae94b0746b28b586\\u0026br\\u003d1100\\u0026vid\\u003d2485735\\u0026aid\\u003d3175\\u0026area\\u003dHT\\u0026vst\\u003d2');
INSERT INTO `by_video` VALUES ('214', null, 'http://124.193.120.172/he.yinyuetai.com/uploads/videos/common/37A4015C2ADD970C86F89EEF84918281.mp4?sc\\u003df2b68801d9b5383e\\u0026br\\u003d3131\\u0026vid\\u003d2867531\\u0026aid\\u003d89\\u0026area\\u003dML\\u0026vst\\u003d3');
