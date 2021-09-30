/*
SQLyog Community v8.6 Beta2
MySQL - 5.5.59 : Database - kwswitch
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kwswitch` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `kwswitch`;

/*Table structure for table `cms_category` */

DROP TABLE IF EXISTS `cms_category`;

CREATE TABLE `cms_category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(150) NOT NULL COMMENT '分类名称',
  `description` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `order_num` int(11) DEFAULT NULL COMMENT '分类排序',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `cms_category` */

insert  into `cms_category`(`category_id`,`name`,`description`,`order_num`,`del_flag`) values (1,'通知公告',NULL,1,'0'),(2,'新闻资讯',NULL,2,'0'),(4,'招聘信息',NULL,3,'0');

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

/*Data for the table `gen_table` */

insert  into `gen_table`(`table_id`,`table_name`,`table_comment`,`class_name`,`tpl_category`,`package_name`,`module_name`,`business_name`,`function_name`,`function_author`,`options`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'kw_switch','物联网开关','Switch','crud','com.ruoyi.project.kwswitch','switch','switch','智能开关','kerwincui','{}','admin','2020-04-23 12:29:42','','2020-04-23 15:21:22',NULL);

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */

insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values (1,'1','device_id','设备ID','bigint(20)','Long','deviceId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2020-04-23 12:29:42','','2020-04-23 15:21:22'),(2,'1','device_name','设备名称','varchar(32)','String','deviceName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2020-04-23 12:29:42','','2020-04-23 15:21:22'),(3,'1','monitor_value','监测值','varchar(160)','String','monitorValue','0','0',NULL,'1','1','1',NULL,'EQ','input','',3,'admin','2020-04-23 12:29:42','','2020-04-23 15:21:22'),(4,'1','api_key','APIKEY','varchar(32)','String','apiKey','0','0','1','1','1',NULL,NULL,'EQ','input','',4,'admin','2020-04-23 12:29:42','','2020-04-23 15:21:22'),(5,'1','state','状态','char(1)','String','state','0','0','1','1','1','1','1','EQ','radio','',5,'admin','2020-04-23 12:29:42','','2020-04-23 15:21:22'),(6,'1','sensor_dict_id','传感器','bigint(20)','Long','sensorDictId','0','0','1','1','1','1','1','EQ','select','sensor',6,'admin','2020-04-23 12:29:42','','2020-04-23 15:21:22'),(7,'1','category_dict_id','设备分类','bigint(20)','Long','categoryDictId','0','0','1','1','1','1','1','EQ','select','device_category',7,'admin','2020-04-23 12:29:42','','2020-04-23 15:21:22'),(8,'1','create_time','添加时间','datetime','Date','createTime','0','0','1','1',NULL,NULL,'1','BETWEEN','datetime','',8,'admin','2020-04-23 12:29:42','','2020-04-23 15:21:22'),(9,'1','user_id','用户ID','bigint(20)','Long','userId','0','0','1','1',NULL,NULL,'1','EQ','input','',9,'admin','2020-04-23 12:29:42','','2020-04-23 15:21:22'),(10,'1','user_name','用户昵称','varchar(64)','String','userName','0','0','1','1',NULL,'1','1','LIKE','input','',10,'admin','2020-04-23 12:29:42','','2020-04-23 15:21:22'),(11,'1','remark','设备简介','varchar(255)','String','remark','0','0',NULL,'1','1','1',NULL,'EQ','textarea','',11,'admin','2020-04-23 12:29:42','','2020-04-23 15:21:22'),(12,'1','del_flg','删除标识','char(1)','String','delFlg','0','0','1','1','1',NULL,NULL,'EQ','input','',12,'admin','2020-04-23 12:29:42','','2020-04-23 15:21:22');

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_cron_triggers` */

insert  into `qrtz_cron_triggers`(`sched_name`,`trigger_name`,`trigger_group`,`cron_expression`,`time_zone_id`) values ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','0/10 * * * * ?','Asia/Shanghai'),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','0/15 * * * * ?','Asia/Shanghai'),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','0/20 * * * * ?','Asia/Shanghai');

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_job_details` */

insert  into `qrtz_job_details`(`sched_name`,`job_name`,`job_group`,`description`,`job_class_name`,`is_durable`,`is_nonconcurrent`,`is_update_data`,`requests_recovery`,`job_data`) values ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT',NULL,'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution','0','1','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0\'com.ruoyi.project.monitor.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0)com.ruoyi.framework.web.domain.BaseEntity\0\0\0\0\0\0\0\0\nL\0	beginTimeq\0~\0	L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0	dataScopeq\0~\0	L\0endTimeq\0~\0	L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xppt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0b,�)�xpppt\0\0pppt\01t\00/10 * * * * ?t\0ryTask.ryNoParamst\0DEFAULTsr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0系统默认（无参）t\03t\01x\0'),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT',NULL,'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution','0','1','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0\'com.ruoyi.project.monitor.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0)com.ruoyi.framework.web.domain.BaseEntity\0\0\0\0\0\0\0\0\nL\0	beginTimeq\0~\0	L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0	dataScopeq\0~\0	L\0endTimeq\0~\0	L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xppt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0b,�)�xpppt\0\0pppt\01t\00/15 * * * * ?t\0ryTask.ryParams(\'ry\')t\0DEFAULTsr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0系统默认（有参）t\03t\01x\0'),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT',NULL,'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution','0','1','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0\'com.ruoyi.project.monitor.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0)com.ruoyi.framework.web.domain.BaseEntity\0\0\0\0\0\0\0\0\nL\0	beginTimeq\0~\0	L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0	dataScopeq\0~\0	L\0endTimeq\0~\0	L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xppt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0b,�)�xpppt\0\0pppt\01t\00/20 * * * * ?t\08ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)t\0DEFAULTsr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0系统默认（多参）t\03t\01x\0');

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`sched_name`,`lock_name`) values ('RuoyiScheduler','STATE_ACCESS'),('RuoyiScheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`sched_name`,`instance_name`,`last_checkin_time`,`checkin_interval`) values ('RuoyiScheduler','WIN-KKFPM1D249P1633025058188',1633025985462,15000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_triggers` */

