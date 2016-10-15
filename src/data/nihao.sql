/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Version : 50629
 Source Host           : localhost
 Source Database       : nihao

 Target Server Version : 50629
 File Encoding         : utf-8

 Date: 10/15/2016 16:56:46 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `tb_product`
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(80) NOT NULL COMMENT '品名',
  `image_url` varchar(80) NOT NULL COMMENT '图片存放路径',
  `price` decimal(20,6) NOT NULL COMMENT '价格',
  `model` varchar(80) NOT NULL COMMENT '型号',
  `remark` varchar(300) NOT NULL COMMENT '备注',
  `status` int(1) NOT NULL COMMENT '状态0新建1审核通过2满待抽3抽奖4发放',
  `hits` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tb_setting`
-- ----------------------------
DROP TABLE IF EXISTS `tb_setting`;
CREATE TABLE `tb_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(30) NOT NULL COMMENT '配置项',
  `value` text NOT NULL COMMENT '配置值',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `updated_by` int(11) NOT NULL COMMENT '更新人',
  `created_at` int(11) NOT NULL COMMENT '创建用户时间',
  `updated_at` int(11) NOT NULL COMMENT '更新用户时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='设置表';

-- ----------------------------
--  Records of `tb_setting`
-- ----------------------------
BEGIN;
INSERT INTO `tb_setting` VALUES ('1', 'con_app_version', '1.0.0', '0', '0', '0', '0'), ('2', 'con_app_downloadUrl', 'www.baidu.com', '0', '0', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(4) DEFAULT '10' COMMENT '用户角色',
  `user_type` int(4) DEFAULT NULL COMMENT '用户类型1:普通,2企业',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password_hash` varchar(100) NOT NULL COMMENT '登录密码',
  `password_pay_hash` varchar(100) DEFAULT NULL COMMENT '交易密码',
  `password_reset_token` varchar(100) DEFAULT NULL COMMENT '重置密码token',
  `auth_key` varchar(100) DEFAULT NULL COMMENT '记住我',
  `status` int(4) DEFAULT NULL COMMENT '用户状态',
  `mobile` varchar(30) DEFAULT NULL COMMENT '手机号',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `realname` varchar(30) DEFAULT '' COMMENT '真实姓名',
  `id_card` varchar(30) DEFAULT NULL COMMENT '身份证',
  `sex` int(4) DEFAULT '0' COMMENT '性别',
  `litpic` varchar(250) DEFAULT NULL COMMENT '用户头像',
  `birthday` varchar(10) DEFAULT NULL COMMENT '生日',
  `email_binding_status` tinyint(4) DEFAULT '0' COMMENT '邮箱认证状态',
  `mobile_binding_status` int(4) DEFAULT '0' COMMENT '手机认证状态',
  `real_verify_status` int(4) DEFAULT '0' COMMENT '实名认证状态',
  `card_binding_status` int(4) DEFAULT '0' COMMENT '银行卡绑定状态',
  `card_id_base` int(11) DEFAULT '0' COMMENT '银行卡ID基数',
  `created_at` int(11) DEFAULT NULL COMMENT '注册时间',
  `last_logintime` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  `created_ip` varchar(30) DEFAULT NULL COMMENT '注册ip',
  `invite_userid` int(11) DEFAULT NULL COMMENT '推荐人用戶id',
  `real_verify_time` int(11) DEFAULT NULL COMMENT '实名认证时间',
  `trust_trxId` varchar(30) DEFAULT NULL COMMENT '本平台 交易唯一标 识',
  `trust_usr_custId` varchar(30) DEFAULT NULL COMMENT '用户客户号',
  `audit_stat` varchar(2) DEFAULT NULL COMMENT '企业开户状态',
  `audit_desc` varchar(30) DEFAULT NULL COMMENT '企业开户审核信息',
  `accessToken` varchar(50) DEFAULT NULL COMMENT 'APP长登录accesstoken',
  `loginTimes` int(11) DEFAULT '0' COMMENT '用户连续登录次数',
  `frist_recharge_time` int(11) DEFAULT NULL COMMENT '首次充值时间',
  PRIMARY KEY (`id`),
  KEY `username_indx` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

SET FOREIGN_KEY_CHECKS = 1;
