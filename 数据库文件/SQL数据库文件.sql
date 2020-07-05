/*
Navicat SQL Server Data Transfer

Source Server         : 59.77.134.183
Source Server Version : 105000
Source Host           : 59.77.134.183:1433
Source Database       : et
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 105000
File Encoding         : 65001

Date: 2019-07-05 13:10:59
*/


-- ----------------------------
-- Table structure for [course]
-- ----------------------------
DROP TABLE [course]
GO
CREATE TABLE [course] (
[id] bigint NOT NULL ,
[create_by] varchar(255) NULL ,
[create_date] datetime2(7) NULL ,
[end_section] varchar(255) NULL ,
[end_week] varchar(255) NULL ,
[location] varchar(255) NULL ,
[modify_by] varchar(255) NULL ,
[modify_date] datetime2(7) NULL ,
[name] varchar(255) NULL ,
[semester] varchar(255) NULL ,
[start_section] varchar(255) NULL ,
[start_week] varchar(255) NULL 
)


GO

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [dic_content]
-- ----------------------------
DROP TABLE [dic_content]
GO
CREATE TABLE [dic_content] (
[id] bigint NOT NULL ,
[content_key] varchar(255) NULL ,
[content_value] varchar(255) NULL ,
[create_by] varchar(255) NULL ,
[create_date] datetime2(7) NULL ,
[describe] varchar(255) NULL ,
[modify_by] varchar(255) NULL ,
[modify_date] datetime2(7) NULL ,
[status] varchar(255) NULL ,
[dictionaryid] bigint NULL ,
[sequence] varchar(255) NULL 
)


GO

-- ----------------------------
-- Records of dic_content
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'33', N'System_SYS', N'系统参数', N'root', N'2019-04-15 14:26:39.7740000', N'数据字典数据类型参数', null, null, N'Normal_SYS', N'29', N'0');
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'34', N'Standard_SYS', N'标准参数', N'root', N'2019-04-15 14:27:28.4190000', N'数据字典数据类型参数', N'root', N'2019-04-25 14:22:38.8400000', N'Normal_SYS', N'29', N'1');
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'35', N'Normal_SYS', N'正常', N'root', N'2019-04-15 14:28:26.7320000', N'用户状态', null, null, N'Normal_SYS', N'30', N'0');
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'36', N'Disabled_SYS', N'禁用', N'root', N'2019-04-15 14:28:45.6570000', N'用户状态', null, null, N'Normal_SYS', N'30', N'1');
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'39', N'User_SYS', N'用户', N'root', N'2019-04-15 14:32:52.3760000', N'基础用户', null, null, N'Normal_SYS', N'32', N'0');
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'40', N'Admin_SYS', N'管理员', N'root', N'2019-04-15 14:33:08.9830000', N'基础用户', null, null, N'Normal_SYS', N'32', N'1');
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'108', N'SuperUser_SYS', N'超级管理员', N'root', N'2019-04-29 15:41:06.6790000', null, null, null, N'Normal', N'32', N'3');
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'140', N'male', N'男', N'root', N'2019-05-25 14:46:31.7810000', N'用户性别', null, null, N'Normal', N'139', N'0');
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'141', N'female', N'女', N'root', N'2019-05-25 14:46:49.6170000', N'用户性别', null, null, N'Normal', N'139', N'1');
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'142', N'midSex', N'中性', N'root', N'2019-05-25 14:47:24.8200000', N'不搞歧视', null, null, N'Normal', N'139', N'3');
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'233', N'User_SYS', N'用户', N'root', N'2019-06-22 19:58:06.9970000', null, null, null, N'Normal', N'232', N'1');
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'234', N'Admin_SYS', N'管理员', N'root', N'2019-06-22 19:58:17.4160000', null, null, null, N'Normal', N'232', N'2');
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'235', N'SupperAdmin_SYS', N'超级管理员', N'root', N'2019-06-22 19:58:29.2590000', null, null, null, N'Normal', N'232', N'3');
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'253', N'test1', N'女', N'liuyoyu', N'2019-06-24 10:27:15.5550000', N'test', N'liuyoyu', N'2019-06-24 12:52:26.7490000', N'Normal_SYS', N'252', N'2');
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'254', N'test2', N'测试2', N'liuyoyu', N'2019-06-24 10:27:31.9550000', N'测试2', N'liuyoyu', N'2019-06-24 10:27:38.9150000', N'Normal', N'252', N'1');
INSERT INTO [dic_content] ([id], [content_key], [content_value], [create_by], [create_date], [describe], [modify_by], [modify_date], [status], [dictionaryid], [sequence]) VALUES (N'296', N'1', N'1', N'zwd71', N'2019-07-01 19:29:45.5780000', null, null, null, N'Normal', N'29', N'1');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [dictionary]
-- ----------------------------
DROP TABLE [dictionary]
GO
CREATE TABLE [dictionary] (
[id] bigint NOT NULL ,
[data_desc] varchar(255) NULL ,
[data_type] varchar(255) NULL ,
[create_by] varchar(255) NULL ,
[create_date] datetime2(7) NULL ,
[modify_by] varchar(255) NULL ,
[modify_date] datetime2(7) NULL ,
[data_value] varchar(255) NULL ,
[data_key] varchar(255) NULL ,
[data_type_key] varchar(255) NULL 
)