insert  into `qrtz_triggers`(`sched_name`,`trigger_name`,`trigger_group`,`job_name`,`job_group`,`description`,`next_fire_time`,`prev_fire_time`,`priority`,`trigger_state`,`trigger_type`,`start_time`,`end_time`,`calendar_name`,`misfire_instr`,`job_data`) values ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','TASK_CLASS_NAME1','DEFAULT',NULL,1633025060000,-1,5,'PAUSED','CRON',1633025059000,0,NULL,2,''),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','TASK_CLASS_NAME2','DEFAULT',NULL,1633025070000,-1,5,'PAUSED','CRON',1633025059000,0,NULL,2,''),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','TASK_CLASS_NAME3','DEFAULT',NULL,1633025060000,-1,5,'PAUSED','CRON',1633025059000,0,NULL,2,'');

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','深色主题theme-dark，浅色主题theme-light');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00'),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00');

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,1,'男','0','sys_user_sex','','','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','关闭状态'),(18,1,'新增','1','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','新增操作'),(19,2,'修改','2','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','修改操作'),(20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','删除操作'),(21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','授权操作'),(22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','导出操作'),(23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','导入操作'),(24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','强退操作'),(25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','生成操作'),(26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','清空操作'),(27,1,'成功','0','sys_common_status','','primary','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','正常状态'),(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','停用状态'),(100,1,'单路继电器','single_switch','device_category',NULL,NULL,'Y','0','admin','2020-04-23 12:43:03','admin','2020-04-23 12:43:25',NULL),(101,2,'双路继电器','double_switch','device_category',NULL,NULL,'N','0','admin','2020-04-23 12:43:18','',NULL,NULL),(102,1,'温湿度传感器','temperature','sensor',NULL,NULL,'Y','0','admin','2020-04-23 12:47:38','',NULL,NULL),(103,2,'土壤湿度传感器','soil','sensor',NULL,'','N','0','admin','2020-04-23 12:47:38','',NULL,NULL),(104,1,'在线','1','switch_state',NULL,'','N','0','admin','2020-04-23 12:47:38','',NULL,NULL),(105,2,'离线','0','switch_state',NULL,'','Y','0','admin','2020-04-23 12:47:38','',NULL,NULL);

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'用户性别','sys_user_sex','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','登录状态列表'),(100,'设备分类','device_category','0','admin','2020-04-23 12:40:17','',NULL,'设备分类列表'),(101,'传感器类型','sensor','0','admin','2020-04-23 12:46:19','',NULL,'传感器列表'),(102,'开关状态','switch_state','0','admin','2020-04-29 00:31:22','','2020-04-29 00:31:29','开关状态列表');

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

/*Data for the table `sys_job` */

insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`invoke_target`,`cron_expression`,`misfire_policy`,`concurrent`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','');

/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

