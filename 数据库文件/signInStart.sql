/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2019/6/23 1:26:09                            */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CourseInfo') and o.name = 'FK_COURSEIN_REFERENCE_DEPARTME')
alter table CourseInfo
   drop constraint FK_COURSEIN_REFERENCE_DEPARTME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('StudentCourse') and o.name = 'FK_STUDENTC_REFERENCE_COURSEIN')
alter table StudentCourse
   drop constraint FK_STUDENTC_REFERENCE_COURSEIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('StudentCourse') and o.name = 'FK_STUDENTC_REFERENCE_USERINFO')
alter table StudentCourse
   drop constraint FK_STUDENTC_REFERENCE_USERINFO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UserMenu') and o.name = 'FK_USERMENU_REFERENCE_ROLEINFO')
alter table UserMenu
   drop constraint FK_USERMENU_REFERENCE_ROLEINFO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UserMenu') and o.name = 'FK_USERMENU_REFERENCE_MENU')
alter table UserMenu
   drop constraint FK_USERMENU_REFERENCE_MENU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UserRole') and o.name = 'FK_USERROLE_REFERENCE_ROLEINFO')
alter table UserRole
   drop constraint FK_USERROLE_REFERENCE_ROLEINFO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UserRole') and o.name = 'FK_USERROLE_REFERENCE_USERINFO')
alter table UserRole
   drop constraint FK_USERROLE_REFERENCE_USERINFO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('courseArrange') and o.name = 'FK_COURSEAR_REFERENCE_COURSEIN')
alter table courseArrange
   drop constraint FK_COURSEAR_REFERENCE_COURSEIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('department') and o.name = 'FK_DEPARTME_REFERENCE_INSTITUT')
alter table department
   drop constraint FK_DEPARTME_REFERENCE_INSTITUT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('loginInfo') and o.name = 'FK_LOGININF_REFERENCE_USERINFO')
alter table loginInfo
   drop constraint FK_LOGININF_REFERENCE_USERINFO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('menu') and o.name = 'FK_MENU_REFERENCE_MENU')
alter table menu
   drop constraint FK_MENU_REFERENCE_MENU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"数据字典-内容"') and o.name = 'FK_数据字典-内容_REFERENCE_DICTIONA')
alter table "数据字典-内容"
   drop constraint "FK_数据字典-内容_REFERENCE_DICTIONA"
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CourseInfo')
            and   type = 'U')
   drop table CourseInfo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Dictionary')
            and   type = 'U')
   drop table Dictionary
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Institution')
            and   type = 'U')
   drop table Institution
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RoleInfo')
            and   type = 'U')
   drop table RoleInfo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('StudentCourse')
            and   type = 'U')
   drop table StudentCourse
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UserInfo')
            and   type = 'U')
   drop table UserInfo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UserMenu')
            and   type = 'U')
   drop table UserMenu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UserRole')
            and   type = 'U')
   drop table UserRole
go

if exists (select 1
            from  sysobjects
           where  id = object_id('courseArrange')
            and   type = 'U')
   drop table courseArrange
go

if exists (select 1
            from  sysobjects
           where  id = object_id('department')
            and   type = 'U')
   drop table department
go

if exists (select 1
            from  sysobjects
           where  id = object_id('loginInfo')
            and   type = 'U')
   drop table loginInfo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('menu')
            and   type = 'U')
   drop table menu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"数据字典-内容"')
            and   type = 'U')
   drop table "数据字典-内容"
go