GO

-- ----------------------------
-- Records of dictionary
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [dictionary] ([id], [data_desc], [data_type], [create_by], [create_date], [modify_by], [modify_date], [data_value], [data_key], [data_type_key]) VALUES (N'29', N'数据字典参数类型', N'系统数据', N'root', N'2019-04-15 14:22:14.8810000', null, null, N'数据类型', N'dataType', N'System');
INSERT INTO [dictionary] ([id], [data_desc], [data_type], [create_by], [create_date], [modify_by], [modify_date], [data_value], [data_key], [data_type_key]) VALUES (N'30', N'用户状态类型', N'系统数据', N'root', N'2019-04-15 14:23:40.7440000', N'root', N'2019-04-25 16:19:05.7970000', N'用户状态', N'userStatus', N'System');
INSERT INTO [dictionary] ([id], [data_desc], [data_type], [create_by], [create_date], [modify_by], [modify_date], [data_value], [data_key], [data_type_key]) VALUES (N'32', N'用户角色类', N'系统数据', N'root', N'2019-04-15 14:24:47.4400000', N'root', N'2019-04-27 14:43:35.2810000', N'用户角色', N'userType', N'System');
INSERT INTO [dictionary] ([id], [data_desc], [data_type], [create_by], [create_date], [modify_by], [modify_date], [data_value], [data_key], [data_type_key]) VALUES (N'139', N'用户性别别', null, N'root', N'2019-05-25 14:46:05.8290000', null, null, N'性别', N'sex', N'Standard');
INSERT INTO [dictionary] ([id], [data_desc], [data_type], [create_by], [create_date], [modify_by], [modify_date], [data_value], [data_key], [data_type_key]) VALUES (N'232', N'User_SYS', null, N'root', N'2019-06-22 19:57:33.2070000', null, null, N'角色类型', N'RoleType', N'Standard');
INSERT INTO [dictionary] ([id], [data_desc], [data_type], [create_by], [create_date], [modify_by], [modify_date], [data_value], [data_key], [data_type_key]) VALUES (N'252', N'test', null, N'liuyoyu', N'2019-06-24 10:26:36.9750000', N'liuyoyu', N'2019-06-24 12:55:43.2570000', N'test', N'test', N'Standard_SYS');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [hibernate_sequence]
-- ----------------------------
DROP TABLE [hibernate_sequence]
GO
CREATE TABLE [hibernate_sequence] (
[next_val] bigint NULL 
)


GO

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [hibernate_sequence] ([next_val]) VALUES (N'323');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [menu]
-- ----------------------------
DROP TABLE [menu]
GO
CREATE TABLE [menu] (
[id] bigint NOT NULL ,
[create_by] varchar(255) NULL ,
[create_date] datetime2(7) NULL ,
[icon] varchar(255) NULL ,
[menu_name] varchar(255) NULL ,
[menu_status] varchar(255) NULL ,
[menuurl] varchar(255) NULL ,
[menu_value] varchar(255) NULL ,
[modify_by] varchar(255) NULL ,
[modify_date] datetime2(7) NULL ,
[parent_menu_id] bigint NULL ,
[sequence] int NULL ,
[hidden] bit NULL 
)


