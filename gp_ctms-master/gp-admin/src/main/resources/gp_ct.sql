/*
 Navicat Premium Data Transfer

 Source Server         : mysql-ppe
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : mysql-ppe:3306
 Source Schema         : gp_ct

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 22/04/2022 16:01:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for rest_dinner_table
-- ----------------------------
DROP TABLE IF EXISTS `rest_dinner_table`;
CREATE TABLE `rest_dinner_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT 0,
  `seat` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rest_dinner_table
-- ----------------------------
INSERT INTO `rest_dinner_table` VALUES (1, '01', 0, 5);
INSERT INTO `rest_dinner_table` VALUES (2, '02', 0, 5);
INSERT INTO `rest_dinner_table` VALUES (3, '03', 0, 5);
INSERT INTO `rest_dinner_table` VALUES (4, '04', 0, 5);
INSERT INTO `rest_dinner_table` VALUES (5, '05', 0, 5);
INSERT INTO `rest_dinner_table` VALUES (6, '06', 0, 8);
INSERT INTO `rest_dinner_table` VALUES (7, '07', 0, 8);
INSERT INTO `rest_dinner_table` VALUES (8, '08', 0, 8);
INSERT INTO `rest_dinner_table` VALUES (9, '09', 0, 10);
INSERT INTO `rest_dinner_table` VALUES (10, '10', 0, 10);
INSERT INTO `rest_dinner_table` VALUES (11, '11', 0, 10);
INSERT INTO `rest_dinner_table` VALUES (12, '12', 0, 14);

-- ----------------------------
-- Table structure for rest_food
-- ----------------------------
DROP TABLE IF EXISTS `rest_food`;
CREATE TABLE `rest_food`  (
  `food_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` float(255, 2) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`food_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rest_food
-- ----------------------------
INSERT INTO `rest_food` VALUES (4, '酸菜烧仔鸡', NULL, NULL, 32.00, 0);
INSERT INTO `rest_food` VALUES (5, '红烧猪头肉', NULL, NULL, 38.00, 0);
INSERT INTO `rest_food` VALUES (6, '红烧牛肉', NULL, NULL, 48.00, 0);
INSERT INTO `rest_food` VALUES (7, '地锅鸡', '23', NULL, 48.00, 0);
INSERT INTO `rest_food` VALUES (8, '雪菜烧大肠', NULL, NULL, 45.00, 0);
INSERT INTO `rest_food` VALUES (9, '土豆烧牛肉', NULL, NULL, 38.00, 0);
INSERT INTO `rest_food` VALUES (10, '红烧排骨', NULL, NULL, 48.00, 0);
INSERT INTO `rest_food` VALUES (11, '咸鸭鱼头豆腐锅', NULL, NULL, 80.00, 0);
INSERT INTO `rest_food` VALUES (13, '红烧鱼', '123', '/profile/upload/2022/04/21/b7e882f5f06ae4eb48378533bbdb1e94.jpg', 34.00, 0);

-- ----------------------------
-- Table structure for rest_food_bind
-- ----------------------------
DROP TABLE IF EXISTS `rest_food_bind`;
CREATE TABLE `rest_food_bind`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `food_id` bigint(20) NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT 1,
  `price` float(10, 2) NULL DEFAULT NULL,
  `type` tinyint(4) NULL DEFAULT NULL,
  `main_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rest_food_bind
-- ----------------------------
INSERT INTO `rest_food_bind` VALUES (3, 7, 1, 48.00, 1, 2);
INSERT INTO `rest_food_bind` VALUES (4, 6, 1, 48.00, 1, 2);
INSERT INTO `rest_food_bind` VALUES (5, 7, 1, 48.00, 2, 6);
INSERT INTO `rest_food_bind` VALUES (6, 6, 1, 48.00, 2, 6);
INSERT INTO `rest_food_bind` VALUES (7, 7, 1, 48.00, 2, 7);
INSERT INTO `rest_food_bind` VALUES (8, 6, 1, 48.00, 2, 7);
INSERT INTO `rest_food_bind` VALUES (9, 10, 1, 48.00, 2, 7);
INSERT INTO `rest_food_bind` VALUES (10, 5, 1, 38.00, 2, 7);
INSERT INTO `rest_food_bind` VALUES (11, 7, 1, 48.00, 1, 3);
INSERT INTO `rest_food_bind` VALUES (12, 6, 1, 48.00, 1, 3);
INSERT INTO `rest_food_bind` VALUES (13, 10, 1, 48.00, 1, 3);
INSERT INTO `rest_food_bind` VALUES (14, 7, 1, 48.00, 2, 10);
INSERT INTO `rest_food_bind` VALUES (15, 6, 1, 48.00, 2, 10);
INSERT INTO `rest_food_bind` VALUES (16, 10, 1, 48.00, 2, 10);
INSERT INTO `rest_food_bind` VALUES (17, 5, 1, 38.00, 2, 10);
INSERT INTO `rest_food_bind` VALUES (18, 7, 1, 48.00, 2, 11);
INSERT INTO `rest_food_bind` VALUES (19, 6, 1, 48.00, 2, 11);
INSERT INTO `rest_food_bind` VALUES (20, 10, 1, 48.00, 2, 11);
INSERT INTO `rest_food_bind` VALUES (21, 5, 1, 38.00, 2, 11);
INSERT INTO `rest_food_bind` VALUES (22, 4, 1, 32.00, 2, 11);

-- ----------------------------
-- Table structure for rest_order
-- ----------------------------
DROP TABLE IF EXISTS `rest_order`;
CREATE TABLE `rest_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `end_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `table_id` bigint(20) NULL DEFAULT NULL,
  `rockover` int(11) NULL DEFAULT NULL,
  `date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `money` float(255, 2) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL COMMENT '1进行中 2已付款 3取消',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '1现场 2从预订转入',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rest_order
-- ----------------------------
INSERT INTO `rest_order` VALUES (6, '2022-04-21 22:44:44', '2022-04-21 22:46:35', '1650552284903', 3, 1, '2022-04-21', 96.00, 2, 2);
INSERT INTO `rest_order` VALUES (7, '2022-04-21 22:47:48', '2022-04-21 22:51:30', '1650552468960', 1, 1, '2022-04-21', 182.00, 2, 1);
INSERT INTO `rest_order` VALUES (8, '2022-04-21 22:49:12', NULL, '1650552552160', 2, 1, '2022-04-21', 0.00, 2, 1);
INSERT INTO `rest_order` VALUES (9, '2022-04-21 22:50:51', NULL, '1650552651539', 9, 1, '2022-04-21', 0.00, 2, 1);
INSERT INTO `rest_order` VALUES (10, '2022-04-21 23:02:56', '2022-04-21 23:03:47', '1650553376987', 6, 1, '2022-04-21', 182.00, 2, 2);
INSERT INTO `rest_order` VALUES (11, '2022-04-21 23:04:19', '2022-04-21 23:05:18', '1650553459987', 6, 2, '2022-04-21', 214.00, 2, 1);
INSERT INTO `rest_order` VALUES (12, '2022-04-21 23:07:02', NULL, '1650553622882', 5, 1, '2022-04-21', 0.00, 2, 1);

-- ----------------------------
-- Table structure for rest_reserve
-- ----------------------------
DROP TABLE IF EXISTS `rest_reserve`;
CREATE TABLE `rest_reserve`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT 0,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total` float(255, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rest_reserve
-- ----------------------------
INSERT INTO `rest_reserve` VALUES (2, 'zhangsan3', '1312321321', '3', '2022-04-23', 1, 'sdfsdf', 96.00);
INSERT INTO `rest_reserve` VALUES (3, '刘伟', '13208789789', '5', '2022-04-21', 1, '备注', 144.00);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `delete_flag` tinyint(4) NULL DEFAULT 0,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  `delete_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-green', 'Y', 'admin', '2018-03-16 11:33:00', 'admin', '2020-02-13 21:26:30', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow', 0, NULL, NULL);
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'demo', '2018-03-16 11:33:00', '初始化密码 123456', 0, NULL, NULL);
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2018-03-16 11:33:00', 'admin', '2020-06-20 09:59:50', '深色主题theme-dark，浅色主题theme-light', 0, NULL, NULL);
INSERT INTO `sys_config` VALUES (101, '系统名称', 'sys.name', '中小型餐厅管理系统', 'Y', 'admin', '2019-08-07 00:04:04', 'admin', '2022-04-22 15:27:55', '由“项目配置”页面更改操作', 0, NULL, NULL);
INSERT INTO `sys_config` VALUES (102, '系统版权', 'sys.copyright', '中小型餐厅管理系统', 'Y', 'admin', '2019-08-07 00:26:47', 'admin', '2022-04-22 15:28:14', '由“项目配置”页面更改操作', 0, NULL, NULL);
INSERT INTO `sys_config` VALUES (103, 'LOGO图片', 'sys.logo', '/profile/logo/2022/04/21/e5bf87d6452aa2268743048d1dcedcbf.png', 'Y', 'admin', '2019-08-08 00:03:03', 'admin', '2022-04-21 22:01:24', '由“项目配置”页面更改操作', 0, NULL, NULL);
INSERT INTO `sys_config` VALUES (111, '学校部门根部门ID', 'schoole_dept_root_id', '101', 'Y', 'admin', '2019-12-04 10:00:08', '', NULL, NULL, 1, '2021-04-12 21:41:43', 'admin');
INSERT INTO `sys_config` VALUES (117, '学校名称', 'sys.school.name', '合肥市经贸旅游学校', 'Y', '', NULL, '', NULL, NULL, 1, '2021-04-12 21:41:43', 'admin');
INSERT INTO `sys_config` VALUES (118, '建设单位根目录ID', 'js_root_dept_id', '102', 'Y', 'admin', '2021-04-12 21:42:43', '', NULL, NULL, 1, '2021-10-27 22:24:17', 'admin');
INSERT INTO `sys_config` VALUES (119, '承建单位根目录ID', 'cj_root_dept_id', '101', 'Y', 'admin', '2021-04-12 21:43:14', '', NULL, NULL, 1, '2021-10-27 22:24:17', 'admin');
INSERT INTO `sys_config` VALUES (120, '监理单位根目录ID', 'jl_root_dept_id', '202', 'Y', 'admin', '2021-04-12 21:43:44', '', NULL, NULL, 1, '2021-10-27 22:24:17', 'admin');
INSERT INTO `sys_config` VALUES (121, '生日提醒提前天数', 'birth_remind_day', '7', 'Y', 'admin', '2021-10-31 12:08:44', 'admin', '2021-10-31 12:08:55', '提前多少天生日提醒', 1, '2022-04-22 15:15:02', 'admin');
INSERT INTO `sys_config` VALUES (122, '会员余额提醒', 'money_remind', '300', 'Y', 'admin', '2021-10-31 12:10:10', '', NULL, '会员卡余额少于多少进行提醒', 1, '2022-04-22 15:15:05', 'admin');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `short_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简称',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `delete_flag` tinyint(4) NULL DEFAULT 0 COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` datetime(0) NULL DEFAULT NULL,
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 221 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '餐饮有限公司', 0, '', '', '', NULL, '0', 0, 'admin', '2018-03-16 11:33:00', 'admin', '2021-10-24 11:53:23', NULL, NULL);
INSERT INTO `sys_dept` VALUES (218, 100, '0,100', '财务部', 10, NULL, NULL, NULL, '财务部', '0', 0, 'admin', '2022-04-21 22:19:40', '', NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (219, 100, '0,100', '后厨', 9, NULL, NULL, NULL, '后厨', '0', 0, 'admin', '2022-04-21 22:19:56', '', NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (220, 100, '0,100', '大厅', 8, NULL, NULL, NULL, '大厅', '0', 0, 'admin', '2022-04-21 22:20:07', '', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `delete_flag` tinyint(4) NULL DEFAULT 0,
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '性别男', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '性别女', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '性别未知', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '显示菜单', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '隐藏菜单', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '2', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-08-07 22:38:22', '停用状态', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (9, 3, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-08-07 22:44:00', '停用状态', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '默认分组', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统分组', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统默认是', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统默认否', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '通知', 1, 'admin', '2021-04-12 21:45:32');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '公告', 1, 'admin', '2021-04-12 21:45:32');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态', 1, 'admin', '2021-04-12 21:45:38');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '关闭状态', 1, 'admin', '2021-04-12 21:45:38');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '新增操作', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '修改操作', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '删除操作', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '授权操作', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '导出操作', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '导入操作', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '强退操作', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '生成操作', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '清空操作', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '停用状态', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 2, '是', '1', 'article_need_audit_status', '', 'default', 'N', '0', 'admin', '2019-08-15 22:53:39', 'admin', '2019-08-15 22:54:12', '需要审核', 1, 'admin', '2021-04-12 21:45:11');
INSERT INTO `sys_dict_data` VALUES (104, 3, '否', '0', 'article_need_audit_status', '', 'default', 'Y', '0', 'admin', '2019-08-15 22:53:55', 'admin', '2019-08-15 22:54:06', '不需要审核', 1, 'admin', '2021-04-12 21:45:11');
INSERT INTO `sys_dict_data` VALUES (105, 2, '否', '0', 'article_istop', NULL, NULL, 'Y', '0', 'admin', '2019-08-17 15:57:50', 'admin', NULL, '不置顶', 1, 'admin', '2021-04-12 21:44:54');
INSERT INTO `sys_dict_data` VALUES (106, 0, '是', '1', 'article_istop', NULL, NULL, 'N', '0', 'admin', '2019-08-17 15:58:07', 'admin', NULL, '置顶', 1, 'admin', '2021-04-12 21:44:54');
INSERT INTO `sys_dict_data` VALUES (107, 10, '正常', '0', 'useable_status', NULL, NULL, 'Y', '0', 'demo', '2019-08-22 10:31:15', 'admin', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 9, '停用', '1', 'useable_status', '', '', 'N', '0', 'demo', '2019-08-22 10:31:47', 'admin', '2020-03-20 10:59:48', 'test', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 8, '毕业', '3', 'useable_status', '', '', 'N', '0', 'demo', '2019-08-22 10:32:12', 'admin', '2020-03-20 11:06:19', 'ts', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 3, '考勤', 'ATTENDANCE', 'sys_job_group', NULL, NULL, 'Y', '0', 'demo', '2019-11-13 10:45:38', '', NULL, '考勤分组', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 4, '接口', 'API', 'sys_job_group', NULL, NULL, 'Y', '0', 'demo', '2019-11-13 11:07:11', '', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 5, '清理数据', 'CLEAN', 'sys_job_group', NULL, NULL, 'Y', '0', 'demo', '2019-11-16 17:01:01', '', NULL, '定时清理一些缓存数据或者数据库', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 4, '使用中', '0', 'use_status', NULL, NULL, 'Y', '0', 'demo', '2019-11-18 18:03:02', '', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 3, '未使用', '1', 'use_status', NULL, 'default', 'Y', '0', 'demo', '2019-11-18 18:03:38', '', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 6, '评价', 'EVALUATE', 'sys_job_group', NULL, NULL, 'Y', '0', 'admin', '2019-11-19 11:23:34', '', NULL, '评价模块', 0, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 3, '需要', '1', 'article_need_read', NULL, NULL, 'Y', '0', 'admin', '2020-11-30 16:19:15', '', NULL, NULL, 1, 'admin', '2021-04-12 21:45:19');
INSERT INTO `sys_dict_data` VALUES (118, 2, '不需要', '2', 'article_need_read', '', '', 'N', '0', 'admin', '2020-11-30 16:19:26', 'admin', '2020-11-30 16:23:54', '', 1, 'admin', '2021-04-12 21:45:19');
INSERT INTO `sys_dict_data` VALUES (119, 100, '非密', '非密', 'security_classification', NULL, 'default', 'Y', '0', 'admin', '2021-04-13 22:22:30', '', NULL, NULL, 1, 'admin', '2022-04-14 15:23:51');
INSERT INTO `sys_dict_data` VALUES (120, 90, '加密', '加密', 'security_classification', NULL, 'default', 'Y', '0', 'admin', '2021-04-13 22:22:43', '', NULL, NULL, 1, 'admin', '2022-04-14 15:23:51');
INSERT INTO `sys_dict_data` VALUES (121, 80, '绝密', '绝密', 'security_classification', NULL, 'default', 'Y', '0', 'admin', '2021-04-13 22:23:00', '', NULL, NULL, 1, 'admin', '2022-04-14 15:23:51');
INSERT INTO `sys_dict_data` VALUES (122, 100, '采购入库', '采购入库', 'iotype', NULL, NULL, 'Y', '0', 'admin', '2021-10-27 22:12:21', '', NULL, NULL, 1, 'admin', '2022-04-14 15:23:31');
INSERT INTO `sys_dict_data` VALUES (123, 90, '报废销毁', '报废销毁', 'iotype', NULL, NULL, 'Y', '0', 'admin', '2021-10-27 22:12:40', '', NULL, NULL, 1, 'admin', '2022-04-14 15:23:31');
INSERT INTO `sys_dict_data` VALUES (124, 90, '心脏病', '心脏病', 'diseaseList', NULL, NULL, 'Y', '0', 'admin', '2021-10-27 22:20:57', '', NULL, NULL, 1, 'admin', '2022-04-14 15:23:41');
INSERT INTO `sys_dict_data` VALUES (125, 80, '高血压', '高血压', 'diseaseList', NULL, NULL, 'Y', '0', 'admin', '2021-10-27 22:21:06', '', NULL, NULL, 1, 'admin', '2022-04-14 15:23:41');
INSERT INTO `sys_dict_data` VALUES (126, 80, '呼吸系统', '呼吸系统', 'diseaseList', NULL, NULL, 'Y', '0', 'admin', '2021-10-27 22:21:27', '', NULL, NULL, 1, 'admin', '2022-04-14 15:23:41');
INSERT INTO `sys_dict_data` VALUES (127, 70, '肝肾系统', '肝肾系统', 'diseaseList', NULL, NULL, 'Y', '0', 'admin', '2021-10-27 22:21:38', '', NULL, NULL, 1, 'admin', '2022-04-14 15:23:41');
INSERT INTO `sys_dict_data` VALUES (128, 60, '脚踝', '脚踝', 'diseaseList', NULL, NULL, 'Y', '0', 'admin', '2021-10-27 22:21:49', '', NULL, NULL, 1, 'admin', '2022-04-14 15:23:41');
INSERT INTO `sys_dict_data` VALUES (129, 60, '膝盖', '膝盖', 'diseaseList', NULL, NULL, 'Y', '0', 'admin', '2021-10-27 22:22:00', '', NULL, NULL, 1, 'admin', '2022-04-14 15:23:41');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `dict_sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delete_flag` tinyint(4) NULL DEFAULT 0,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 100, 'admin', '2018-03-16 11:33:00', 'demo', '2018-03-16 11:33:00', '用户性别列表', NULL, 0, NULL);
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 90, 'admin', '2018-03-16 11:33:00', 'demo', '2018-03-16 11:33:00', '菜单状态列表', NULL, 0, NULL);
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 80, 'admin', '2018-03-16 11:33:00', 'demo', '2018-03-16 11:33:00', '系统开关列表', NULL, 0, NULL);
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 70, 'admin', '2018-03-16 11:33:00', 'demo', '2018-03-16 11:33:00', '任务状态列表', NULL, 0, NULL);
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 60, 'admin', '2018-03-16 11:33:00', 'demo', '2018-03-16 11:33:00', '任务分组列表', NULL, 0, NULL);
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 50, 'admin', '2018-03-16 11:33:00', 'demo', '2018-03-16 11:33:00', '系统是否列表', NULL, 0, NULL);
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 40, 'admin', '2018-03-16 11:33:00', 'demo', '2018-03-16 11:33:00', '通知类型列表', 'admin', 1, '2021-04-12 21:45:56');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 30, 'admin', '2018-03-16 11:33:00', 'demo', '2018-03-16 11:33:00', '通知状态列表', 'admin', 1, '2021-04-12 21:45:56');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 20, 'admin', '2018-03-16 11:33:00', 'demo', '2018-03-16 11:33:00', '操作类型列表', NULL, 0, NULL);
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 10, 'admin', '2018-03-16 11:33:00', 'demo', '2018-03-16 11:33:00', '登录状态列表', NULL, 0, NULL);
INSERT INTO `sys_dict_type` VALUES (100, '文章审核状态', 'article_need_audit_status', '0', 110, 'admin', '2019-08-15 22:52:49', 'demo', '2019-08-22 10:29:34', '文章审核状态列表', 'admin', 1, '2021-04-12 21:45:24');
INSERT INTO `sys_dict_type` VALUES (101, '文章置顶', 'article_istop', '0', 120, 'admin', '2019-08-17 15:57:02', 'admin', '2020-03-17 10:06:22', '文章是否置顶', 'admin', 1, '2021-04-12 21:45:06');
INSERT INTO `sys_dict_type` VALUES (102, '可用状态', 'useable_status', '0', 130, 'demo', '2019-08-22 10:30:41', 'demo', '2019-08-22 10:44:51', '年级班级学生等毕业状态列表', NULL, 0, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '使用状态', 'use_status', '0', 103, 'demo', '2019-11-18 18:00:04', 'demo', '2019-11-18 18:04:06', '是否使用标签', NULL, 0, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '文章反馈', 'article_need_read', '0', 109, 'admin', '2020-11-30 16:17:44', 'admin', '2020-11-30 16:18:27', '', 'admin', 1, '2021-04-12 21:45:24');
INSERT INTO `sys_dict_type` VALUES (106, '文档密级', 'security_classification', '0', 140, 'admin', '2021-04-13 22:21:42', '', NULL, NULL, 'admin', 1, '2022-04-14 15:23:55');
INSERT INTO `sys_dict_type` VALUES (107, '器械进出类型', 'iotype', '0', 1000, 'admin', '2021-10-27 22:12:03', '', NULL, NULL, 'admin', 1, '2022-04-14 15:23:34');
INSERT INTO `sys_dict_type` VALUES (108, '运动疾病', 'diseaseList', '0', 900, 'admin', '2021-10-27 22:20:43', '', NULL, NULL, 'admin', 1, '2022-04-14 15:23:46');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1997 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1918, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-14 16:45:27');
INSERT INTO `sys_logininfor` VALUES (1917, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-04-14 16:45:25');
INSERT INTO `sys_logininfor` VALUES (1916, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-14 15:23:04');
INSERT INTO `sys_logininfor` VALUES (1915, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-04-14 15:23:00');
INSERT INTO `sys_logininfor` VALUES (1919, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-14 22:01:12');
INSERT INTO `sys_logininfor` VALUES (1920, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '密码输入错误1次', '2022-04-14 22:08:22');
INSERT INTO `sys_logininfor` VALUES (1921, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-14 22:08:29');
INSERT INTO `sys_logininfor` VALUES (1922, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-14 22:14:07');
INSERT INTO `sys_logininfor` VALUES (1923, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-14 23:27:40');
INSERT INTO `sys_logininfor` VALUES (1924, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 22:34:39');
INSERT INTO `sys_logininfor` VALUES (1925, 'dachu', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-04-21 22:34:48');
INSERT INTO `sys_logininfor` VALUES (1926, 'chushi', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-04-21 22:34:55');
INSERT INTO `sys_logininfor` VALUES (1927, 'chushi', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-04-21 22:34:58');
INSERT INTO `sys_logininfor` VALUES (1928, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '密码输入错误1次', '2022-04-21 22:35:03');
INSERT INTO `sys_logininfor` VALUES (1929, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:35:07');
INSERT INTO `sys_logininfor` VALUES (1930, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 22:35:16');
INSERT INTO `sys_logininfor` VALUES (1931, 'houchu', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:35:22');
INSERT INTO `sys_logininfor` VALUES (1932, 'houchu', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 22:37:57');
INSERT INTO `sys_logininfor` VALUES (1933, 'houchu', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:38:03');
INSERT INTO `sys_logininfor` VALUES (1934, 'houchu', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:38:31');
INSERT INTO `sys_logininfor` VALUES (1935, 'houchu', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 22:39:07');
INSERT INTO `sys_logininfor` VALUES (1936, 'yuding', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:39:29');
INSERT INTO `sys_logininfor` VALUES (1937, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '密码输入错误1次', '2022-04-21 22:43:39');
INSERT INTO `sys_logininfor` VALUES (1938, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:43:42');
INSERT INTO `sys_logininfor` VALUES (1939, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 22:43:47');
INSERT INTO `sys_logininfor` VALUES (1940, 'dating', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:43:54');
INSERT INTO `sys_logininfor` VALUES (1941, 'dating', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 22:43:58');
INSERT INTO `sys_logininfor` VALUES (1942, 'yuding', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:44:03');
INSERT INTO `sys_logininfor` VALUES (1943, 'yuding', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 22:45:04');
INSERT INTO `sys_logininfor` VALUES (1944, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:45:10');
INSERT INTO `sys_logininfor` VALUES (1945, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 22:46:05');
INSERT INTO `sys_logininfor` VALUES (1946, 'yuding', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:46:13');
INSERT INTO `sys_logininfor` VALUES (1947, 'yuding', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 22:47:27');
INSERT INTO `sys_logininfor` VALUES (1948, 'dating', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:47:32');
INSERT INTO `sys_logininfor` VALUES (1949, 'dating', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:48:58');
INSERT INTO `sys_logininfor` VALUES (1950, 'dating', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:50:46');
INSERT INTO `sys_logininfor` VALUES (1951, 'dating', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 22:51:45');
INSERT INTO `sys_logininfor` VALUES (1952, 'caiwu', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:51:54');
INSERT INTO `sys_logininfor` VALUES (1953, 'caiwu', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 22:52:01');
INSERT INTO `sys_logininfor` VALUES (1954, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '密码输入错误1次', '2022-04-21 22:52:07');
INSERT INTO `sys_logininfor` VALUES (1955, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:55:00');
INSERT INTO `sys_logininfor` VALUES (1956, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 22:55:45');
INSERT INTO `sys_logininfor` VALUES (1957, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 22:56:05');
INSERT INTO `sys_logininfor` VALUES (1958, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 23:06:03');
INSERT INTO `sys_logininfor` VALUES (1959, 'houchu', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 23:06:11');
INSERT INTO `sys_logininfor` VALUES (1960, 'houchu', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 23:06:29');
INSERT INTO `sys_logininfor` VALUES (1961, 'caiwu', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 23:06:35');
INSERT INTO `sys_logininfor` VALUES (1962, 'caiwu', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 23:06:48');
INSERT INTO `sys_logininfor` VALUES (1963, 'dating', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-04-21 23:06:55');
INSERT INTO `sys_logininfor` VALUES (1964, 'dating', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-04-21 23:08:33');
INSERT INTO `sys_logininfor` VALUES (1965, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-22 15:14:44');
INSERT INTO `sys_logininfor` VALUES (1966, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-04-22 15:14:46');
INSERT INTO `sys_logininfor` VALUES (1967, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 15:14:49');
INSERT INTO `sys_logininfor` VALUES (1968, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-04-22 15:23:44');
INSERT INTO `sys_logininfor` VALUES (1969, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 15:23:48');
INSERT INTO `sys_logininfor` VALUES (1970, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-22 15:36:43');
INSERT INTO `sys_logininfor` VALUES (1971, 'rs', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-04-22 15:36:47');
INSERT INTO `sys_logininfor` VALUES (1972, 'renshi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-04-22 15:36:52');
INSERT INTO `sys_logininfor` VALUES (1973, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 15:37:08');
INSERT INTO `sys_logininfor` VALUES (1974, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-22 15:38:20');
INSERT INTO `sys_logininfor` VALUES (1975, 'renshi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 15:38:26');
INSERT INTO `sys_logininfor` VALUES (1976, 'renshi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-22 15:38:29');
INSERT INTO `sys_logininfor` VALUES (1977, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-04-22 15:38:31');
INSERT INTO `sys_logininfor` VALUES (1978, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 15:38:36');
INSERT INTO `sys_logininfor` VALUES (1979, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-22 15:39:02');
INSERT INTO `sys_logininfor` VALUES (1980, 'caiwu', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-04-22 15:39:10');
INSERT INTO `sys_logininfor` VALUES (1981, 'caiwu', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 15:39:13');
INSERT INTO `sys_logininfor` VALUES (1982, 'caiwu', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-22 15:39:18');
INSERT INTO `sys_logininfor` VALUES (1983, 'houchu', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 15:39:25');
INSERT INTO `sys_logininfor` VALUES (1984, 'houchu', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-22 15:39:31');
INSERT INTO `sys_logininfor` VALUES (1985, 'yuding', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 15:39:36');
INSERT INTO `sys_logininfor` VALUES (1986, 'yuding', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-22 15:39:40');
INSERT INTO `sys_logininfor` VALUES (1987, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-04-22 15:39:42');
INSERT INTO `sys_logininfor` VALUES (1988, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 15:39:45');
INSERT INTO `sys_logininfor` VALUES (1989, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-22 15:40:08');
INSERT INTO `sys_logininfor` VALUES (1990, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 15:40:12');
INSERT INTO `sys_logininfor` VALUES (1991, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-22 15:40:21');
INSERT INTO `sys_logininfor` VALUES (1992, 'renshi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 15:40:25');
INSERT INTO `sys_logininfor` VALUES (1993, 'renshi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-22 15:49:54');
INSERT INTO `sys_logininfor` VALUES (1994, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 15:50:03');
INSERT INTO `sys_logininfor` VALUES (1995, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-22 15:50:16');
INSERT INTO `sys_logininfor` VALUES (1996, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 15:56:24');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `menu_top_id` bigint(20) NULL DEFAULT NULL,
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  `delete_flag` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2333 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 40, '#', 1, 'menuItem', 'M', '1', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'demo', '2019-12-31 14:13:09', '系统管理目录', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 30, '#', 1, 'menuItem', 'M', '1', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'admin', '2022-04-21 22:00:51', '系统监控目录', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (100, '人事管理', 2310, 120, '/system/user', 2, 'menuItem', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2022-04-22 15:27:19', '用户管理菜单', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (101, '人员权限管理', 2310, 110, '/system/role', 2, 'menuItem', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2022-04-22 15:27:27', '角色管理菜单', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 100, '/system/menu', NULL, 'menuItem', 'C', '1', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-08-11 16:22:41', '菜单管理菜单', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 90, '/system/dept', NULL, 'menuItem', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-08-11 16:22:50', '部门管理菜单', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 80, '/system/post', 2, 'menuItem', 'C', '1', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2022-04-21 22:01:00', '岗位管理菜单', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 70, '/system/dict', NULL, 'menuItem', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-08-11 16:23:07', '字典管理菜单', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 60, '/system/config', NULL, 'menuItem', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-08-11 16:23:14', '参数设置菜单', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (108, '日志管理', 2, 50, '#', 1, 'menuItem', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'demo', '2019-11-13 16:15:57', '日志管理菜单', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 30, '/monitor/online', NULL, 'menuItem', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-08-11 16:24:31', '在线用户菜单', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 10, '/monitor/data', NULL, 'menuItem', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-08-11 16:24:04', '数据监控菜单', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', NULL, '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '操作日志菜单', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', NULL, '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '登录日志菜单', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', NULL, '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', NULL, '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', NULL, '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', NULL, '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', NULL, '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', NULL, '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', NULL, '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', NULL, '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', NULL, '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', NULL, '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', NULL, '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', NULL, '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', NULL, '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', NULL, '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', NULL, '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', NULL, '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', NULL, '', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', NULL, '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', NULL, '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', NULL, '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', NULL, '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', NULL, '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', NULL, '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', NULL, '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', NULL, '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', NULL, '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', NULL, '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', NULL, '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', NULL, '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', NULL, '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', NULL, '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', NULL, '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', NULL, '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', NULL, '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', NULL, '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', NULL, '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', NULL, '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', NULL, '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', NULL, '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', NULL, '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', NULL, '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', NULL, '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', NULL, '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', NULL, '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', NULL, '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (2005, '项目配置', 1, 30, '/system/config/projectConfig', NULL, 'menuItem', 'C', '0', '', '#', 'admin', '2019-08-07 23:29:26', 'admin', '2019-08-11 16:23:48', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (2287, '顶部菜单', 1, 105, '/system/menutop', NULL, 'menuItem', 'C', '0', 'system:menutop:view', '#', 'admin', '2019-12-31 10:39:33', 'admin', '2019-12-31 11:13:39', '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (2288, '查看', 2287, 10, '#', NULL, 'menuItem', 'F', '0', 'system:menutop:list', '#', 'admin', '2019-12-31 11:13:58', '', NULL, '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (2289, '新增', 2287, 9, '#', NULL, 'menuItem', 'F', '0', 'system:menutop:add', '#', 'admin', '2019-12-31 11:14:27', '', NULL, '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (2290, '修改', 2287, 8, '#', NULL, 'menuItem', 'F', '0', 'system:menutop:edit', '#', 'admin', '2019-12-31 11:14:49', '', NULL, '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (2291, '删除', 2287, 7, '#', NULL, 'menuItem', 'F', '0', 'system:menutop:remove', '#', 'admin', '2019-12-31 11:15:14', '', NULL, '', NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (2310, '餐饮管理', 0, 100, '#', 2, 'menuItem', 'M', '0', NULL, 'fa fa-hand-paper-o', 'admin', '2022-04-14 22:03:20', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2311, '餐桌管理', 2310, 100, '/restaurant/dinnertable', 2, 'menuItem', 'C', '0', 'rest:dinnertable:view', '#', 'admin', '2022-04-14 22:04:17', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2312, '查看', 2311, 10, '#', 2, 'menuItem', 'F', '0', 'rest:dinnertable:list', '#', 'admin', '2022-04-14 22:06:08', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2313, '新增', 2311, 9, '#', 2, 'menuItem', 'F', '0', 'rest:dinnertable:add', '#', 'admin', '2022-04-14 22:06:25', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2314, '修改', 2311, 8, '#', 2, 'menuItem', 'F', '0', 'rest:dinnertable:edit', '#', 'admin', '2022-04-14 22:06:41', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2315, '删除', 2311, 7, '#', 2, 'menuItem', 'F', '0', 'rest:dinnertable:remove', '#', 'admin', '2022-04-14 22:07:00', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2316, '菜单管理', 2310, 200, 'restaurant/food', 2, 'menuItem', 'C', '0', 'rest:food:view', '#', 'admin', '2022-04-14 23:23:04', 'admin', '2022-04-22 15:26:46', '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2317, '查看', 2316, 10, '#', 2, 'menuItem', 'F', '0', 'rest:food:list', '#', 'admin', '2022-04-14 23:23:27', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2318, '新增', 2316, 9, '#', 2, 'menuItem', 'F', '0', 'rest:food:add', '#', 'admin', '2022-04-14 23:23:40', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2319, '修改', 2316, 8, '#', 2, 'menuItem', 'F', '0', 'rest:food:edit', '#', 'admin', '2022-04-14 23:24:04', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2320, '删除', 2316, 7, '#', 2, 'menuItem', 'F', '0', 'rest:food:remove', '#', 'admin', '2022-04-14 23:24:29', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2321, '预订管理', 2310, 300, 'restaurant/reserve', 2, 'menuItem', 'C', '0', 'rest:reserve:view', '#', 'admin', '2022-04-19 22:06:29', 'admin', '2022-04-19 22:06:37', '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2322, '查看', 2321, 10, '#', 2, 'menuItem', 'F', '0', 'rest:reserve:list', '#', 'admin', '2022-04-19 22:07:02', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2323, '新增', 2321, 9, '#', 2, 'menuItem', 'F', '0', 'rest:reserve:add', '#', 'admin', '2022-04-19 22:07:29', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2324, '修改', 2321, 8, '#', 2, 'menuItem', 'F', '0', 'rest:reserve:edit', '#', 'admin', '2022-04-19 22:07:55', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2325, '删除', 2321, 7, '#', 2, 'menuItem', 'F', '0', 'rest:reserve:remove', '#', 'admin', '2022-04-19 22:09:28', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2326, '订单管理', 2310, 400, '/restaurant/order', 2, 'menuItem', 'C', '0', 'rest:order:view', '#', 'admin', '2022-04-19 22:18:04', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2327, '查看', 2326, 10, '#', 2, 'menuItem', 'F', '0', 'rest:order:list', '#', 'admin', '2022-04-19 22:18:19', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2328, '新增', 2326, 9, '#', 2, 'menuItem', 'F', '0', 'rest:order:add', '#', 'admin', '2022-04-19 22:18:37', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2329, '修改', 2326, 8, '#', 2, 'menuItem', 'F', '0', 'rest:order:edit', '#', 'admin', '2022-04-19 22:18:51', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2330, '删除', 2326, 7, '#', 2, 'menuItem', 'F', '0', 'rest:order:remove', '#', 'admin', '2022-04-19 22:19:03', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2331, '餐桌大厅', 2310, 500, 'restaurant/order/hall', 2, 'menuItem', 'C', '0', NULL, '#', 'admin', '2022-04-19 22:19:43', '', NULL, '', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (2332, '营业统计', 2310, 50, '/restaurant/order/quota', 2, 'menuItem', 'C', '0', NULL, '#', 'admin', '2022-04-21 22:30:29', '', NULL, '', NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_menu_top
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_top`;
CREATE TABLE `sys_menu_top`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  `delete_flag` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '顶部菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu_top
-- ----------------------------
INSERT INTO `sys_menu_top` VALUES (1, '系统管理', 10, '', 'fa fa-bars', '', NULL, 'demo', '2019-12-31 14:13:22', '', NULL, NULL, 0);
INSERT INTO `sys_menu_top` VALUES (2, '餐饮管理', 100, '', 'fa fa-bar-chart', 'admin', '2021-04-13 21:05:38', 'admin', '2022-04-14 15:23:14', '', NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `oper_user_id` bigint(20) NULL DEFAULT NULL COMMENT '操作人ID',
  `oper_user_type` int(11) NULL DEFAULT NULL COMMENT '用户类型',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `oper_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 256 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  `delete_flag` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'gly', '管理员', 1, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2021-04-12 21:41:27', '', NULL, NULL, 0);
INSERT INTO `sys_post` VALUES (2, 'hqgl', '后勤管理', 2, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2021-10-24 11:56:31', '俱乐部内部人员，资产，财务等管理', NULL, NULL, 0);
INSERT INTO `sys_post` VALUES (3, 'xlgl', '训练管理', 3, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2021-10-24 11:55:43', '项目训练', NULL, NULL, 0);
INSERT INTO `sys_post` VALUES (4, 'sbgl', '设备管理', 30, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2021-10-24 11:55:23', '训练器材的日常维护保养', NULL, NULL, 0);
INSERT INTO `sys_post` VALUES (5, 'hygl', '会员管理', 5, '0', 'admin', '2021-04-13 21:40:48', 'admin', '2021-10-24 11:54:47', '职责是办理会员卡相关业务', NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `delete_flag` tinyint(4) NULL DEFAULT 0 COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', 0, 'admin', '2018-03-16 11:33:00', 'admin', '2022-04-22 15:38:17', '管理员', NULL, NULL);
INSERT INTO `sys_role` VALUES (120, '预订人员', 'ydry', 2, '1', '0', 0, 'admin', '2022-04-21 22:06:32', 'admin', '2022-04-21 22:45:37', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (121, '人事', 'rs', 3, '1', '0', 0, 'admin', '2022-04-21 22:07:02', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (122, '营业人员', 'yyry', 4, '1', '0', 0, 'admin', '2022-04-21 22:08:17', 'admin', '2022-04-21 22:45:52', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (123, '厨师长', 'csz', 7, '1', '0', 0, 'admin', '2022-04-21 22:08:55', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (124, '财务人员', 'cw', 8, '1', '0', 0, 'admin', '2022-04-21 22:30:54', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (125, ' 管理人员', 'glyr', 10, '1', '0', 0, 'admin', '2022-04-21 22:57:23', 'admin', '2022-04-22 15:38:56', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 100);
INSERT INTO `sys_role_menu` VALUES (1, 101);
INSERT INTO `sys_role_menu` VALUES (1, 1000);
INSERT INTO `sys_role_menu` VALUES (1, 1001);
INSERT INTO `sys_role_menu` VALUES (1, 1002);
INSERT INTO `sys_role_menu` VALUES (1, 1003);
INSERT INTO `sys_role_menu` VALUES (1, 1004);
INSERT INTO `sys_role_menu` VALUES (1, 1005);
INSERT INTO `sys_role_menu` VALUES (1, 1006);
INSERT INTO `sys_role_menu` VALUES (1, 1007);
INSERT INTO `sys_role_menu` VALUES (1, 1008);
INSERT INTO `sys_role_menu` VALUES (1, 1009);
INSERT INTO `sys_role_menu` VALUES (1, 1010);
INSERT INTO `sys_role_menu` VALUES (1, 1011);
INSERT INTO `sys_role_menu` VALUES (1, 2310);
INSERT INTO `sys_role_menu` VALUES (1, 2311);
INSERT INTO `sys_role_menu` VALUES (1, 2312);
INSERT INTO `sys_role_menu` VALUES (1, 2313);
INSERT INTO `sys_role_menu` VALUES (1, 2314);
INSERT INTO `sys_role_menu` VALUES (1, 2315);
INSERT INTO `sys_role_menu` VALUES (1, 2316);
INSERT INTO `sys_role_menu` VALUES (1, 2317);
INSERT INTO `sys_role_menu` VALUES (1, 2318);
INSERT INTO `sys_role_menu` VALUES (1, 2319);
INSERT INTO `sys_role_menu` VALUES (1, 2320);
INSERT INTO `sys_role_menu` VALUES (1, 2321);
INSERT INTO `sys_role_menu` VALUES (1, 2322);
INSERT INTO `sys_role_menu` VALUES (1, 2323);
INSERT INTO `sys_role_menu` VALUES (1, 2324);
INSERT INTO `sys_role_menu` VALUES (1, 2325);
INSERT INTO `sys_role_menu` VALUES (1, 2326);
INSERT INTO `sys_role_menu` VALUES (1, 2327);
INSERT INTO `sys_role_menu` VALUES (1, 2328);
INSERT INTO `sys_role_menu` VALUES (1, 2329);
INSERT INTO `sys_role_menu` VALUES (1, 2330);
INSERT INTO `sys_role_menu` VALUES (1, 2331);
INSERT INTO `sys_role_menu` VALUES (1, 2332);
INSERT INTO `sys_role_menu` VALUES (120, 2310);
INSERT INTO `sys_role_menu` VALUES (120, 2321);
INSERT INTO `sys_role_menu` VALUES (120, 2322);
INSERT INTO `sys_role_menu` VALUES (120, 2323);
INSERT INTO `sys_role_menu` VALUES (120, 2324);
INSERT INTO `sys_role_menu` VALUES (120, 2325);
INSERT INTO `sys_role_menu` VALUES (120, 2326);
INSERT INTO `sys_role_menu` VALUES (120, 2327);
INSERT INTO `sys_role_menu` VALUES (120, 2328);
INSERT INTO `sys_role_menu` VALUES (120, 2329);
INSERT INTO `sys_role_menu` VALUES (120, 2330);
INSERT INTO `sys_role_menu` VALUES (121, 1);
INSERT INTO `sys_role_menu` VALUES (121, 100);
INSERT INTO `sys_role_menu` VALUES (121, 1000);
INSERT INTO `sys_role_menu` VALUES (121, 1001);
INSERT INTO `sys_role_menu` VALUES (121, 1002);
INSERT INTO `sys_role_menu` VALUES (121, 1003);
INSERT INTO `sys_role_menu` VALUES (121, 1004);
INSERT INTO `sys_role_menu` VALUES (121, 1005);
INSERT INTO `sys_role_menu` VALUES (121, 1006);
INSERT INTO `sys_role_menu` VALUES (121, 2310);
INSERT INTO `sys_role_menu` VALUES (122, 2310);
INSERT INTO `sys_role_menu` VALUES (122, 2326);
INSERT INTO `sys_role_menu` VALUES (122, 2327);
INSERT INTO `sys_role_menu` VALUES (122, 2328);
INSERT INTO `sys_role_menu` VALUES (122, 2329);
INSERT INTO `sys_role_menu` VALUES (122, 2330);
INSERT INTO `sys_role_menu` VALUES (122, 2331);
INSERT INTO `sys_role_menu` VALUES (123, 2310);
INSERT INTO `sys_role_menu` VALUES (123, 2311);
INSERT INTO `sys_role_menu` VALUES (123, 2312);
INSERT INTO `sys_role_menu` VALUES (123, 2313);
INSERT INTO `sys_role_menu` VALUES (123, 2314);
INSERT INTO `sys_role_menu` VALUES (123, 2315);
INSERT INTO `sys_role_menu` VALUES (123, 2316);
INSERT INTO `sys_role_menu` VALUES (123, 2317);
INSERT INTO `sys_role_menu` VALUES (123, 2318);
INSERT INTO `sys_role_menu` VALUES (123, 2319);
INSERT INTO `sys_role_menu` VALUES (123, 2320);
INSERT INTO `sys_role_menu` VALUES (124, 2310);
INSERT INTO `sys_role_menu` VALUES (124, 2332);
INSERT INTO `sys_role_menu` VALUES (125, 100);
INSERT INTO `sys_role_menu` VALUES (125, 101);
INSERT INTO `sys_role_menu` VALUES (125, 1000);
INSERT INTO `sys_role_menu` VALUES (125, 1001);
INSERT INTO `sys_role_menu` VALUES (125, 1002);
INSERT INTO `sys_role_menu` VALUES (125, 1003);
INSERT INTO `sys_role_menu` VALUES (125, 1004);
INSERT INTO `sys_role_menu` VALUES (125, 1005);
INSERT INTO `sys_role_menu` VALUES (125, 1006);
INSERT INTO `sys_role_menu` VALUES (125, 1007);
INSERT INTO `sys_role_menu` VALUES (125, 1008);
INSERT INTO `sys_role_menu` VALUES (125, 1009);
INSERT INTO `sys_role_menu` VALUES (125, 1010);
INSERT INTO `sys_role_menu` VALUES (125, 1011);
INSERT INTO `sys_role_menu` VALUES (125, 2310);
INSERT INTO `sys_role_menu` VALUES (125, 2311);
INSERT INTO `sys_role_menu` VALUES (125, 2312);
INSERT INTO `sys_role_menu` VALUES (125, 2313);
INSERT INTO `sys_role_menu` VALUES (125, 2314);
INSERT INTO `sys_role_menu` VALUES (125, 2315);
INSERT INTO `sys_role_menu` VALUES (125, 2316);
INSERT INTO `sys_role_menu` VALUES (125, 2317);
INSERT INTO `sys_role_menu` VALUES (125, 2318);
INSERT INTO `sys_role_menu` VALUES (125, 2319);
INSERT INTO `sys_role_menu` VALUES (125, 2320);
INSERT INTO `sys_role_menu` VALUES (125, 2321);
INSERT INTO `sys_role_menu` VALUES (125, 2322);
INSERT INTO `sys_role_menu` VALUES (125, 2323);
INSERT INTO `sys_role_menu` VALUES (125, 2324);
INSERT INTO `sys_role_menu` VALUES (125, 2325);
INSERT INTO `sys_role_menu` VALUES (125, 2326);
INSERT INTO `sys_role_menu` VALUES (125, 2327);
INSERT INTO `sys_role_menu` VALUES (125, 2328);
INSERT INTO `sys_role_menu` VALUES (125, 2329);
INSERT INTO `sys_role_menu` VALUES (125, 2330);
INSERT INTO `sys_role_menu` VALUES (125, 2331);
INSERT INTO `sys_role_menu` VALUES (125, 2332);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `idcardno` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `salary` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工资',
  `entry_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入职日期',
  `phonenumber` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 2停用）',
  `user_type` tinyint(4) NULL DEFAULT 0 COMMENT '0俱乐部内部人员，1会员',
  `openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信公众号OPENID',
  `register_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  `delete_flag` tinyint(4) NULL DEFAULT 0 COMMENT '删除标志（0代表存在 1代表删除）',
  `oldpwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birth` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `disease` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `index_longname_unique`(`login_name`, `delete_flag`) USING BTREE,
  UNIQUE INDEX `index_code_unique`(`user_code`, `delete_flag`) USING BTREE,
  UNIQUE INDEX `index_idcardno_unique`(`idcardno`, `delete_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12721 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '超级管理员', '0001', '0001', '', NULL, NULL, '17755895101', '1', '/profile/avatar/2022/04/21/f88de986c9d313edff6bdabb8aea82e7.png', 'd1cdf661140a87c33fa798c452612c34', '5c3753', '0', 0, '', '2022-03-14 23:43:50', '127.0.0.1', '2022-04-22 15:56:25', '管理员', 'admin', '2022-03-14 23:43:50', 'admin', '2022-04-22 15:56:24', NULL, NULL, 0, 'wU6G3AbTqzby88fFF69W1w==', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (12714, 219, 'houchu', '后厨', NULL, NULL, '', '5000', '2022-04-13', '', '0', '', 'c4bb0ba935ed0b3bb209b51969556bc4', 'bf7116', '0', 0, NULL, '2022-04-21 22:21:25', '127.0.0.1', '2022-04-22 15:39:26', '这里是地址', 'admin', '2022-04-21 22:21:25', '', '2022-04-22 15:39:25', NULL, NULL, 0, '6sNGZkDV4Zy36rRLW6cqiF0mILiJtVgDvFsddqSylcfGmK4nI+owv3ripvVre8E2', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (12715, 218, 'caiwu', '财务', NULL, NULL, '', '4444', '2022-04-21', '', '2', '', '2572f6adac412eade450c57c2d8e89d2', '083dce', '0', 0, NULL, '2022-04-21 22:32:42', '127.0.0.1', '2022-04-22 15:39:14', NULL, 'admin', '2022-04-21 22:32:42', '', '2022-04-22 15:39:13', NULL, NULL, 0, 'oYYJbPSKbmmKK46BVgDuCpWQI7doETEEqDd8MQU6kDxile39yRxbcbbPzULwp4pn', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (12716, 220, 'yuding', '预订', NULL, NULL, '', '5555', '2022-04-21', '', '2', '', '116ccfe7e98da3ff696e918c32995934', '535a23', '0', 0, NULL, '2022-04-21 22:33:09', '127.0.0.1', '2022-04-22 15:39:36', NULL, 'admin', '2022-04-21 22:33:09', '', '2022-04-22 15:39:36', NULL, NULL, 0, '+ocA9/c+XTwGMMtGoUj/MUZZoCP6rxKQDlCOufeLEhw6PdyRQ3fBXygSF2nJiv5D', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (12717, 220, 'dating', '大厅', NULL, NULL, '', '6666', '2022-04-20', '', '2', '', '3be49d26498508462d804637445bbddb', '3b570f', '0', 0, NULL, '2022-04-21 22:34:00', '127.0.0.1', '2022-04-21 23:06:55', NULL, 'admin', '2022-04-21 22:34:00', '', '2022-04-21 23:06:55', NULL, NULL, 0, 'rbNzWudD14C+UAs4dsl2J+6Zwvmayczng04rJ4FOS4SnYz2cWZ3u9IyhmFiX72FU', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (12718, 218, 'zhangsan', '张三', '20215002', NULL, '', '4444', '2022-04-19', '17755895106', '0', '', '27aeb2b3cb5e0b89fb07f5468473a812', 'b4adb2', '0', 0, NULL, '2022-04-21 22:58:13', '', NULL, '家庭住址', 'admin', '2022-04-21 22:58:13', '', NULL, NULL, NULL, 0, 'KdLzRB66lzmAKcmEl8gYRJzoN24q8hzUqJFKFAOct++A8y1PUOB41wZTkQLxv7VV', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (12719, NULL, 'ceshi', '测试3', NULL, NULL, '', '4343', '2022-04-16', '', '2', '', '9efe45b665a456efaf1e46e8b1185ae1', '9c37b5', '0', 0, NULL, '2022-04-22 15:32:58', '', NULL, '', 'admin', '2022-04-22 15:32:58', 'admin', '2022-04-22 15:33:05', NULL, NULL, 0, 'ZBriqXZBmP6rRjoN/E5pGcakXWVTrAAfXt1vPbTOgZhiDrIGx0X4qkmKzrBcfuNR', NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (12720, NULL, 'renshi', '人事', NULL, NULL, '', NULL, NULL, '', '1', '', '31a569acb4f49b30f461b1aec93b3669', '623dfd', '0', 0, NULL, '2022-04-22 15:37:45', '127.0.0.1', '2022-04-22 15:40:26', '', 'admin', '2022-04-22 15:37:45', 'renshi', '2022-04-22 15:49:51', NULL, NULL, 0, 'ihdb4OOEbRySgTR0IpiannhFvovbZ2qSM3DecLqoctViDrIGx0X4qkmKzrBcfuNR', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户姓名',
  `user_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '学工号',
  `idcardno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '身份证',
  `user_type` int(11) NULL DEFAULT 0,
  `phonenumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(11) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('83c623fa-4535-4542-a726-2a1041e9f957', 'admin', '超级管理员', '0001', '0001', 0, '17755895101', '餐饮有限公司', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', 'on_line', '2022-04-19 22:05:01', '2022-04-19 23:33:50', 604800000);
INSERT INTO `sys_user_online` VALUES ('d4c6672f-51fa-4358-aeac-b27a640d3dd7', 'houchu', '后厨', NULL, NULL, 0, '', '后厨', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', 'on_line', '2022-04-21 22:37:57', '2022-04-21 22:38:03', 604800000);
INSERT INTO `sys_user_online` VALUES ('d6c52ae0-49a1-4d56-aef7-0bddcfd5dd9b', 'admin', '超级管理员', '0001', '0001', 0, '17755895101', '餐饮有限公司', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', 'on_line', '2022-04-22 15:50:17', '2022-04-22 15:56:25', 604800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1, 119);
INSERT INTO `sys_user_role` VALUES (12711, 117);
INSERT INTO `sys_user_role` VALUES (12713, 117);
INSERT INTO `sys_user_role` VALUES (12714, 123);
INSERT INTO `sys_user_role` VALUES (12715, 124);
INSERT INTO `sys_user_role` VALUES (12716, 120);
INSERT INTO `sys_user_role` VALUES (12717, 122);
INSERT INTO `sys_user_role` VALUES (12718, 125);
INSERT INTO `sys_user_role` VALUES (12719, 122);
INSERT INTO `sys_user_role` VALUES (12720, 121);

SET FOREIGN_KEY_CHECKS = 1;