/*==============================================================*/
/* Table: CourseInfo                                            */
/*==============================================================*/
create table CourseInfo (
   CourseId             int                  not null,
   CourseName           nvarchar(256)        null,
   CreateDate           datetime             null,
   CreateBy             nvarchar(64)         null,
   ModifyDate           datetime             null,
   ModifyBy             nvarchar(64)         null,
   constraint PK_COURSEINFO primary key (CourseId)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('CourseInfo') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'CourseInfo' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '课程基本信息', 
   'user', @CurrentUser, 'table', 'CourseInfo'
go

/*==============================================================*/
/* Table: Dictionary                                            */
/*==============================================================*/
create table Dictionary (
   DectionaryId         int                  not null,
   DataType             nvarchar(128)        null,
   DataValue            nvarchar(128)        null,
   DataDesc             text                 null,
   CreateDate           datetime             null,
   CreateBy             nvarchar(64)         null,
   ModifyDate           datetime             null,
   ModifyBy             nvarchar(64)         null,
   DataKey              nvarchar(0)          null,
   constraint PK_DICTIONARY primary key (DectionaryId)
)
go

/*==============================================================*/
/* Table: Institution                                           */
/*==============================================================*/
create table Institution (
   id                   int                  not null,
   name                 nvchar               null,
   location             text                 null,
   master               nvarchar(0)          null,
   createDate           datetime             null,
   createBy             nvarchar(0)          null,
   modifyDate           datetime             null,
   modifyBy             nvarchar(0)          null,
   type                 nvarchar(0)          null,
   constraint PK_INSTITUTION primary key (id)
)
go

/*==============================================================*/
/* Table: RoleInfo                                              */
/*==============================================================*/
create table RoleInfo (
   RoleId               int                  not null,
   RoleName             nvarchar(64)         null,
   CreateDate           datetime             null,
   CreateBy             nvarchar(64)         null,
   ModifyDate           datetime             null,
   ModifyBy             nvarchar(64)         null,
   constraint PK_ROLEINFO primary key (RoleId)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('RoleInfo') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'RoleInfo' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '角色基本信息', 
   'user', @CurrentUser, 'table', 'RoleInfo'
go

/*==============================================================*/
/* Table: StudentCourse                                         */
/*==============================================================*/
create table StudentCourse (
   UserCourseID         int                  not null,
   UserId               int                  null,
   CourseId             int                  null,
   SignInStatus         int                  null,
   CreateDate           datetime             null,
   CreateBy             nvarchar(64)         null,
   ModifyDate           datetime             null,
   ModifyBy             nvarchar(64)         null,
   constraint PK_STUDENTCOURSE primary key (UserCourseID)
)
go

/*==============================================================*/
/* Table: UserInfo                                              */
/*==============================================================*/
create table UserInfo (
   UserId               int                  not null,
   UserName             nvarchar(128)        null,
   UserSex              nvarchar(8)          null,
   UserAccount          nvarchar(64)         null,
   UserEmail            nvarchar(128)        null,
   UserTelephone        nvarchar(16)         null,
   UserCollege          nvarchar(256)        null,
   CreateDate           datetime             null,
   CreateBy             nvarchar(64)         null,
   ModifyDate           datetime             null,
   ModifyBy             nvarchar(64)         null,
   constraint PK_USERINFO primary key (UserId)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('UserInfo') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'UserInfo' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '用户基本信息', 
   'user', @CurrentUser, 'table', 'UserInfo'
go

/*==============================================================*/
/* Table: UserMenu                                              */
/*==============================================================*/
create table UserMenu (
   RoleId               int                  null,
   MenuId               int                  null,
   UserMenuID           int                  null,
   status               nvarchar(0)          null
)
go

/*==============================================================*/
/* Table: UserRole                                              */
/*==============================================================*/
create table UserRole (
   UserRoleId           int                  not null,
   RoleId               int                  null,
   UserId               int                  null,
   CreateDate           datetime             null,
   CreateBy             nvarchar(64)         null,
   ModifyDate           datetime             null,
   ModifyBy             nvarchar(64)         null,
   constraint PK_USERROLE primary key (UserRoleId)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('UserRole') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'UserRole' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '用户 角色', 
   'user', @CurrentUser, 'table', 'UserRole'
go

/*==============================================================*/
/* Table: courseArrange                                         */
/*==============================================================*/
create table courseArrange (
   CreateDate           datetime             null,
   CreateBy             nvarchar(64)         null,
   ModifyDate           datetime             null,
   ModifyBy             nvarchar(64)         null,
   CourseId             int                  null,
   id                   int                  not null,
   courseDesc           text                 null,
   name                 nvarchar(256)        null,
   semester             nvarchar(16)         null,
   classroom            nvarchar(256)        null,
   startSection         int                  null,
   endSection           int                  null,
   startWeek            int                  null,
   endWeek              int                  null,
   constraint PK_COURSEARRANGE primary key (id)
)
go

/*==============================================================*/
/* Table: department                                            */
/*==============================================================*/
create table department (
   id                   int                  null,
   name                 nvarchar(0)          null,
   duty                 nvarchar(0)          null,
   shortName            nvarchar(0)          null,
   squence              int                  null,
   institution          nvarchar(0)          null,
   createDate           datetime             null,
   createBy             nvarchar(0)          null,
   modifyDate           datetime             null,
   modifyBy             nvarchar(0)          null
)
go

/*==============================================================*/
/* Table: loginInfo                                             */
/*==============================================================*/
create table loginInfo (
   UserId               int                  null,
   id                   int                  null,
   account              nvarchar(0)          null,
   loginDate            datetime             null,
   loginWay             nvarchar(0)          null,
   password             nvarchar(0)          null
)
go

/*==============================================================*/
/* Table: menu                                                  */
/*==============================================================*/
create table menu (
   MenuId               int                  not null,
   men_MenuId           int                  null,
   MenuName             nvarchar(256)        null,
   MenuURL              nvarchar(256)        null,
   MenuStatus           nvarchar(16)         null,
   CreateDate           datetime             null,
   CreateBy             nvarchar(64)         null,
   ModifyDate           datetime             null,
   ModifyBy             nvarchar(64)         null,
   Code                 char(10)             null,
   Type                 nvarchar(128)        null,
   sequence             int                  null,
   icon                 nvarchar(0)          null,
   constraint PK_MENU primary key (MenuId)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('menu') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'menu' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '系统菜单权限控制', 
   'user', @CurrentUser, 'table', 'menu'
go

/*==============================================================*/
/* Table: "数据字典-内容"                                             */
/*==============================================================*/
create table "数据字典-内容" (
   DictionaryContentId  int                  not null,
   DectionaryId         int                  null,
   DictionaryContentValue nvarchar(128)        null,
   DictionaryContentText nvarchar(256)        null,
   DictionaryContentStatus int                  null,
   DictionaryContentDesc text                 null,
   CreateDate           datetime             null,
   CreateBy             nvarchar(64)         null,
   ModifyDate           datetime             null,
   ModifyBy             nvarchar(64)         null,
   sequence             int                  null,
   constraint "PK_数据字典-内容" primary key (DictionaryContentId)
)
go

alter table CourseInfo
   add constraint FK_COURSEIN_REFERENCE_DEPARTME foreign key ()
      references department
go

alter table StudentCourse
   add constraint FK_STUDENTC_REFERENCE_COURSEIN foreign key (CourseId)
      references CourseInfo (CourseId)
go

alter table StudentCourse
   add constraint FK_STUDENTC_REFERENCE_USERINFO foreign key (UserId)
      references UserInfo (UserId)
go

alter table UserMenu
   add constraint FK_USERMENU_REFERENCE_ROLEINFO foreign key (RoleId)
      references RoleInfo (RoleId)
go

alter table UserMenu
   add constraint FK_USERMENU_REFERENCE_MENU foreign key (MenuId)
      references menu (MenuId)
go

alter table UserRole
   add constraint FK_USERROLE_REFERENCE_ROLEINFO foreign key (RoleId)
      references RoleInfo (RoleId)
go

alter table UserRole
   add constraint FK_USERROLE_REFERENCE_USERINFO foreign key (UserId)
      references UserInfo (UserId)
go

alter table courseArrange
   add constraint FK_COURSEAR_REFERENCE_COURSEIN foreign key (CourseId)
      references CourseInfo (CourseId)
go

alter table department
   add constraint FK_DEPARTME_REFERENCE_INSTITUT foreign key (id)
      references Institution (id)
go

alter table loginInfo
   add constraint FK_LOGININF_REFERENCE_USERINFO foreign key (UserId)
      references UserInfo (UserId)
go

alter table menu
   add constraint FK_MENU_REFERENCE_MENU foreign key (men_MenuId)
      references menu (MenuId)
go

alter table "数据字典-内容"
   add constraint "FK_数据字典-内容_REFERENCE_DICTIONA" foreign key (DectionaryId)
      references Dictionary (DectionaryId)
go