GO

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'178', N'root', N'2019-06-02 20:57:08.6680000', N'f', N'测试根菜单', N'1', N'/s', N'test', null, null, N'0', N'0', N'0');
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'181', N'root', N'2019-06-02 20:58:02.7340000', N'fa fa-coin', N'测试根菜单2', N'1', N'/s/test', N'test2', N'11', N'2019-07-02 23:16:23.7680000', N'300', N'1', N'0');
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'183', N'root', N'2019-06-02 20:59:00.8260000', N'fa fa-coin', N'测试菜单3', N'0', N'/s/test3', N'test3', N'11', N'2019-07-01 22:33:33.8150000', N'178', N'1', N'0');
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'189', N'root', N'2019-06-02 21:54:17.1890000', N'f', N'test', N'1', N'/s/s', N'sus', null, null, N'23', null, N'0');
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'231', N'root', N'2019-06-22 18:54:03.9180000', null, N'xx', N'1', N'xxx', N'xx', N'101', N'2019-07-02 21:51:27.4180000', N'0', N'11', N'0');
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'289', N'root', N'2019-07-01 01:12:32.1140000', N'account', N'用户管理', N'1', N'userManage', N'userManage', N'11', N'2019-07-02 23:18:58.9240000', N'0', N'2', N'0');
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'290', N'root', N'2019-07-01 01:13:20.9700000', N'viewlist', N'系统管理', N'1', N'systemManage', N'systemManage', N'11', N'2019-07-02 23:19:11.5200000', N'0', N'3', N'0');
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'291', N'root', N'2019-07-01 01:15:11.5760000', null, N'菜单管理', N'1', N'menuManage', N'menuManage', N'11', N'2019-07-01 22:50:03.8260000', N'290', N'0', N'0');
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'297', N'root', N'2019-07-01 19:46:42.2740000', null, N'数据字典', N'1', N'dataDictionary', N'dataDictionary', N'11', N'2019-07-01 21:45:53.2890000', N'290', N'2', N'0');
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'298', N'root', N'2019-07-01 19:47:33.1800000', null, N'角色管理', N'1', N'roleManage', N'roleManage', null, null, N'290', N'3', N'0');
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'299', N'root', N'2019-07-01 19:57:14.5320000', N'rfq', N'异常页', N'1', N'errPage', N'errPage', N'11', N'2019-07-02 23:19:23.1030000', N'0', N'4', N'0');
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'300', N'root', N'2019-07-01 19:58:16.4100000', null, N'找不到页面', N'1', N'errPage404', N'errPage404', null, null, N'299', N'1', N'0');
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'301', N'root', N'2019-07-01 20:11:43.5700000', null, N'无权访问', N'1', N'errPage403', N'errPage403', null, null, N'299', N'2', N'0');
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'302', N'root', N'2019-07-01 20:14:12.1010000', null, N'服务器出错', N'1', N'errPage500', N'errPage500', null, null, N'299', N'3', N'0');
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'305', N'root', N'2019-07-01 21:44:32.4850000', null, N'测试菜单一', N'1', N'/test', N'test1', N'11', N'2019-07-01 21:45:36.8130000', N'183', N'1', N'1');
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'308', N'liuyoyu', N'2019-07-02 21:54:06.8880000', N'd', N'测试菜单4', N'1', N'/test/4', N'test4', N'11', N'2019-07-02 23:16:41.1200000', N'178', N'0', null);
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'312', N'root', N'2019-07-02 23:17:20.8950000', N'all', N'首页', N'1', N'home', N'home', null, null, N'0', N'1', null);
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'313', N'root', N'2019-07-02 23:19:50.3900000', N'smile', N'关于', N'1', N'about', N'about', null, null, N'0', N'5', null);
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'315', N'root', N'2019-07-02 23:34:33.6330000', N'', N'test13', N'1', N'test13', N'test13', null, null, N'0', N'0', null);
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'316', N'root', N'2019-07-02 23:34:48.1490000', N'', N'test14', N'1', N'test14', N'test14', null, null, N'0', N'0', null);
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'318', N'root', N'2019-07-02 23:36:20.7280000', N'', N'test10', N'1', N'test10', N'test10', null, null, N'0', N'0', null);
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'319', N'root', N'2019-07-02 23:37:03.4920000', N'', N'test11', N'1', N'test11', N'test11', null, null, N'0', N'0', null);
INSERT INTO [menu] ([id], [create_by], [create_date], [icon], [menu_name], [menu_status], [menuurl], [menu_value], [modify_by], [modify_date], [parent_menu_id], [sequence], [hidden]) VALUES (N'320', N'root', N'2019-07-02 23:38:12.5150000', N'', N'ette', N'1', N'ette', N'ette', null, null, N'0', N'0', null);
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [menu_user_type]
-- ----------------------------
DROP TABLE [menu_user_type]
GO
CREATE TABLE [menu_user_type] (
[id] int NOT NULL ,
[create_by] varchar(255) NULL ,
[create_date] datetime2(7) NULL ,
[modify_by] varchar(255) NULL ,
[modify_date] datetime2(7) NULL ,
[user_type] varchar(255) NULL ,
[menuid] bigint NULL 
)


GO

-- ----------------------------
-- Records of menu_user_type
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [menu_user_type] ([id], [create_by], [create_date], [modify_by], [modify_date], [user_type], [menuid]) VALUES (N'179', N'root', N'2019-06-02 20:57:08.7200000', null, null, N'User_SYS', N'178');
INSERT INTO [menu_user_type] ([id], [create_by], [create_date], [modify_by], [modify_date], [user_type], [menuid]) VALUES (N'180', N'root', N'2019-06-02 20:57:08.7210000', null, null, N'Admin_SYS', N'178');
INSERT INTO [menu_user_type] ([id], [create_by], [create_date], [modify_by], [modify_date], [user_type], [menuid]) VALUES (N'182', N'root', N'2019-06-02 20:58:02.7650000', null, null, N'User_SYS', N'181');
INSERT INTO [menu_user_type] ([id], [create_by], [create_date], [modify_by], [modify_date], [user_type], [menuid]) VALUES (N'184', N'root', N'2019-06-02 20:59:00.8330000', null, null, N'Admin_SYS', N'183');
INSERT INTO [menu_user_type] ([id], [create_by], [create_date], [modify_by], [modify_date], [user_type], [menuid]) VALUES (N'190', N'root', N'2019-06-02 21:54:17.2460000', null, null, N'User_SYS', N'189');
INSERT INTO [menu_user_type] ([id], [create_by], [create_date], [modify_by], [modify_date], [user_type], [menuid]) VALUES (N'191', N'root', N'2019-06-02 21:54:17.2470000', null, null, N'Admin_SYS', N'189');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [origanization]
-- ----------------------------
DROP TABLE [origanization]
GO
CREATE TABLE [origanization] (
[id] bigint NOT NULL ,
[name] varchar(255) NOT NULL 
)


GO