/*Data for the table `sys_job_log` */

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=438 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`user_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values (100,'admin','192.168.40.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-23 08:59:38'),(101,'admin','192.168.40.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-23 12:28:46'),(102,'admin','192.168.40.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-23 14:53:46'),(103,'admin','192.168.40.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-24 17:11:08'),(104,'admin','192.168.40.1','内网IP','Chrome','Windows 10','1','验证码错误','2020-04-24 17:39:22'),(105,'admin','192.168.40.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-24 17:39:27'),(106,'admin','192.168.40.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-25 04:01:56'),(107,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-27 07:40:32'),(108,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2020-04-27 07:40:52'),(109,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-27 07:41:07'),(110,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','退出成功','2020-04-27 07:46:14'),(111,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-27 07:46:24'),(112,'admin','127.0.0.1','内网IP','Chrome','Windows 10','1','验证码已失效','2020-04-27 14:48:54'),(113,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-27 14:49:01'),(114,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-27 15:42:56'),(115,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-28 11:33:43'),(116,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-28 21:15:55'),(117,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-29 05:52:02'),(118,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-29 07:05:37'),(119,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-29 07:05:37'),(120,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-29 08:35:41'),(121,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-29 09:18:14'),(122,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-29 12:11:40'),(123,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-29 15:53:58'),(124,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-30 01:39:40'),(125,'admin','127.0.0.1','内网IP','Chrome','Windows 10','0','登录成功','2020-04-30 03:06:39'),(126,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','登录成功','2020-05-05 16:31:33'),(127,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','退出成功','2020-05-05 16:31:44'),(128,'admin','192.168.0.107','内网IP','Chrome 8','Windows 10','0','登录成功','2020-05-06 12:52:20'),(129,'admin','192.168.0.107','内网IP','Chrome 8','Windows 10','1','用户不存在/密码错误','2020-05-06 17:05:25'),(130,'老家了','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 02:00:09'),(131,'好了','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 02:00:37'),(132,'老家了','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 02:03:26'),(133,'老家了','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 02:54:31'),(134,'哈哈','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 02:56:09'),(135,'图解','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 02:58:26'),(136,'看看','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 03:18:34'),(137,'老家了','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 03:22:55'),(138,'裤腿裤','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 03:23:21'),(139,'啦啦啦啦','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 03:24:28'),(140,'来昆明','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 03:25:01'),(141,'老家了','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 03:25:20'),(142,'老家了','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 03:26:55'),(143,'交接了吗','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 03:28:05'),(144,'考虑','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 03:29:03'),(145,'距离','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 03:33:34'),(146,'啦啦啦啦','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 03:34:02'),(147,'看看','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 03:35:57'),(148,'距离','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 03:36:55'),(149,'兔兔','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 04:18:18'),(150,'具体','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 04:25:11'),(151,'啦啦啦啦','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 04:26:41'),(152,'来昆明','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 04:28:57'),(153,'老家了','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 04:31:10'),(154,'老家了','192.168.0.105','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2020-05-07 04:31:29'),(155,'老家了','192.168.0.105','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2020-05-07 04:37:41'),(156,'admin','192.168.0.105','内网IP','Unknown','Unknown','1','验证码已失效','2020-05-07 04:37:53'),(157,'admin','192.168.0.105','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2020-05-07 04:38:05'),(158,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 04:38:36'),(159,'admin','192.168.0.105','内网IP','Unknown','Unknown','1','验证码已失效','2020-05-07 04:38:43'),(160,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 04:48:16'),(161,'admin','192.168.0.105','内网IP','Unknown','Unknown','1','验证码已失效','2020-05-07 04:48:18'),(162,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 04:48:44'),(163,'admin','192.168.0.105','内网IP','Unknown','Unknown','1','验证码已失效','2020-05-07 04:48:45'),(164,'admin','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 05:28:52'),(165,'admin','192.168.0.105','内网IP','Unknown','Unknown','1','验证码已失效','2020-05-07 05:28:59'),(166,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 05:29:11'),(167,'admin','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 05:31:47'),(168,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 05:32:02'),(169,'admin','192.168.0.107','内网IP','Chrome 8','Windows 10','1','用户不存在/密码错误','2020-05-07 05:44:10'),(170,'admin','192.168.0.107','内网IP','Chrome 8','Windows 10','0','登录成功','2020-05-07 05:44:24'),(171,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 06:11:48'),(172,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 06:13:01'),(173,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 06:25:13'),(174,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 06:40:29'),(175,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 06:40:55'),(176,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 06:41:41'),(177,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 06:44:26'),(178,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 07:45:15'),(179,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 07:50:44'),(180,'admin','192.168.0.107','内网IP','Chrome 8','Windows 10','0','登录成功','2020-05-07 08:25:40'),(181,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 08:26:20'),(182,'admin','192.168.0.105','内网IP','Unknown','Unknown','1','验证码错误','2020-05-07 08:26:32'),(183,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 08:26:46'),(184,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 08:27:14'),(185,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 08:29:17'),(186,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 08:30:32'),(187,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 08:31:01'),(188,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 08:32:32'),(189,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 08:32:52'),(190,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 08:34:00'),(191,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 08:36:31'),(192,'admin','192.168.0.105','内网IP','Unknown','Unknown','1','验证码已失效','2020-05-07 08:36:33'),(193,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 08:36:47'),(194,'admin','192.168.0.105','内网IP','Unknown','Unknown','1','验证码已失效','2020-05-07 08:36:54'),(195,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 08:37:04'),(196,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 08:43:07'),(197,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 08:45:01'),(198,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 08:46:08'),(199,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 09:14:53'),(200,'admin','192.168.0.107','内网IP','Chrome 8','Windows 10','0','登录成功','2020-05-07 09:46:52'),(201,'admin','192.168.0.107','内网IP','Chrome 8','Windows 10','0','登录成功','2020-05-07 10:53:38'),(202,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 10:58:26'),(203,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 11:09:10'),(204,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 11:48:16'),(205,'admin','192.168.0.107','内网IP','Chrome 8','Windows 10','0','登录成功','2020-05-07 12:51:55'),(206,'admin','192.168.0.105','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 13:01:33'),(207,'admin','192.168.0.106','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 13:35:19'),(208,'admin','192.168.0.107','内网IP','Chrome 8','Windows 10','0','登录成功','2020-05-07 13:39:00'),(209,'admin','192.168.0.106','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 13:40:04'),(210,'admin','192.168.0.106','内网IP','Unknown','Unknown','1','验证码已失效','2020-05-07 13:40:07'),(211,'admin','192.168.0.106','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 13:40:25'),(212,'admin','192.168.0.106','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 13:40:45'),(213,'admin','192.168.0.106','内网IP','Unknown','Unknown','0','登录成功','2020-05-07 13:46:20'),(214,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','登录成功','2020-05-13 08:13:08'),(215,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','登录成功','2020-05-13 08:56:56'),(216,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','退出成功','2020-05-13 09:08:55'),(217,'admin','117.136.72.71','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-16 16:44:50'),(218,'admin','117.136.72.71','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-16 17:05:39'),(219,'admin','117.136.72.71','XX XX','Unknown','Unknown','0','登录成功','2020-05-16 17:12:23'),(220,'admin','117.136.72.71','XX XX','Unknown','Unknown','0','登录成功','2020-05-16 17:24:22'),(221,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-16 18:37:19'),(222,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-17 03:30:42'),(223,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-17 04:51:23'),(224,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-17 06:47:36'),(225,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-17 12:19:17'),(226,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-17 15:35:30'),(227,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-17 15:40:28'),(228,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-17 15:46:49'),(229,'admin','39.130.57.52','XX XX','Unknown','Unknown','1','验证码已失效','2020-05-17 15:52:20'),(230,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-17 15:52:31'),(231,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-17 16:30:01'),(232,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-17 16:52:47'),(233,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','登录成功','2020-05-18 01:37:43'),(234,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-18 02:00:44'),(235,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 02:08:24'),(236,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-18 02:58:39'),(237,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 03:00:32'),(238,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 03:06:35'),(239,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 03:55:48'),(240,'admin','39.130.57.52','XX XX','Unknown','Unknown','1','验证码已失效','2020-05-18 03:55:56'),(241,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 04:09:28'),(242,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 04:29:37'),(243,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 04:30:16'),(244,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 04:31:05'),(245,'admin','39.130.57.52','XX XX','Unknown','Unknown','1','验证码已失效','2020-05-18 04:31:15'),(246,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 04:31:25'),(247,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 04:32:11'),(248,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 04:40:30'),(249,'admin','39.130.57.52','XX XX','Unknown','Unknown','1','验证码已失效','2020-05-18 04:40:40'),(250,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 04:40:52'),(251,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 05:01:17'),(252,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 05:02:51'),(253,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-18 05:07:57'),(254,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 05:08:28'),(255,'admin','94.190.208.72','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-18 07:14:17'),(256,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 07:14:48'),(257,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 07:54:41'),(258,'admin','39.130.57.52','XX XX','Chrome Mobile','Android 1.x','0','登录成功','2020-05-18 07:58:44'),(259,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-18 09:31:03'),(260,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','退出成功','2020-05-18 09:32:43'),(261,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','1','用户不存在/密码错误','2020-05-18 09:32:53'),(262,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','1','验证码错误','2020-05-18 09:33:03'),(263,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-18 09:33:11'),(264,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','1','验证码错误','2020-05-18 09:33:24'),(265,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-18 09:33:35'),(266,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','1','用户不存在/密码错误','2020-05-18 11:03:18'),(267,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','1','用户不存在/密码错误','2020-05-18 11:03:25'),(268,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-18 11:03:37'),(269,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-18 12:25:50'),(270,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-18 13:17:13'),(271,'admin','39.130.57.52','XX XX','Unknown','Unknown','1','用户不存在/密码错误','2020-05-18 13:39:55'),(272,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 13:40:12'),(273,'admin','39.130.57.52','XX XX','Unknown','Unknown','1','验证码已失效','2020-05-18 13:40:26'),(274,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 13:40:49'),(275,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 14:14:08'),(276,'admin','39.130.57.52','XX XX','Unknown','Unknown','1','验证码已失效','2020-05-18 14:14:09'),(277,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 15:52:20'),(278,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-18 18:07:20'),(279,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 02:34:53'),(280,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 02:56:17'),(281,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-19 06:23:00'),(282,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 06:49:28'),(283,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 08:08:42'),(284,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-19 08:17:21'),(285,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 09:15:38'),(286,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 09:16:38'),(287,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','1','验证码错误','2020-05-19 09:18:14'),(288,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-19 09:18:23'),(289,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 09:39:38'),(290,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 09:47:39'),(291,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 09:49:13'),(292,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 09:49:36'),(293,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 09:50:54'),(294,'admin','39.130.57.52','XX XX','Unknown','Unknown','1','验证码已失效','2020-05-19 09:51:10'),(295,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 09:51:23'),(296,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-19 09:52:29'),(297,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 10:11:02'),(298,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 10:11:29'),(299,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 10:13:34'),(300,'admin','39.130.57.52','XX XX','Unknown','Unknown','1','验证码已失效','2020-05-19 10:13:52'),(301,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 10:13:56'),(302,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 10:14:41'),(303,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 10:20:08'),(304,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 10:22:17'),(305,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 10:23:18'),(306,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 10:25:41'),(307,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 10:28:47'),(308,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 10:30:21'),(309,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-19 14:35:19'),(310,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 18:55:51'),(311,'admin','94.190.208.72','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 19:51:25'),(312,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-19 22:42:37'),(313,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-20 07:46:33'),(314,'admin','39.130.57.52','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-20 14:51:16'),(315,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-20 15:09:29'),(316,'admin','39.130.57.52','XX XX','Unknown','Unknown','0','登录成功','2020-05-20 18:27:48'),(317,'admin','39.130.57.124','XX XX','Unknown','Unknown','0','登录成功','2020-05-21 17:59:41'),(318,'admin','39.130.57.124','XX XX','Unknown','Unknown','0','登录成功','2020-05-21 18:41:29'),(319,'admin','117.136.72.71','XX XX','Unknown','Unknown','0','登录成功','2020-05-22 17:52:51'),(320,'admin','39.130.57.124','XX XX','Unknown','Unknown','0','登录成功','2020-05-22 17:57:34'),(321,'admin','39.130.57.124','XX XX','Unknown','Unknown','0','登录成功','2020-05-22 19:54:44'),(322,'admin','39.130.57.124','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-23 04:54:33'),(323,'admin','94.190.208.72','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-23 06:57:46'),(324,'admin','39.130.57.124','XX XX','Unknown','Unknown','0','登录成功','2020-05-23 16:35:51'),(325,'admin','39.130.57.124','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-24 07:20:47'),(326,'admin','39.130.57.124','XX XX','Unknown','Unknown','0','登录成功','2020-05-24 07:22:47'),(327,'admin','39.130.57.124','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-24 08:25:24'),(328,'admin','39.130.57.124','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-24 09:13:45'),(329,'admin','39.130.57.124','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-24 09:14:00'),(330,'admin','39.130.57.124','XX XX','Unknown','Unknown','0','登录成功','2020-05-24 12:32:04'),(331,'admin','39.130.57.124','XX XX','Unknown','Unknown','1','验证码已失效','2020-05-24 12:32:07'),(332,'admin','39.130.57.124','XX XX','Unknown','Unknown','0','登录成功','2020-05-24 12:48:26'),(333,'admin','39.130.57.124','XX XX','Unknown','Unknown','0','登录成功','2020-05-24 17:27:43'),(334,'admin','117.136.72.71','XX XX','Unknown','Unknown','0','登录成功','2020-05-25 19:25:37'),(335,'admin','117.136.72.71','XX XX','Unknown','Unknown','0','登录成功','2020-05-28 11:09:34'),(336,'admin','39.130.57.155','XX XX','Chrome 8','Windows 10','0','登录成功','2020-05-30 02:54:41'),(337,'admin','117.136.85.158','XX XX','Chrome Mobile','Android 1.x','0','登录成功','2020-06-04 14:31:26'),(338,'admin','182.242.73.170','XX XX','Chrome 8','Windows 10','1','用户不存在/密码错误','2020-06-16 07:50:04'),(339,'admin','182.242.73.170','XX XX','Chrome 8','Windows 10','1','用户不存在/密码错误','2020-06-16 07:50:19'),(340,'admin','182.242.73.170','XX XX','Chrome 8','Windows 10','0','登录成功','2020-06-16 07:50:34'),(341,'admin','182.242.73.170','XX XX','Chrome 8','Windows 10','0','退出成功','2020-06-16 07:57:01'),(342,'admin','182.242.73.170','XX XX','Chrome 8','Windows 10','0','登录成功','2020-06-16 07:57:16'),(343,'admin','182.242.73.170','XX XX','Chrome 8','Windows 10','1','用户不存在/密码错误','2020-06-17 01:54:49'),(344,'admin','182.242.73.170','XX XX','Chrome 8','Windows 10','0','登录成功','2020-06-17 01:55:00'),(345,'admin','116.249.209.67','XX XX','Chrome 8','Windows 10','0','登录成功','2020-06-19 06:31:24'),(346,'admin','116.52.81.62','XX XX','Chrome 8','Windows 10','1','验证码错误','2020-07-08 05:07:47'),(347,'admin','116.52.81.62','XX XX','Chrome 8','Windows 10','1','用户不存在/密码错误','2020-07-08 05:07:54'),(348,'admin','116.52.81.62','XX XX','Chrome 8','Windows 10','0','登录成功','2020-07-08 05:08:04'),(349,'admin','116.52.81.62','XX XX','Chrome 8','Windows 10','1','验证码错误','2020-07-08 05:08:08'),(350,'admin','121.32.126.234','XX XX','Unknown','Unknown','1','用户不存在/密码错误','2020-07-09 06:07:40'),(351,'admin','121.32.126.234','XX XX','Unknown','Unknown','1','验证码已失效','2020-07-09 06:07:53'),(352,'admin','121.32.126.234','XX XX','Unknown','Unknown','1','用户不存在/密码错误','2020-07-09 06:08:04'),(353,'admin','121.32.126.234','XX XX','Unknown','Unknown','1','验证码已失效','2020-07-09 06:08:13'),(354,'admin','121.32.126.234','XX XX','Unknown','Unknown','1','用户不存在/密码错误','2020-07-09 06:08:23'),(355,'admin','121.32.126.234','XX XX','Unknown','Unknown','1','验证码已失效','2020-07-09 06:08:30'),(356,'admin','121.32.126.234','XX XX','Unknown','Unknown','1','用户不存在/密码错误','2020-07-09 06:08:45'),(357,'admin','39.130.57.39','XX XX','Unknown','Unknown','0','登录成功','2020-07-13 12:30:39'),(358,'https://github.com/Kevincoooool/KSTC_V1','117.136.86.103','XX XX','Unknown','Unknown','1','验证码错误','2020-07-23 15:50:01'),(359,'https://github.com/Kevincoooool/KSTC_V1','117.136.86.103','XX XX','Unknown','Unknown','1','验证码已失效','2020-07-23 15:50:10'),(360,'https://github.com/Kevincoooool/KSTC_V1','117.136.86.103','XX XX','Unknown','Unknown','1','用户不存在/密码错误','2020-07-23 15:50:21'),(361,'admin','39.130.57.241','XX XX','Unknown','Unknown','0','登录成功','2020-07-26 16:00:21'),(362,'admin','116.52.38.21','XX XX','Chrome 8','Windows 10','1','用户不存在/密码错误','2020-07-29 09:51:42'),(363,'admin','116.52.38.21','XX XX','Chrome 8','Windows 10','1','用户不存在/密码错误','2020-07-29 09:51:48'),(364,'admin','116.52.38.21','XX XX','Chrome 8','Windows 10','0','登录成功','2020-07-29 09:52:01'),(365,'122','124.160.213.53','XX XX','Unknown','Unknown','1','验证码已失效','2020-08-10 06:49:48'),(366,'122','124.160.213.53','XX XX','Unknown','Unknown','1','验证码已失效','2020-08-10 06:49:50'),(367,'122','124.160.213.53','XX XX','Unknown','Unknown','1','用户不存在/密码错误','2020-08-10 06:50:02'),(368,'username','124.160.213.53','XX XX','Unknown','Unknown','1','验证码已失效','2020-08-10 06:53:37'),(369,'username','124.160.213.53','XX XX','Unknown','Unknown','1','用户不存在/密码错误','2020-08-10 06:53:53'),(370,'username','124.160.213.53','XX XX','Unknown','Unknown','1','验证码已失效','2020-08-10 06:53:54'),(371,'username','124.160.213.53','XX XX','Unknown','Unknown','1','验证码已失效','2020-08-10 06:53:54'),(372,'username','124.160.213.53','XX XX','Unknown','Unknown','1','验证码已失效','2020-08-10 06:53:54'),(373,'root','220.191.52.164','XX XX','Unknown','Unknown','1','用户不存在/密码错误','2020-08-13 16:26:40'),(374,'root','220.191.52.164','XX XX','Unknown','Unknown','1','验证码已失效','2020-08-13 16:26:42'),(375,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-02 13:13:19'),(376,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-02 14:36:26'),(377,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','1','用户不存在/密码错误','2020-09-03 02:36:34'),(378,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','登录成功','2020-09-03 02:36:53'),(379,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','退出成功','2020-09-03 02:37:06'),(380,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','登录成功','2020-09-03 02:37:13'),(381,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','退出成功','2020-09-03 02:47:18'),(382,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','1','验证码已失效','2020-09-03 02:50:46'),(383,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','1','验证码已失效','2020-09-03 02:52:11'),(384,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','1','验证码已失效','2020-09-03 02:53:16'),(385,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','登录成功','2020-09-03 02:53:24'),(386,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','退出成功','2020-09-03 02:57:01'),(387,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','登录成功','2020-09-03 02:57:09'),(388,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','退出成功','2020-09-03 03:12:44'),(389,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','登录成功','2020-09-03 03:12:54'),(390,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','登录成功','2020-09-03 14:03:02'),(391,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-03 14:05:15'),(392,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-03 14:06:20'),(393,'admin','39.130.57.36','XX XX','Unknown','Unknown','1','验证码已失效','2020-09-03 14:06:26'),(394,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-03 14:06:37'),(395,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-03 14:28:11'),(396,'admin','39.130.57.36','XX XX','Chrome 8','Windows 10','1','用户不存在/密码错误','2020-09-03 14:29:42'),(397,'admin','39.130.57.36','XX XX','Chrome 8','Windows 10','0','登录成功','2020-09-03 14:29:56'),(398,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','1','验证码错误','2020-09-03 15:02:50'),(399,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','1','验证码错误','2020-09-03 15:03:13'),(400,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','1','验证码错误','2020-09-03 15:03:53'),(401,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','1','验证码错误','2020-09-03 15:05:06'),(402,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','登录成功','2020-09-03 15:06:36'),(403,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','退出成功','2020-09-03 15:06:42'),(404,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','登录成功','2020-09-03 15:06:51'),(405,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','退出成功','2020-09-03 15:06:56'),(406,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','1','验证码错误','2020-09-03 15:07:00'),(407,'admin','127.0.0.1','内网IP','Chrome 8','Windows 10','0','登录成功','2020-09-03 15:07:06'),(408,'admin','39.130.57.36','XX XX','Chrome 8','Windows 10','1','用户不存在/密码错误','2020-09-03 15:16:00'),(409,'admin','39.130.57.36','XX XX','Chrome 8','Windows 10','0','登录成功','2020-09-03 15:16:08'),(410,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-03 15:50:04'),(411,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-03 15:50:28'),(412,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-03 15:50:35'),(413,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-03 16:08:25'),(414,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-03 17:02:59'),(415,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-03 18:23:18'),(416,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-03 19:45:29'),(417,'admin','116.249.209.89','XX XX','Chrome Mobile','Android 5.x','0','登录成功','2020-09-04 02:06:54'),(418,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-04 10:17:37'),(419,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-04 15:35:09'),(420,'admin','39.130.57.36','XX XX','Unknown','Unknown','0','登录成功','2020-09-04 16:04:29'),(421,'admin','39.130.57.36','XX XX','Chrome 8','Windows 10','1','用户不存在/密码错误','2020-09-05 02:26:08'),(422,'admin','39.130.57.36','XX XX','Chrome 8','Windows 10','0','登录成功','2020-09-05 02:26:25'),(423,'admin','39.130.57.36','XX XX','Chrome 8','Windows 10','0','退出成功','2020-09-05 02:27:08'),(424,'admin','39.130.57.36','XX XX','Chrome 8','Windows 10','0','登录成功','2020-09-05 02:27:17'),(425,'admin','127.0.0.1','内网IP','Chrome 47','Windows 7','0','登录成功','2021-05-16 22:33:01'),(426,'admin','127.0.0.1','内网IP','Chrome 47','Windows 7','0','登录成功','2021-05-16 22:33:39'),(427,'admin','127.0.0.1','内网IP','Chrome 47','Windows 7','0','登录成功','2021-05-16 22:34:20'),(428,'admin','127.0.0.1','内网IP','Chrome 47','Windows 7','0','登录成功','2021-05-16 22:36:25'),(429,'admin','127.0.0.1','内网IP','Chrome 47','Windows 7','0','登录成功','2021-05-16 22:38:39'),(430,'admin','127.0.0.1','内网IP','Chrome 47','Windows 7','0','登录成功','2021-05-16 22:40:29'),(431,'admin','127.0.0.1','内网IP','Chrome 47','Windows 7','0','登录成功','2021-05-16 22:41:05'),(432,'admin','127.0.0.1','内网IP','Chrome 47','Windows 7','0','登录成功','2021-05-16 22:43:22'),(433,'admin','127.0.0.1','内网IP','Chrome 47','Windows 7','0','登录成功','2021-05-16 22:44:51'),(434,'admin','127.0.0.1','内网IP','Chrome 47','Windows 7','0','登录成功','2021-05-16 22:53:27'),(435,'admin','127.0.0.1','内网IP','Chrome 9','Windows 7','0','登录成功','2021-10-01 02:05:55'),(436,'admin','127.0.0.1','内网IP','Chrome 9','Windows 7','0','退出成功','2021-10-01 02:15:15'),(437,'admin','127.0.0.1','内网IP','Chrome 9','Windows 7','1','用户不存在/密码错误','2021-10-01 02:15:39');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) NOT NULL COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2007 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`is_frame`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'系统管理',0,1,'system',NULL,1,'M','0','0','','system','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,1,'M','0','0','','monitor','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统监控目录'),(3,'系统工具',0,3,'tool',NULL,1,'M','0','0','','tool','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统工具目录'),(4,'KWSWITCH',0,4,'#',NULL,0,'M','0','1','','guide','admin','2018-03-16 11:33:00','admin','2020-04-27 07:49:27','若依官网地址'),(100,'用户管理',1,1,'user','system/user/index',1,'C','0','0','system:user:list','user','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index',1,'C','0','0','system:role:list','peoples','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index',1,'C','0','0','system:menu:list','tree-table','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index',1,'C','0','0','system:dept:list','tree','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index',1,'C','0','0','system:post:list','post','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index',1,'C','0','0','system:dict:list','dict','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index',1,'C','0','0','system:config:list','edit','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index',1,'C','0','0','system:notice:list','message','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','通知公告菜单'),(108,'日志管理',1,9,'log','system/log/index',1,'M','0','0','','log','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index',1,'C','0','0','monitor:online:list','online','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index',1,'C','0','0','monitor:job:list','job','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index',1,'C','0','0','monitor:druid:list','druid','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index',1,'C','0','0','monitor:server:list','server','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','服务监控菜单'),(113,'表单构建',3,1,'build','tool/build/index',1,'C','0','0','tool:build:list','build','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','表单构建菜单'),(114,'代码生成',3,2,'gen','tool/gen/index',1,'C','0','0','tool:gen:list','code','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','代码生成菜单'),(115,'系统接口',3,3,'swagger','tool/swagger/index',1,'C','0','0','tool:swagger:list','swagger','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index',1,'C','0','0','monitor:operlog:list','form','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index',1,'C','0','0','monitor:logininfor:list','logininfor','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','登录日志菜单'),(1001,'用户查询',100,1,'','',1,'F','0','0','system:user:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1002,'用户新增',100,2,'','',1,'F','0','0','system:user:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1003,'用户修改',100,3,'','',1,'F','0','0','system:user:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1004,'用户删除',100,4,'','',1,'F','0','0','system:user:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1005,'用户导出',100,5,'','',1,'F','0','0','system:user:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1006,'用户导入',100,6,'','',1,'F','0','0','system:user:import','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1007,'重置密码',100,7,'','',1,'F','0','0','system:user:resetPwd','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1008,'角色查询',101,1,'','',1,'F','0','0','system:role:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1009,'角色新增',101,2,'','',1,'F','0','0','system:role:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1010,'角色修改',101,3,'','',1,'F','0','0','system:role:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1011,'角色删除',101,4,'','',1,'F','0','0','system:role:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1012,'角色导出',101,5,'','',1,'F','0','0','system:role:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1013,'菜单查询',102,1,'','',1,'F','0','0','system:menu:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1014,'菜单新增',102,2,'','',1,'F','0','0','system:menu:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1015,'菜单修改',102,3,'','',1,'F','0','0','system:menu:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1016,'菜单删除',102,4,'','',1,'F','0','0','system:menu:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1017,'部门查询',103,1,'','',1,'F','0','0','system:dept:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1018,'部门新增',103,2,'','',1,'F','0','0','system:dept:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1019,'部门修改',103,3,'','',1,'F','0','0','system:dept:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1020,'部门删除',103,4,'','',1,'F','0','0','system:dept:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1021,'岗位查询',104,1,'','',1,'F','0','0','system:post:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1022,'岗位新增',104,2,'','',1,'F','0','0','system:post:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1023,'岗位修改',104,3,'','',1,'F','0','0','system:post:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1024,'岗位删除',104,4,'','',1,'F','0','0','system:post:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1025,'岗位导出',104,5,'','',1,'F','0','0','system:post:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1026,'字典查询',105,1,'#','',1,'F','0','0','system:dict:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1027,'字典新增',105,2,'#','',1,'F','0','0','system:dict:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1028,'字典修改',105,3,'#','',1,'F','0','0','system:dict:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1029,'字典删除',105,4,'#','',1,'F','0','0','system:dict:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1030,'字典导出',105,5,'#','',1,'F','0','0','system:dict:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1031,'参数查询',106,1,'#','',1,'F','0','0','system:config:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1032,'参数新增',106,2,'#','',1,'F','0','0','system:config:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1033,'参数修改',106,3,'#','',1,'F','0','0','system:config:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1034,'参数删除',106,4,'#','',1,'F','0','0','system:config:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1035,'参数导出',106,5,'#','',1,'F','0','0','system:config:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1036,'公告查询',107,1,'#','',1,'F','0','0','system:notice:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1037,'公告新增',107,2,'#','',1,'F','0','0','system:notice:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1038,'公告修改',107,3,'#','',1,'F','0','0','system:notice:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1039,'公告删除',107,4,'#','',1,'F','0','0','system:notice:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1040,'操作查询',500,1,'#','',1,'F','0','0','monitor:operlog:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1041,'操作删除',500,2,'#','',1,'F','0','0','monitor:operlog:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1042,'日志导出',500,4,'#','',1,'F','0','0','monitor:operlog:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1043,'登录查询',501,1,'#','',1,'F','0','0','monitor:logininfor:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1044,'登录删除',501,2,'#','',1,'F','0','0','monitor:logininfor:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1045,'日志导出',501,3,'#','',1,'F','0','0','monitor:logininfor:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1046,'在线查询',109,1,'#','',1,'F','0','0','monitor:online:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1047,'批量强退',109,2,'#','',1,'F','0','0','monitor:online:batchLogout','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1048,'单条强退',109,3,'#','',1,'F','0','0','monitor:online:forceLogout','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1049,'任务查询',110,1,'#','',1,'F','0','0','monitor:job:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1050,'任务新增',110,2,'#','',1,'F','0','0','monitor:job:add','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1051,'任务修改',110,3,'#','',1,'F','0','0','monitor:job:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1052,'任务删除',110,4,'#','',1,'F','0','0','monitor:job:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1053,'状态修改',110,5,'#','',1,'F','0','0','monitor:job:changeStatus','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1054,'任务导出',110,7,'#','',1,'F','0','0','monitor:job:export','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1055,'生成查询',114,1,'#','',1,'F','0','0','tool:gen:query','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1056,'生成修改',114,2,'#','',1,'F','0','0','tool:gen:edit','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1057,'生成删除',114,3,'#','',1,'F','0','0','tool:gen:remove','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1058,'导入代码',114,2,'#','',1,'F','0','0','tool:gen:import','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1059,'预览代码',114,4,'#','',1,'F','0','0','tool:gen:preview','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(1060,'生成代码',114,5,'#','',1,'F','0','0','tool:gen:code','#','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(2000,'智能开关',2006,1,'switch','switch/switch/index',1,'C','0','0','kwswitch:switch:list','switch','admin','2018-03-01 00:00:00','admin','2020-04-23 15:14:41','智能开关菜单'),(2001,'智能开关查询',2000,1,'#','',1,'F','0','0','kwswitch:switch:query','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2002,'智能开关新增',2000,2,'#','',1,'F','0','0','kwswitch:switch:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2003,'智能开关修改',2000,3,'#','',1,'F','0','0','kwswitch:switch:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2004,'智能开关删除',2000,4,'#','',1,'F','0','0','kwswitch:switch:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2005,'智能开关导出',2000,5,'#','',1,'F','0','0','kwswitch:switch:export','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2006,'物联网',0,0,'iot',NULL,1,'M','0','0','','online','admin','2020-04-23 15:13:52','admin','2020-04-23 15:14:12','');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`notice_id`,`notice_title`,`notice_type`,`notice_content`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'温馨提醒：2018-07-01 若依新版本发布啦','2','新版本内容','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1','维护内容','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','管理员');

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`) values (100,'代码生成',6,'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','192.168.40.1','内网IP','kw_switch','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 12:29:42'),(101,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','192.168.40.1','内网IP','{\"functionAuthor\":\"kerwincui\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"deviceId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1587616182000,\"tableId\":1,\"pk\":true,\"columnName\":\"device_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"device_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"monitorValue\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"监测值\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(160)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"monitor_value\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"apiKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"APIKEY\",\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"tableId\":1,\"pk\":false,\"columnName\":\"api_key\"},{\"usableColumn\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 12:39:00'),(102,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','192.168.40.1','内网IP','{\"params\":{},\"dictType\":\"device_category\",\"createBy\":\"admin\",\"dictName\":\"设备分类\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 12:40:17'),(103,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','192.168.40.1','内网IP','{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"device_category\",\"dictLabel\":\"单路\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 12:43:03'),(104,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','192.168.40.1','内网IP','{\"dictValue\":\"2\",\"dictSort\":2,\"params\":{},\"dictType\":\"device_category\",\"dictLabel\":\"双路\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 12:43:18'),(105,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','192.168.40.1','内网IP','{\"dictValue\":\"1\",\"dictSort\":1,\"params\":{},\"dictType\":\"device_category\",\"dictLabel\":\"单路\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1587616983000,\"dictCode\":100,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 12:43:26'),(106,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','192.168.40.1','内网IP','{\"params\":{},\"dictType\":\"sensor\",\"createBy\":\"admin\",\"dictName\":\"传感器\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 12:46:19'),(107,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','192.168.40.1','内网IP','{\"dictValue\":\"temperature\",\"dictSort\":1,\"params\":{},\"dictType\":\"sensor\",\"dictLabel\":\"温湿度\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 12:47:38'),(108,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','192.168.40.1','内网IP','{\"functionAuthor\":\"kerwincui\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"deviceId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备ID\",\"updateTime\":1587616740000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1587616182000,\"tableId\":1,\"pk\":true,\"columnName\":\"device_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备名称\",\"isQuery\":\"1\",\"updateTime\":1587616740000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"device_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"monitorValue\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"监测值\",\"updateTime\":1587616740000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(160)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"monitor_value\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"apiKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"APIKEY\",\"updateTime\":1587616740000,\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 12:50:29'),(109,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','192.168.40.1','内网IP','{\"functionAuthor\":\"kerwincui\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"deviceId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备ID\",\"updateTime\":1587617428000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1587616182000,\"tableId\":1,\"pk\":true,\"columnName\":\"device_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备名称\",\"isQuery\":\"1\",\"updateTime\":1587617428000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"device_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"monitorValue\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"监测值\",\"updateTime\":1587617428000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(160)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"monitor_value\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"apiKey\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"APIKEY\",\"updateTime\":1587617428000,\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 12:56:45'),(110,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','192.168.40.1','内网IP','{}','null',0,NULL,'2020-04-23 12:57:05'),(111,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','192.168.40.1','内网IP','{\"visible\":\"0\",\"icon\":\"switch\",\"orderNum\":\"1\",\"menuName\":\"智能开关\",\"params\":{},\"parentId\":0,\"path\":\"switch\",\"component\":\"switch/switch/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"switch:switch:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 15:03:02'),(112,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','192.168.40.1','内网IP','{\"visible\":\"0\",\"icon\":\"switch\",\"orderNum\":\"1\",\"menuName\":\"智能开关\",\"params\":{},\"parentId\":0,\"path\":\"switch\",\"component\":\"switch/switch/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"F\",\"perms\":\"switch:switch:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 15:08:21'),(113,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','192.168.40.1','内网IP','{\"visible\":\"0\",\"icon\":\"switch\",\"orderNum\":\"1\",\"menuName\":\"智能开关\",\"params\":{},\"parentId\":0,\"path\":\"switch\",\"component\":\"switch/switch/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"switch:switch:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 15:08:59'),(114,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','192.168.40.1','内网IP','{\"visible\":\"0\",\"icon\":\"switch\",\"orderNum\":\"1\",\"menuName\":\"智能开关\",\"params\":{},\"parentId\":0,\"path\":\"switch\",\"component\":\"switch/switch/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"switch:switch:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 15:09:31'),(115,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','192.168.40.1','内网IP','{\"visible\":\"0\",\"icon\":\"online\",\"orderNum\":\"1\",\"menuName\":\"物联网\",\"params\":{},\"path\":\"iot\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 15:13:52'),(116,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','192.168.40.1','内网IP','{\"visible\":\"0\",\"icon\":\"online\",\"orderNum\":\"0\",\"menuName\":\"物联网\",\"params\":{},\"parentId\":0,\"path\":\"iot\",\"children\":[],\"createTime\":1587626032000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 15:14:12'),(117,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','192.168.40.1','内网IP','{\"visible\":\"0\",\"icon\":\"switch\",\"orderNum\":\"1\",\"menuName\":\"智能开关\",\"params\":{},\"parentId\":2006,\"path\":\"switch\",\"component\":\"switch/switch/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"switch:switch:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 15:14:41'),(118,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','192.168.40.1','内网IP','{\"functionAuthor\":\"kerwincui\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"deviceId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"设备ID\",\"updateTime\":1587617805000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1587616182000,\"tableId\":1,\"pk\":true,\"columnName\":\"device_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deviceName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备名称\",\"isQuery\":\"1\",\"updateTime\":1587617805000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"device_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"monitorValue\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"监测值\",\"updateTime\":1587617805000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(160)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1587616182000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"monitor_value\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"apiKey\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"APIKEY\",\"updateTime\":1587617805000,\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-23 15:21:22'),(119,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/4','127.0.0.1','内网IP','{menuId=4}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}',0,NULL,'2020-04-27 07:47:01'),(120,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-27 07:47:18'),(121,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/4','127.0.0.1','内网IP','{menuId=4}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}',0,NULL,'2020-04-27 07:47:22'),(122,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"KWSWITCH\",\"params\":{},\"parentId\":0,\"path\":\"#\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-27 07:48:19'),(123,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/4','127.0.0.1','内网IP','{menuId=4}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}',0,NULL,'2020-04-27 07:48:48'),(124,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"KWSWITCH\",\"params\":{},\"parentId\":0,\"path\":\"#\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-27 07:48:57'),(125,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"KWSWITCH\",\"params\":{},\"parentId\":0,\"path\":\"#\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-27 07:49:07'),(126,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"KWSWITCH\",\"params\":{},\"parentId\":0,\"path\":\"#\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-27 07:49:27'),(127,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.changeStatus()','PUT',1,'admin',NULL,'/system/role/changeStatus','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-28 11:57:20'),(128,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.changeStatus()','PUT',1,'admin',NULL,'/system/role/changeStatus','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-28 11:57:23'),(129,'智能开关',1,'com.ruoyi.project.kwswitch.controller.KwSwitchController.add()','POST',1,'admin',NULL,'/kwswitch/switch','127.0.0.1','内网IP','{\"apiKey\":\"D432594C7B234966B0CC4D24E57C22FE\",\"params\":{},\"userName\":\"admin\",\"deviceId\":8,\"deviceName\":\"卧室灯\",\"createTime\":1588143964659,\"sensor\":\"temperature\",\"state\":\"0\",\"category\":\"single_switch\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-29 07:06:05'),(130,'智能开关',2,'com.ruoyi.project.kwswitch.controller.KwSwitchController.edit()','PUT',1,'admin',NULL,'/kwswitch/switch','127.0.0.1','内网IP','{\"apiKey\":\"D432594C7B234966B0CC4D24E57C22FE\",\"remark\":\"控制卧室灯的单路开关\",\"updateTime\":1588143998333,\"params\":{},\"userName\":\"admin\",\"deviceId\":8,\"deviceName\":\"卧室灯\",\"createTime\":1588143965000,\"sensor\":\"temperature\",\"state\":\"0\",\"category\":\"single_switch\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-29 07:06:38'),(131,'智能开关',1,'com.ruoyi.project.kwswitch.controller.KwSwitchController.add()','POST',1,'admin',NULL,'/kwswitch/switch','127.0.0.1','内网IP','{\"apiKey\":\"2E15D28BADAA4CDB90244A8F3BF0AE8E\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"测试\",\"createTime\":1588144128129,\"state\":\"0\"}','null',1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.kwswitch.mapper.KwSwitchMapper.insertKwSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into kw_switch          ( device_name,                                       api_key,             state,                                                    create_time,                          user_name )           values ( ?,                                       ?,             ?,                                                    ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\n; Field \'sensor\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sensor\' doesn\'t have a default value','2020-04-29 07:08:48'),(132,'智能开关',1,'com.ruoyi.project.kwswitch.controller.KwSwitchController.add()','POST',1,'admin',NULL,'/kwswitch/switch','127.0.0.1','内网IP','{\"apiKey\":\"E2E4A544ED1B4E31BBF7EF46FC1F1996\",\"remark\":\"测试\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"测试\",\"createTime\":1588144369155,\"state\":\"0\"}','null',1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.kwswitch.mapper.KwSwitchMapper.insertKwSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into kw_switch          ( device_name,                                       api_key,             state,                                                    create_time,                          user_name,             remark )           values ( ?,                                       ?,             ?,                                                    ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\n; Field \'sensor\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sensor\' doesn\'t have a default value','2020-04-29 07:12:49'),(133,'智能开关',1,'com.ruoyi.project.kwswitch.controller.KwSwitchController.add()','POST',1,'admin',NULL,'/kwswitch/switch','127.0.0.1','内网IP','{\"apiKey\":\"00242A6C18D5422097E6EAD3BEA0E61A\",\"remark\":\"测试\",\"params\":{},\"userName\":\"admin\",\"deviceName\":\"测试\",\"createTime\":1588144465440,\"state\":\"0\"}','null',1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.kwswitch.mapper.KwSwitchMapper.insertKwSwitch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into kw_switch          ( device_name,                                       api_key,             state,                                                    create_time,                          user_name,             remark )           values ( ?,                                       ?,             ?,                                                    ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'sensor\' doesn\'t have a default value\n; Field \'sensor\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'sensor\' doesn\'t have a default value','2020-04-29 07:14:26'),(134,'智能开关',1,'com.ruoyi.project.kwswitch.controller.KwSwitchController.add()','POST',1,'admin',NULL,'/kwswitch/switch','127.0.0.1','内网IP','{\"apiKey\":\"0948AEBE27224802BA66F15DC2D4A658\",\"remark\":\"测试\",\"params\":{},\"userName\":\"admin\",\"deviceId\":9,\"deviceName\":\"测试\",\"createTime\":1588144875318,\"sensor\":\"temperature\",\"state\":\"0\",\"category\":\"single_switch\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-29 07:21:15'),(135,'智能开关',3,'com.ruoyi.project.kwswitch.controller.KwSwitchController.remove()','DELETE',1,'admin',NULL,'/kwswitch/switch/9','127.0.0.1','内网IP','{deviceIds=9}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-29 07:21:25'),(136,'智能开关',5,'com.ruoyi.project.kwswitch.controller.KwSwitchController.export()','GET',1,'admin',NULL,'/kwswitch/switch/export','127.0.0.1','内网IP','{}','{\"msg\":\"5da60f9e-c3ca-42e7-88e7-691650bbeffd_switch.xlsx\",\"code\":200}',0,NULL,'2020-04-29 08:48:59'),(137,'智能开关',2,'com.ruoyi.project.kwswitch.controller.KwSwitchController.edit()','PUT',1,'admin',NULL,'/kwswitch/switch','127.0.0.1','内网IP','{\"apiKey\":\"D432594C7B234966B0CC4D24E57C22FE\",\"remark\":\"控制卧室灯的单路开关0\",\"updateTime\":1588165065571,\"params\":{},\"userName\":\"admin\",\"deviceId\":3,\"deviceName\":\"卧室灯\",\"createTime\":1588115220000,\"sensor\":\"temperature\",\"state\":\"0\",\"category\":\"single_switch\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-29 12:57:46'),(138,'智能开关',1,'com.ruoyi.project.kwswitch.controller.KwSwitchController.add()','POST',1,'admin',NULL,'/kwswitch/switch','127.0.0.1','内网IP','{\"apiKey\":\"4A2AF175B85B46AFA54ADBE4BA24122E\",\"remark\":\"测色\",\"params\":{},\"userName\":\"admin\",\"deviceId\":10,\"deviceName\":\"测试\",\"createTime\":1588170684677,\"sensor\":\"temperature\",\"state\":\"0\",\"category\":\"double_switch\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-29 14:31:25'),(139,'智能开关',3,'com.ruoyi.project.kwswitch.controller.KwSwitchController.remove()','DELETE',1,'admin',NULL,'/kwswitch/switch/10','127.0.0.1','内网IP','{deviceIds=10}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-04-29 14:34:26'),(140,'个人信息',2,'com.ruoyi.project.system.controller.SysProfileController.updatePwd()','PUT',1,'admin',NULL,'/system/user/profile/updatePwd','39.130.57.52','XX XX','admin123 cxw3513090','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-05-18 09:32:33'),(141,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','39.130.57.155','XX XX','{}','null',0,NULL,'2020-05-30 02:55:25'),(142,'个人信息',2,'com.ruoyi.project.system.controller.SysProfileController.updatePwd()','PUT',1,'admin',NULL,'/system/user/profile/updatePwd','39.130.57.36','XX XX','cxw3513090 admin123','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2020-09-05 02:27:03');

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'ceo','董事长',1,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(2,'se','项目经理',2,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(3,'hr','人力资源',3,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00',''),(4,'user','普通员工',4,'0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'管理员','admin',1,'1','0','0','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','管理员'),(2,'普通角色','common',2,'2','0','0','admin','2018-03-16 11:33:00','admin','2020-04-28 11:57:23','普通角色');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`role_id`,`dept_id`) values (2,100),(2,101),(2,105);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$HRHcPYQiLUrNMRRG17uR5edj/Kzm.vpkvhnlRYY./L01DAPpVV0.O','0','0','127.0.0.1','2018-03-16 11:33:00','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2018-03-16 11:33:00','admin','2018-03-16 11:33:00','ry','2018-03-16 11:33:00','测试员');

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values (1,1),(2,2);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values (1,1),(2,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