-- ----------------------------
-- Records of origanization
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [origanization] ([id], [name]) VALUES (N'130', N'liuyoyu');
INSERT INTO [origanization] ([id], [name]) VALUES (N'131', N'liuyoyu');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [role]
-- ----------------------------
DROP TABLE [role]
GO
CREATE TABLE [role] (
[role_id] bigint NOT NULL ,
[create_by] varchar(255) NULL ,
[create_date] datetime2(7) NULL ,
[detail] varchar(MAX) NULL ,
[modify_by] varchar(255) NULL ,
[modify_date] datetime2(7) NULL ,
[role_name] varchar(255) NOT NULL ,
[create_time] date NULL ,
[creator_name] varchar(255) NULL ,
[modify_time] date NULL ,
[status] varchar(255) NULL ,
[user_type] varchar(255) NULL 
)


GO

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [role] ([role_id], [create_by], [create_date], [detail], [modify_by], [modify_date], [role_name], [create_time], [creator_name], [modify_time], [status], [user_type]) VALUES (N'1', null, N'2019-04-14 22:55:46.0000000', N'测试管理员', N'root', N'2019-06-24 10:00:46.2830000', N'1xx', null, null, null, null, N'Admin_SYS');
INSERT INTO [role] ([role_id], [create_by], [create_date], [detail], [modify_by], [modify_date], [role_name], [create_time], [creator_name], [modify_time], [status], [user_type]) VALUES (N'2', null, N'2019-04-15 13:37:44.0000000', null, null, null, N'用户', null, null, null, null, N'User_SYS');
INSERT INTO [role] ([role_id], [create_by], [create_date], [detail], [modify_by], [modify_date], [role_name], [create_time], [creator_name], [modify_time], [status], [user_type]) VALUES (N'82', N'root', N'2019-04-19 18:45:26.5850000', N'', N'root', N'2019-04-19 18:52:28.5660000', N'yoyuliu', null, null, null, N'Normal_SYS', N'User_SYS');
INSERT INTO [role] ([role_id], [create_by], [create_date], [detail], [modify_by], [modify_date], [role_name], [create_time], [creator_name], [modify_time], [status], [user_type]) VALUES (N'83', N'root', N'2019-04-19 19:06:21.4120000', N'', null, null, N'liuyoyu', null, null, null, N'Normal_SYS', N'User_SYS');
INSERT INTO [role] ([role_id], [create_by], [create_date], [detail], [modify_by], [modify_date], [role_name], [create_time], [creator_name], [modify_time], [status], [user_type]) VALUES (N'105', N'root', N'2019-04-27 11:12:22.7570000', N'', null, null, N'超级管理员', null, null, null, N'Normal_SYS', N'SupperAdmin_SYS');
INSERT INTO [role] ([role_id], [create_by], [create_date], [detail], [modify_by], [modify_date], [role_name], [create_time], [creator_name], [modify_time], [status], [user_type]) VALUES (N'136', N'root', N'2019-05-11 20:04:27.3880000', N'xx', N'root', N'2019-06-22 20:09:15.1210000', N'逐渐自闭xxx', null, null, null, N'Normal_SYS', N'User_SYS');
INSERT INTO [role] ([role_id], [create_by], [create_date], [detail], [modify_by], [modify_date], [role_name], [create_time], [creator_name], [modify_time], [status], [user_type]) VALUES (N'138', N'root', N'2019-05-11 23:42:43.8070000', N'', N'root', N'2019-06-25 21:16:14.7440000', N'炒鸡用户1', null, null, null, null, N'Admin_SYS');
INSERT INTO [role] ([role_id], [create_by], [create_date], [detail], [modify_by], [modify_date], [role_name], [create_time], [creator_name], [modify_time], [status], [user_type]) VALUES (N'143', N'root', N'2019-05-27 10:33:46.9670000', N'xx大的', N'root', N'2019-06-27 21:52:43.4030000', N'User_SYSxxx', null, null, null, null, N'User_SYS');
INSERT INTO [role] ([role_id], [create_by], [create_date], [detail], [modify_by], [modify_date], [role_name], [create_time], [creator_name], [modify_time], [status], [user_type]) VALUES (N'152', N'root', N'2019-05-27 10:49:38.5940000', N'', N'liuyoyu', N'2019-06-23 14:03:05.3390000', N'普通用户', null, null, null, null, N'User_SYS');
INSERT INTO [role] ([role_id], [create_by], [create_date], [detail], [modify_by], [modify_date], [role_name], [create_time], [creator_name], [modify_time], [status], [user_type]) VALUES (N'236', N'root', N'2019-06-22 20:06:08.2310000', N'322', N'root', N'2019-06-23 16:28:17.3400000', N'adad', null, null, null, null, N'Admin_SYS');
INSERT INTO [role] ([role_id], [create_by], [create_date], [detail], [modify_by], [modify_date], [role_name], [create_time], [creator_name], [modify_time], [status], [user_type]) VALUES (N'238', N'root', N'2019-06-22 20:08:19.4310000', N'测试test角色信息', N'liuyoyu', N'2019-06-23 16:23:12.9600000', N'tests测设角色信息', null, N'123', null, null, N'User_SYS');
INSERT INTO [role] ([role_id], [create_by], [create_date], [detail], [modify_by], [modify_date], [role_name], [create_time], [creator_name], [modify_time], [status], [user_type]) VALUES (N'293', N'root', N'2019-07-01 01:19:34.3840000', N'hgyhgh', null, null, N'hgh', null, null, null, null, N'Admin_SYS');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [role_menu]
-- ----------------------------
DROP TABLE [role_menu]
GO
CREATE TABLE [role_menu] (
[id] bigint NOT NULL ,
[create_by] varchar(255) NULL ,
[create_date] datetime2(7) NULL ,
[modify_by] varchar(255) NULL ,
[modify_date] datetime2(7) NULL ,
[menu_id] bigint NULL ,
[role_id] bigint NULL 
)


GO

-- ----------------------------
-- Records of role_menu
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [role_menu] ([id], [create_by], [create_date], [modify_by], [modify_date], [menu_id], [role_id]) VALUES (N'218', N'liuyoyu', N'2019-06-11 22:53:44.1010000', null, null, N'181', N'152');
INSERT INTO [role_menu] ([id], [create_by], [create_date], [modify_by], [modify_date], [menu_id], [role_id]) VALUES (N'219', N'liuyoyu', N'2019-06-11 23:04:12.5040000', null, null, N'181', N'105');
INSERT INTO [role_menu] ([id], [create_by], [create_date], [modify_by], [modify_date], [menu_id], [role_id]) VALUES (N'256', N'root', N'2019-06-25 23:50:10.4780000', null, null, N'183', N'152');
INSERT INTO [role_menu] ([id], [create_by], [create_date], [modify_by], [modify_date], [menu_id], [role_id]) VALUES (N'259', N'root', N'2019-06-26 00:20:05.6010000', null, null, N'231', N'152');
INSERT INTO [role_menu] ([id], [create_by], [create_date], [modify_by], [modify_date], [menu_id], [role_id]) VALUES (N'260', N'root', N'2019-06-26 00:20:47.1830000', null, null, N'231', N'2');
INSERT INTO [role_menu] ([id], [create_by], [create_date], [modify_by], [modify_date], [menu_id], [role_id]) VALUES (N'263', N'root', N'2019-06-26 00:22:26.1000000', null, null, N'231', N'82');
INSERT INTO [role_menu] ([id], [create_by], [create_date], [modify_by], [modify_date], [menu_id], [role_id]) VALUES (N'268', N'root', N'2019-06-26 00:25:13.1250000', null, null, N'178', N'152');
INSERT INTO [role_menu] ([id], [create_by], [create_date], [modify_by], [modify_date], [menu_id], [role_id]) VALUES (N'272', N'liuyoyu', N'2019-06-26 14:34:46.4810000', null, null, N'178', N'138');
INSERT INTO [role_menu] ([id], [create_by], [create_date], [modify_by], [modify_date], [menu_id], [role_id]) VALUES (N'273', N'liuyoyu', N'2019-06-26 14:34:46.4830000', null, null, N'181', N'138');
INSERT INTO [role_menu] ([id], [create_by], [create_date], [modify_by], [modify_date], [menu_id], [role_id]) VALUES (N'277', N'root', N'2019-06-27 21:52:19.8100000', null, null, N'231', N'143');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [short_message]
-- ----------------------------
DROP TABLE [short_message]
GO
CREATE TABLE [short_message] (
[id] bigint NOT NULL ,
[account] varchar(255) NULL ,
[code] varchar(255) NULL ,
[email] varchar(255) NULL ,
[purpose] varchar(MAX) NULL ,
[send_time] datetime2(7) NULL 
)


GO

-- ----------------------------
-- Records of short_message
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [short_message] ([id], [account], [code], [email], [purpose], [send_time]) VALUES (N'24', N'root', N'44Fv0qa7DxCAvMMFGqLrXd1Qg', N'673677179@qq.com', N'重置密码', N'2019-04-14 23:20:27.6490000');
INSERT INTO [short_message] ([id], [account], [code], [email], [purpose], [send_time]) VALUES (N'67', N'root', N'C1MycCIt4ISaWlDfltYd3wH3r', N'673677179@qq.com', N'重置密码', N'2019-04-18 11:47:31.6450000');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [student_info]
-- ----------------------------
DROP TABLE [student_info]
GO
CREATE TABLE [student_info] (
[sno] varchar(255) NOT NULL ,
[email] varchar(255) NULL ,
[college] varchar(255) NULL ,
[create_time] date NULL ,
[creator_name] varchar(255) NULL ,
[grage] varchar(255) NULL ,
[major] varchar(255) NULL ,
[mender_name] varchar(255) NULL ,
[modify_time] date NULL ,
[phone] varchar(255) NULL ,
[sex] varchar(255) NULL ,
[sname] varchar(255) NOT NULL 
)


GO

-- ----------------------------
-- Records of student_info
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [teacher_info]
-- ----------------------------
DROP TABLE [teacher_info]
GO
CREATE TABLE [teacher_info] (
[id] varchar(255) NOT NULL ,
[email] varchar(255) NULL ,
[academic_title] varchar(255) NULL ,
[college] varchar(255) NULL ,
[create_time] date NULL ,
[creator_name] varchar(255) NULL ,
[mender_name] varchar(255) NULL ,
[modify_time] date NULL ,
[phone] varchar(255) NULL ,
[sex] varchar(10) NULL ,
[tname] varchar(255) NOT NULL 
)


GO

-- ----------------------------
-- Records of teacher_info
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [user_info]
-- ----------------------------
DROP TABLE [user_info]
GO
CREATE TABLE [user_info] (
[id] bigint NOT NULL ,
[account] varchar(255) NOT NULL ,
[create_by] varchar(255) NULL ,
[create_date] datetime2(7) NULL ,
[email] varchar(255) NULL ,
[modify_by] varchar(255) NULL ,
[modify_date] datetime2(7) NULL ,
[phone] varchar(255) NULL ,
[pwd] varchar(255) NOT NULL ,
[sex] varchar(255) NULL ,
[user_name] varchar(255) NULL ,
[user_role_id] varchar(3) NULL ,
[last_login] datetime2(7) NULL ,
[status] varchar(255) NULL 
)


GO

-- ----------------------------
-- Records of user_info
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'11', N'root', null, N'2019-04-10 22:34:30.4460000', N'673179@qq.com', N'root', N'2019-04-18 20:21:43.4600000', null, N'cf79ae6addba60ad018347359bd144d2', N'female', N'Admin', null, N'2019-07-03 12:23:28.2120000', N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'52', N'245f4', N'245f4', N'2019-04-16 00:11:50.1700000', N'891289@qq.com', N'root', N'2019-04-27 21:35:42.9960000', N'00', N'cf79ae6addba60ad018347359bd144d2', N'male', N'lyy', null, null, N'Disabled_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'80', N'12323555', N'root', N'2019-04-19 18:32:32.2350000', N'898009@qq.com', N'zhuangjinh', N'2019-04-27 10:49:54.5000000', N'00', N'202cb962ac59075b964b07152d234b70', N'男', N'lyy', null, null, N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'86', N'zhuweida', N'root', N'2019-04-24 14:54:28.5730000', N'77139117@qq.com', N'zhuangjinh', N'2019-04-26 13:24:49.4330000', N'', N'cf79ae6addba60ad018347359bd144d2', N'male', N'朱伟大', null, N'2019-07-01 19:32:06.8660000', N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'88', N'heling', N'root', N'2019-04-24 14:55:26.9810000', N'1095796340@qq.com', N'root', N'2019-04-26 14:15:05.1170000', N'', N'cf79ae6addba60ad018347359bd144d2', N'male', N'贺翎', null, N'2019-04-26 13:37:39.7870000', N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'90', N'zhuangjinh', N'root', N'2019-04-24 14:56:43.3630000', N'jinhui_zjh@qq.com', N'zhuangjinh', N'2019-04-26 13:24:43.5690000', N'', N'cf79ae6addba60ad018347359bd144d2', N'female', N'庄金惠', null, N'2019-06-12 20:08:46.8540000', N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'92', N'180327097', N'zhuweida', N'2019-04-24 15:03:03.4210000', N'180327097@qq.com', N'liuyoyu', N'2019-06-21 10:36:25.7320000', N'', N'cf79ae6addba60ad018347359bd144d2', N'male', N'zwd', null, null, N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'101', N'liuyoyu', N'root', N'2019-04-27 10:40:50.2510000', N'673677179@qq.com', N'root', N'2019-04-27 10:40:50.2510000', N'', N'cf79ae6addba60ad018347359bd144d2', N'male', N'刘永裕', null, N'2019-07-02 21:34:18.1810000', N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'103', N'2222222', N'zhuangjinh', N'2019-04-27 11:06:28.7150000', N'381069@qq.com', N'zhuangjinh', N'2019-05-27 15:46:21.9330000', N'110', N'cf79ae6addba60ad018347359bd144d2', N'male', N'1212', null, null, N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'167', N'11211', N'zhuangjinh', N'2019-05-27 15:43:39.3300000', N'3811069@qq.com', N'root', N'2019-06-22 20:27:37.1580000', N'', N'cf79ae6addba60ad018347359bd144d2', N'male', N'1212', null, null, N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'192', N'lyyyyy', N'root', N'2019-06-03 18:16:46.5970000', N'100010000', null, null, N'100010', N'1c395a8dce135849bd73c6dba3b54809', N'male', N'lyyyyy', null, null, N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'195', N'12121lyy', N'liuyoyu', N'2019-06-07 16:38:38.1820000', N'100010000lyy', N'liuyoyu', N'2019-06-10 15:45:30.3030000', N'100010', N'cf79ae6addba60ad018347359bd144d2', N'male', N'lyyyyy', null, null, N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'201', N'test2', N'liuyoyu', N'2019-06-10 15:31:16.9300000', N'23@test.com', N'liuyoyu', N'2019-06-22 20:15:10.7620000', null, N'cf79ae6addba60ad018347359bd144d2', null, null, null, null, N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'208', N'tests', N'liuyoyu', N'2019-06-10 22:02:12.1920000', N'123456789', null, null, N'110', N'202cb962ac59075b964b07152d234b70', N'male', N'tests', null, null, N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'213', N'testss2', N'testss2', N'2019-06-10 22:11:15.9080000', N'1234562232789', null, null, N'110', N'202cb962ac59075b964b07152d234b70', N'male', N'tests', null, null, N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'215', N'jinhui8', N'jinhui8', N'2019-06-11 14:33:38.1030000', N'11@aa.com', N'liuyoyu', N'2019-07-01 20:15:13.2440000', N'', N'759ed3df3f53757f5196e634995ad417', N'jinhui8', N'jinhui8', null, null, N'Disabled');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'220', N'jinhui0', N'jinhui0', N'2019-06-12 11:03:09.5650000', N'3811@qq.com', null, null, N'', N'759ed3df3f53757f5196e634995ad417', N'jinhui8', N'jinhui8', null, null, N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'222', N'test22', N'test22', N'2019-06-12 19:41:58.8620000', N'381109@qq.com', N'root', N'2019-06-12 20:12:11.5400000', N'', N'759ed3df3f53757f5196e634995ad417', N'male', N'test22', null, null, N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'224', N'test1', N'test1', N'2019-06-12 20:13:32.4920000', N'38110210545@qq.com', N'root', N'2019-06-12 20:29:28.2530000', null, N'137a3a3a7809a828afe701ad71827e81', N'male', N'test1', null, N'2019-06-12 20:29:55.1900000', N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'226', N'test5', N'test5', N'2019-06-12 20:29:33.7800000', N'381110545@qq.com', N'root', N'2019-06-12 20:37:04.7300000', null, N'137a3a3a7809a828afe701ad71827e81', N'male', N'test5', null, null, N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'228', N'test6', N'test6', N'2019-06-12 20:38:04.7150000', N'2313231@test.com', N'liuyoyu', N'2019-06-23 14:35:28.7560000', null, N'332f708b27ba81ac06dc51fc23a99556', null, N'test6', null, null, N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'281', N'test', N'testss23', N'2019-06-30 10:40:34.5210000', N'6@qq.com', null, null, N'110', N'cc03e747a6afbbcbf8be7668acfebee5', N'male', N'test_user', null, N'2019-06-30 11:02:57.5710000', N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'283', N'llsss123', N'llsss123', N'2019-06-30 11:13:56.4570000', N'6@6.com', null, null, N'111', N'cf79ae6addba60ad018347359bd144d2', N'male', N'刘永裕一号', null, N'2019-07-03 23:11:25.4820000', N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'285', N'test11', N'test11', N'2019-06-30 23:06:03.5600000', N'381103069@qq.com', null, null, null, N'137a3a3a7809a828afe701ad71827e81', null, N'test11', null, N'2019-06-30 23:06:38.5520000', N'Normal_SYS');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'294', N'zwd71', N'zwd71', N'2019-07-01 19:20:03.8980000', N'947035195@qq.com', N'root', N'2019-07-01 20:17:36.7840000', null, N'6bd440072f8a7c6fc2a32a604090bec2', N'male', N'zwd71', null, N'2019-07-01 19:39:39.9200000', N'Disabled');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'303', N'123456', N'123456', N'2019-07-01 20:19:31.1850000', N'123456789zwd@qq.com', N'root', N'2019-07-01 20:35:21.2440000', N'', N'6bd440072f8a7c6fc2a32a604090bec2', N'male', N'123456', null, null, N'Normal');
INSERT INTO [user_info] ([id], [account], [create_by], [create_date], [email], [modify_by], [modify_date], [phone], [pwd], [sex], [user_name], [user_role_id], [last_login], [status]) VALUES (N'321', N'zhyuchen', N'zhyuchen', N'2019-07-04 20:27:47.5200000', N'793694162@qq.com', null, null, null, N'5a2d1f7fed6c7773fa0b04852449b6f4', null, N'zhyuchen', null, N'2019-07-04 20:27:59.1660000', N'Normal_SYS');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [user_role]
-- ----------------------------
DROP TABLE [user_role]
GO
CREATE TABLE [user_role] (
[id] bigint NOT NULL ,
[create_by] varchar(255) NULL ,
[create_date] datetime2(7) NULL ,
[is_default] varchar(255) NULL ,
[modify_by] varchar(255) NULL ,
[modify_date] datetime2(7) NULL ,
[role_id] bigint NULL ,
[user_id] bigint NULL 
)


GO

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'12', null, N'2019-04-10 22:34:30.5710000', N'isDefault_SYS', null, null, N'1', N'11');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'53', N'245f4', N'2019-04-16 00:11:50.2170000', N'isDefault_SYS', N'245f4', N'2019-04-16 00:11:50.2170000', N'2', N'52');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'66', N'root', N'2019-04-18 00:51:01.4700000', N'isNotDefault_SYS', null, null, N'2', N'11');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'81', N'root', N'2019-04-19 18:32:32.3220000', N'isDefault_SYS', null, null, N'2', N'80');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'87', N'root', N'2019-04-24 14:54:28.6690000', N'isDefault_SYS', null, null, N'1', N'86');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'89', N'root', N'2019-04-24 14:55:27.1800000', N'isDefault_SYS', null, null, N'1', N'88');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'91', N'root', N'2019-04-24 14:56:43.4020000', N'isDefault_SYS', null, null, N'1', N'90');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'93', N'zhuweida', N'2019-04-24 15:03:03.4870000', N'isDefault_SYS', null, null, N'2', N'92');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'102', N'root', N'2019-04-27 10:40:50.3600000', N'isDefault_SYS', null, null, N'138', N'101');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'104', N'zhuangjinh', N'2019-04-27 11:06:28.7770000', N'isDefault_SYS', null, null, N'2', N'103');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'107', N'root', N'2019-04-27 11:39:46.9920000', N'isNotDefault_SYS', null, null, N'105', N'11');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'168', N'zhuangjinh', N'2019-05-27 15:43:39.7000000', N'isDefault_SYS', null, null, N'138', N'167');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'196', N'liuyoyu', N'2019-06-07 16:38:43.6460000', N'isDefault_SYS', null, null, N'138', N'195');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'202', N'liuyoyu', N'2019-06-10 15:31:16.1260000', N'isDefault_SYS', null, null, N'152', N'201');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'209', N'liuyoyu', N'2019-06-10 22:02:12.2390000', N'isDefault_SYS', null, null, N'138', N'208');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'214', N'testss2', N'2019-06-10 22:11:16.2800000', N'isDefault_SYS', null, null, N'152', N'213');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'216', N'jinhui8', N'2019-06-11 14:33:38.2030000', N'isDefault_SYS', null, null, N'152', N'215');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'221', N'jinhui0', N'2019-06-12 11:03:09.6850000', N'isDefault_SYS', null, null, N'152', N'220');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'223', N'test22', N'2019-06-12 19:41:58.9990000', N'isDefault_SYS', null, null, N'152', N'222');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'225', N'test1', N'2019-06-12 20:13:32.5470000', N'isDefault_SYS', null, null, N'152', N'224');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'227', N'test5', N'2019-06-12 20:29:33.1290000', N'isDefault_SYS', null, null, N'152', N'226');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'229', N'test6', N'2019-06-12 20:38:04.7670000', N'isDefault_SYS', null, null, N'152', N'228');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'282', N'testss23', N'2019-06-30 10:40:34.6530000', N'isDefault_SYS', null, null, N'152', N'281');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'284', N'llsss123', N'2019-06-30 11:13:56.4950000', N'isDefault_SYS', null, null, N'152', N'283');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'286', N'test11', N'2019-06-30 23:06:03.1080000', N'isDefault_SYS', null, null, N'152', N'285');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'295', N'zwd71', N'2019-07-01 19:20:03.9720000', N'isDefault_SYS', null, null, N'152', N'294');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'304', N'123456', N'2019-07-01 20:19:31.1980000', N'isDefault_SYS', null, null, N'152', N'303');
INSERT INTO [user_role] ([id], [create_by], [create_date], [is_default], [modify_by], [modify_date], [role_id], [user_id]) VALUES (N'322', N'zhyuchen', N'2019-07-04 20:27:47.5650000', N'isDefault_SYS', null, null, N'152', N'321');
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Indexes structure for table course
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [course]
-- ----------------------------
ALTER TABLE [course] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table dic_content
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dic_content]
-- ----------------------------
ALTER TABLE [dic_content] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table dictionary
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dictionary]
-- ----------------------------
ALTER TABLE [dictionary] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table menu
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [menu]
-- ----------------------------
ALTER TABLE [menu] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table menu_user_type
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [menu_user_type]
-- ----------------------------
ALTER TABLE [menu_user_type] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table origanization
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [origanization]
-- ----------------------------
ALTER TABLE [origanization] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table role
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [role]
-- ----------------------------
ALTER TABLE [role] ADD PRIMARY KEY ([role_id])
GO

-- ----------------------------
-- Indexes structure for table role_menu
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [role_menu]
-- ----------------------------
ALTER TABLE [role_menu] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table short_message
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [short_message]
-- ----------------------------
ALTER TABLE [short_message] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table student_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [student_info]
-- ----------------------------
ALTER TABLE [student_info] ADD PRIMARY KEY ([sno])
GO

-- ----------------------------
-- Indexes structure for table teacher_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [teacher_info]
-- ----------------------------
ALTER TABLE [teacher_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table user_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [user_info]
-- ----------------------------
ALTER TABLE [user_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table user_role
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [user_role]
-- ----------------------------
ALTER TABLE [user_role] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Foreign Key structure for table [dic_content]
-- ----------------------------
ALTER TABLE [dic_content] ADD FOREIGN KEY ([dictionaryid]) REFERENCES [dictionary] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [menu_user_type]
-- ----------------------------
ALTER TABLE [menu_user_type] ADD FOREIGN KEY ([menuid]) REFERENCES [menu] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [role_menu]
-- ----------------------------
ALTER TABLE [role_menu] ADD FOREIGN KEY ([menu_id]) REFERENCES [menu] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [role_menu] ADD FOREIGN KEY ([role_id]) REFERENCES [role] ([role_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [user_role]
-- ----------------------------
ALTER TABLE [user_role] ADD FOREIGN KEY ([role_id]) REFERENCES [role] ([role_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [user_role] ADD FOREIGN KEY ([user_id]) REFERENCES [user_info] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
