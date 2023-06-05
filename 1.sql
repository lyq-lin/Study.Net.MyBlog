-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: myblog
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20230601101120_init','7.0.5'),('20230603032016_addIdentityFramework','7.0.5'),('20230603130208_addJwtVersionInUser','7.0.5');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aspnetroles` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
INSERT INTO `aspnetroles` VALUES ('08db63f5-bd44-462a-86ed-d3fc24e4a288','Admin','ADMIN',NULL),('08db63f5-ccfb-4d41-82e0-00373217c9c4','Normal','NORMAL',NULL);
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aspnetuserroles` (
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `RoleId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aspnetusers` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `JwtVersion` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('08db63f6-2ca0-4142-855a-7abfddf56860',0,'YCode','YCODE',NULL,NULL,0,'AQAAAAIAAYagAAAAEOfgeGD8mxsur/+7OblsOOaMkhjJo6ymGs1NtTwm/q0BhbPN+DtplKHIcxqddITH/w==','KA6FUNQN5IZ43FYRD5IOJBURGBSVUZDJ','f87984b3-16de-404d-b228-c5f4c31f6d74',null,0,0,NULL,1,0,58),('08db640e-7de3-4f51-85ac-b8be1d5a7fb0',0,'Jody','JODY',NULL,NULL,0,'AQAAAAIAAYagAAAAEP+DY2N2CrjHYRQXzJpuvaEZiBgWaWTr+LVo1j0KhH+9SJs3NIsbwZoAelQVUBfYAw==','3Q2UEKWWKOZM64ZQRLLLMPRHFUG6KAU4','2d2b0e5f-54f4-4f41-b43d-87c507fe8325',NULL,0,0,NULL,1,0,0);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aspnetusertokens` (
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_article`
--

DROP TABLE IF EXISTS `t_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_article` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreateTime` datetime(6) NOT NULL,
  `TypeId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ViewCount` int(11) NOT NULL,
  `LikeCount` int(11) NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `UserId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  PRIMARY KEY (`Id`),
  KEY `IX_T_Article_TypeId` (`TypeId`),
  KEY `IX_T_Article_UserId` (`UserId`),
  CONSTRAINT `FK_T_Article_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_T_Article_T_ArticleType_TypeId` FOREIGN KEY (`TypeId`) REFERENCES `t_articletype` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_article`
--

LOCK TABLES `t_article` WRITE;
/*!40000 ALTER TABLE `t_article` DISABLE KEYS */;
INSERT INTO `t_article` VALUES ('08db657f-f192-4f23-8367-aec89b899115','HelloWorld','---\ntitle: Hello World\n---\nWelcome to [Hexo](https://hexo.io/)! This is your very first post. Check [documentation](https://hexo.io/docs/) for more info. If you get any problems when using Hexo, you can find the answer in [troubleshooting](https://hexo.io/docs/troubleshooting.html) or you can ask me on [GitHub](https://github.com/hexojs/hexo/issues).\n\n<!--more-->\n\n## Quick Start\n\n### Create a new post\n\n``` bash\n$ hexo new \"My New Post\"\n```\n\nMore info: [Writing](https://hexo.io/docs/writing.html)\n\n### Run server\n\n``` bash\n$ hexo server\n```\n\nMore info: [Server](https://hexo.io/docs/server.html)\n\n### Generate static files\n\n``` bash\n$ hexo generate\n```\n\nMore info: [Generating](https://hexo.io/docs/generating.html)\n\n### Deploy to remote sites\n\n``` bash\n$ hexo deploy\n```\n\nMore info: [Deployment](https://hexo.io/docs/one-command-deployment.html)\n','2023-06-05 12:47:19.124767','56f0f1a1-83cc-4abc-a257-6627e2b5df63',0,0,0,'08db63f6-2ca0-4142-855a-7abfddf56860'),('08db6580-afa6-4e22-8d85-57cce2b11ec1','HelloWorld22222','<hr />\n\n<h2>title: Hello World</h2>\n\n<p>Welcome to <a href=\"https://hexo.io/\">Hexo</a>! This is your very first post. Check <a href=\"https://hexo.io/docs/\">documentation</a> for more info. If you get any problems when using Hexo, you can find the answer in <a href=\"https://hexo.io/docs/troubleshooting.html\">troubleshooting</a> or you can ask me on <a href=\"https://github.com/hexojs/hexo/issues\">GitHub</a>.</p>\n\n<!--more-->\n\n<h2>Quick Start</h2>\n\n<h3>Create a new post</h3>\n\n<p><code>bash\n$ hexo new \"My New Post\"\n</code></p>\n\n<p>More info: <a href=\"https://hexo.io/docs/writing.html\">Writing</a></p>\n\n<h3>Run server</h3>\n\n<p><code>bash\n$ hexo server\n</code></p>\n\n<p>More info: <a href=\"https://hexo.io/docs/server.html\">Server</a></p>\n\n<h3>Generate static files</h3>\n\n<p><code>bash\n$ hexo generate\n</code></p>\n\n<p>More info: <a href=\"https://hexo.io/docs/generating.html\">Generating</a></p>\n\n<h3>Deploy to remote sites</h3>\n\n<p><code>bash\n$ hexo deploy\n</code></p>\n\n<p>More info: <a href=\"https://hexo.io/docs/one-command-deployment.html\">Deployment</a></p>\n','2023-06-05 12:52:38.000681','56f0f1a1-83cc-4abc-a257-6627e2b5df63',0,0,0,'08db63f6-2ca0-4142-855a-7abfddf56860'),('6ABD8AAB-DF0C-41B4-BB99-A1844D3B379C','java学习之旅：jdbc连接MySQL8.0','<hr />\n\n<p>title: \'java学习之旅:jdbc连接MySQL8.0\'\ndate: 2021-02-17 23:01:55\ntags: Java学习之旅</p>\n\n<h2>categories: 软件安装与使用</h2>\n\n<h1>前言</h1>\n\n<p>在MySQL8.0中连接JDBC与以往有所不同，接下来博主将把学到的MySQL8.0连接JDBC的基本环境搭建以及注意事项记录下来，分享给大家以供参考</p>\n\n<!--more-->\n\n<p>准备工作:</p>\n\n<ul>\n<li>基本编程基础</li>\n<li>MySQL8.0+</li>\n<li>mysql-connector-java的jar包</li>\n</ul>\n\n<p>环境及配置：</p>\n\n<ol>\n<li>开启MySQL服务</li>\n<li>连接代码参数</li>\n</ol>\n\n<h2>MYSQL8.0+：</h2>\n\n<p>本文使用的是MySQL8.0.19进行记录</p>\n\n<p>官网下载：https://dev.mysql.com/downloads/installer/</p>\n\n<p>MySQL的安装-->自行百度教程</p>\n\n<p><a href=\"https://imgchr.com/i/yWLiAe\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLiAe.md.png\" alt=\"yWLiAe.md.png\" /></a></p>\n\n<h2>mysql-connector-java的jar包：</h2>\n\n<p>手动下载，添加jar包：https://static.runoob.com/download/mysql-connector-java-8.0.19.jar</p>\n\n<p>在你的项目中选择存放资源的文件夹，新建lib目录：</p>\n\n<p>​                                                               <a href=\"https://imgchr.com/i/yWLFtH\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLFtH.png\" alt=\"yWLFtH.png\" /></a></p>\n\n<p>将jar包导入到lib目录下，随后选择lib项目右键点击<strong>Add as Library</strong></p>\n\n<h2>配置：</h2>\n\n<ol>\n<li><p><strong>开启MySQL服务</strong></p>\n\n<p>​    win10右键点击下方任务栏，打开任务管理器</p>\n\n<p><a href=\"https://imgchr.com/i/yWLE9A\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLE9A.md.png\" alt=\"yWLE9A.md.png\" /></a></p>\n\n<p>​    </p>\n\n<p>随后点击文件-->运行新项目，勾选以管理员身份运行</p>\n\n<p><a href=\"https://imgchr.com/i/yWLV1I\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLV1I.png\" alt=\"yWLV1I.png\" /></a></p>\n\n<p>输入 <code>net start mysql80</code> 开启mysql服务 ，mysql80是安装的时候，设置的服务名。</p>\n\n<p>输入 <code>net stop mysql80</code> 关闭mysql服务 。</p>\n\n<p>​    <a href=\"https://imgchr.com/i/yWLC7D\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLC7D.png\" alt=\"yWLC7D.png\" /></a></p>\n\n<p>如没有打开管理员权限则会出现拒绝访问的情况</p>\n\n<p><strong>开启mysql服务后就可以关闭cmd框，然后开始写代码了。</strong></p>\n\n<p>​    </p>\n\n<p>​    </p>\n\n<p>​    </p>\n\n<p>​    </p></li>\n<li><p><strong>连接代码参数设置</strong></p>\n\n<ul>\n<li>MYSQL8.0+使用jbdc的连接，与以往版本的不同</li>\n</ul></li>\n</ol>\n\n<p>|           连接           |                 MYSQL8.0+                  |\n| :----------------------: | :----------------------------------------: |\n|         forname          | Class.forName(<code>com.mysql.cj.jdbc.Driver</code>） |\n|       URL设置时区        |             serverTimezone=UTC             |\n| 设置编码（防止中文乱码） |          characterEncoding=UTF-8           |</p>\n\n<ul>\n<li>上面2个参数不设置好会报<code>ClassNotFoundException</code>的异常</li>\n</ul>\n\n<p>通常情况下连接url设置成这样即可</p>\n\n<p><code>\njdbc:mysql://localhost:3306/mysqlname?useSSL=false&amp;serverTimezone=UTC&amp;characterEncoding=UTF-8\n</code></p>\n\n<p>|      url参数       |                             说明                             |\n| :----------------: | :----------------------------------------------------------: |\n|     localhost      |                 localhost是本机地址127.0.0.1                 |\n|       :3306        | 端口名，是mysql开启的服务，如果上述（配置一）的mysql服务未开启，会报<code>com.mysql.cj.jdbc.exceptions.CommunicationsException: Communications link failure</code> 的异常 |\n|     mysqlname      | 数据库的名字，如果没有此数据库会报<code>SQLSyntaxErrorException: Unknown database \'xxx\'</code>，的异常 |\n|    useSSL=false    | 在web领域要用到，指是否开启ssl安全连接，但MySQL 8.0 以上版本不需要建立 SSL 连接，需要关闭。 |\n| serverTimezone=UTC |                    设置时区，不设置会报错                    |</p>\n\n<h2>JDBC快速入门演示：</h2>\n\n<p>这里博主演示一个准备好的数据库，数据库名为db2，测试表为emp</p>\n\n<p>|                  会用到的方法                   |                             说明                             |\n| :---------------------------------------------: | :----------------------------------------------------------: |\n|               Class.<strong>forName</strong>()               | 返回一个类，作用是要求JVM查找并加载指定的类，也就是说JVM会执行该类的静态代码段。 |\n| DriverManager.<strong>getConnection</strong>(url, user, pwd) |              返回Connection对象，用于连接数据库              |\n|        connection.<strong>createStatement</strong>()         |            返回Statement对象，用于查询数据库操作             |\n|        statement.<strong>executeUpdate</strong>(str)         |                         执行查询语句                         |</p>\n\n<p>```java\nimport java.sql.*; //导入包</p>\n\n<p>/**\n * JDBC快速入门\n */\npublic class jdbcDemo1 {\n    public static void main(String[] args) throws Exception {\n        //1.导入驱动jar包\n        //2.注册驱动\n        //mysql8.0后从com.mysql.jdbc.Driver更新为com.mysql.cj.jdbc.Driver\n        Class.forName(\"com.mysql.cj.jdbc.Driver\"); //如果没有手动注册驱动,则mysql5后的驱动jar包会自动帮你注册\n        //3.获取数据库连接对象\n        Connection conn = DriverManager.getConnection(\"jdbc:mysql://localhost:3306/数据库名称?useSSL=false&amp;serverTimezone=UTC&amp;characterEncoding=UTF-8\", \"MySQL用户名\", \"MySQL密码\");\n        //4.定义sql语句\n        String str = \"update emp set salary=1000 where id=1001\"; //把emp表里id为1001的salary数据更新为1000\n        //5.获取执行sql 的对象 Statement\n        Statement stmt = conn.createStatement();\n        //6.执行sql\n        int count = stmt.executeUpdate(str); //返回受影响行数\n        //7.处理结果\n        System.out.println(count); \n        //8.释放资源\n        stmt.close();\n        conn.close();\n    }\n}\n```</p>\n\n<p>好了，以上就是MySQL8.0+连接JDBC的方法，感谢各位的观看！</p>\n\n<hr />\n\n<p>而后是我在做一个web小练习时使用druid及配置文件连接JDBC遇到的一个警告信息</p>\n\n<p><code>\n严重: testWhileIdle is true, validationQuery not set\n</code></p>\n\n<p>原来配置druid.properties文件配置如下：</p>\n\n<p><code>\ndriverClassName=com.mysql.cj.jdbc.Driver\nurl=jdbc:mysql://localhost:3306/day14?useSSL=false&amp;serverTimezone=UTC&amp;characterEncoding=UTF-8\nusername=root\npassword=密码\n</code></p>\n\n<p>在properties配置文件下添加一些配置：</p>\n\n<p><code>\nfilters=stat\ninitialSize=2\nmaxActive=300\nmaxWait=60000\ntimeBetweenEvictionRunsMillis=60000\nminEvictableIdleTimeMillis=300000\nvalidationQuery=SELECT 1\ntestWhileIdle=true\ntestOnBorrow=false\ntestOnReturn=false\npoolPreparedStatements=false\nmaxPoolPreparedStatementPerConnectionSize=200\n</code></p>\n\n<p>再次运行便不再报错。</p>\n\n<hr />\n\n<h6>附上一些名词解释：</h6>\n\n<p>validationQuery = \"SELECT 1\" ：验证连接是否可用，使用的SQL语句</p>\n\n<p>testWhileIdle = \"true\"：指明连接是否被空闲连接回收器(如果有)进行检验.如果检测失败,则连接将被从池中去除</p>\n\n<p>testOnBorrow = \"false\"：借出连接时不要测试，否则很影响性能</p>\n\n<p>timeBetweenEvictionRunsMillis = \"30000\"：每30秒运行一次空闲连接回收器</p>\n\n<p>minEvictableIdleTimeMillis = \"1800000\"：池中的连接空闲30分钟后被回收,默认值就是30分钟。</p>\n\n<p>numTestsPerEvictionRun=\"3\"：在每次空闲连接回收器线程(如果有)运行时检查的连接数量，默认值就是3</p>\n\n<h6>解释：</h6>\n\n<p>配置timeBetweenEvictionRunsMillis = \"30000\"后，每30秒运行一次空闲连接回收器（独立线程）。并每次检查3个连接，如果连接空闲时间超过30分钟就销毁。销毁连接后，连接数量就少了，如果小于minIdle数量，就新建连接，维护数量不少于minIdle，过行了新老更替。</p>\n\n<p>testWhileIdle = \"true\" 表示每30秒，取出3条连接，使用validationQuery = \"SELECT 1\" 中的SQL进行测试 ，测试不成功就销毁连接。销毁连接后，连接数量就少了，如果小于minIdle数量，就新建连接。</p>\n\n<p>testOnBorrow = \"false\" 一定要配置，因为它的默认值是true。false表示每次从连接池中取出连接时，不需要执行validationQuery = \"SELECT 1\" 中的SQL进行测试。若配置为true,对性能有非常大的影响，性能会下降7-10倍。所在一定要配置为false.</p>\n\n<p>每30秒，取出numTestsPerEvictionRun条连接（本例是3，也是默认值），发出\"SELECT 1\" SQL语句进行测试 ，测试过的连接不算是“被使用”了，还算是空闲的。连接空闲30分钟后会被销毁</p>\n\n<hr />\n\n<p>感谢各位观看！?</p>\n','2023-06-02 19:49:00.000000','56F0F1A1-83CC-4ABC-A257-6627E2B5DF63',128,19,0,'08db63f6-2ca0-4142-855a-7abfddf56860'),('7D23FFDA-1723-4FFC-9120-DCECB0B4F857','java学习之旅：关于idea2020创建servlet','<hr />\n\n<p>title: \'java学习之旅:关于idea2020创建servlet\'\ndate: 2021-02-17 00:01:06\ntags: Java学习之旅</p>\n\n<h2>categories: 软件安装与使用</h2>\n\n<h1>前言</h1>\n\n<p>最近博主在学习servlet过程中，遇到idea2020版本无法像以往版本中直接在包直接中创建servlet实现类，经学习后特出此博客，以后不再这里出现卡壳情况，也能帮助其他有需要的人</p>\n\n<!--more-->\n\n<p>首先我们要知道servlet能帮我们干什么：</p>\n\n<p><a href=\"https://imgchr.com/i/yWLG3n\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLG3n.md.png\" alt=\"yWLG3n.md.png\" /></a></p>\n\n<p>它会给我们处理好配置servlet的基本准备，自动导包、web注解、实现doPost、doGet方法。提升开发效率</p>\n\n<p>在2017版本中，我们可以看到idea是可以在包中右击创建servlet的，如下图</p>\n\n<p><a href=\"https://imgchr.com/i/yWL1hj\"><img src=\"https://s3.ax1x.com/2021/02/18/yWL1hj.md.png\" alt=\"yWL1hj.md.png\" /></a></p>\n\n<p>但是我在idea(版本2020.3.1)中无法在新建中找到</p>\n\n<p><a href=\"https://imgchr.com/i/yWL89s\"><img src=\"https://s3.ax1x.com/2021/02/18/yWL89s.png\" alt=\"yWL89s.png\" /></a></p>\n\n<h3>为此给大家带来两种解决方法</h3>\n\n<p>先介绍第一种：</p>\n\n<p>第一步：</p>\n\n<p><code>\n选择file--&gt; poject structure #也就是文件中的项目管理\n</code></p>\n\n<p><a href=\"https://imgchr.com/i/yWLnnf\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLnnf.png\" alt=\"yWLnnf.png\" /></a></p>\n\n<p>而后选中项目中的web，往下拉勾选路径</p>\n\n<p><a href=\"https://imgtu.com/i/6wOuwQ\"><img src=\"https://s3.ax1x.com/2021/03/14/6wOuwQ.md.png\" alt=\"6wOuwQ.md.png\" /></a></p>\n\n<p>回到界面中就可以发现新建带上了servlet、filter、listener等了~</p>\n\n<p><a href=\"https://imgtu.com/i/6wOneg\"><img src=\"https://s3.ax1x.com/2021/03/14/6wOneg.png\" alt=\"6wOneg.png\" /></a></p>\n\n<p>如果还不行请查看第二个方法：</p>\n\n<p>第二个解决方法如下：</p>\n\n<p>第一步:</p>\n\n<p><code>\n选择file--&gt; poject structure #也就是文件中的项目管理\n</code></p>\n\n<p><a href=\"https://imgchr.com/i/yWLnnf\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLnnf.png\" alt=\"yWLnnf.png\" /></a></p>\n\n<p>第二步：打开后选择modules，选择你的项目，选中你的包，标记为Resources</p>\n\n<p><a href=\"https://imgchr.com/i/yWLQAg\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLQAg.md.png\" alt=\"yWLQAg.md.png\" /></a></p>\n\n<p>第三步：选择facets，选择你的项目，并在Source Roots区域勾选你的项目</p>\n\n<p><a href=\"https://imgchr.com/i/yWLKHS\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLKHS.md.png\" alt=\"yWLKHS.md.png\" /></a></p>\n\n<p>第四步：关闭后回到界面我们可以发现右键直接新建servlet啦！</p>\n\n<p><a href=\"https://imgchr.com/i/yWLuB8\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLuB8.md.png\" alt=\"yWLuB8.md.png\" /></a></p>\n\n<p>第五步：配置信息</p>\n\n<p><a href=\"https://imgchr.com/i/yWLejP\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLejP.png\" alt=\"yWLejP.png\" /></a></p>\n\n<hr />\n\n<p>好了，至此idea2020已经可以再包中直接创建servlet了，感谢各位阅读！?</p>\n','2023-06-02 19:49:00.000000','56F0F1A1-83CC-4ABC-A257-6627E2B5DF63',128,19,0,'08db63f6-2ca0-4142-855a-7abfddf56860'),('8CD7C266-F3C9-40F6-967B-E1F7229CD848','堪称有手就行系列(二)：从零开始搭建博客','<hr />\n\n<p>title: 堪称\"有手就行系列(二)：从零开始搭建博客\ndate: 2021-02-11 16:01:49\ntags: 博客搭建</p>\n\n<h2>categories: 软件安装与使用</h2>\n\n<h1>前言</h1>\n\n<p>上一章我们从配置环境讲起，结束于hexo的安装完成，也看到了我们博客的基础页面，这次我们讲讲如何把自己的博客部署到git上，通过互联网访问我们的博客以及我在部署上遇到的种种大坑。</p>\n\n<hr />\n\n<!--more-->\n\n<h2>部署网站</h2>\n\n<p>其实部署网站无非就是把本地的上传到git仓库上，但期间我碰到种种因版本问题，纰漏问题，无法修复等问题让我倍感苦恼。上一章中访问的localhost:4000只是在本地预览，接下来要做的就是就是推送网站，也就是发布网站，让我们的网站可以被更多的人访问。</p>\n\n<p>注意： </p>\n\n<p><code>\n        **以下命令，如无注解，均在根目录下打开Git Bush**\n</code></p>\n\n<p>在设置之前，需要解释一个概念，在blog根目录里的_config.yml文件称为<strong>站点</strong>配置文件，如下图</p>\n\n<p><a href=\"https://imgchr.com/i/yWqWfs\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqWfs.png\" alt=\"yWqWfs.png\" /></a></p>\n\n<p>进入根目录里的themes文件夹，里面也有个_config.yml文件，这个称为<strong>主题</strong>配置文件，如下图</p>\n\n<p><a href=\"https://imgchr.com/i/yWqrOf\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqrOf.png\" alt=\"yWqrOf.png\" /></a></p>\n\n<p>下一步将我们的Hexo与GitHub关联起来，</p>\n\n<p>注意这里有个因版本的坑，便是git的更新迭代把master更新为main，而网上大多教程都是以master为准，让博主头疼了好久 = =</p>\n\n<p>如</p>\n\n<p>```\n打开站点的配置文件_config.yml，翻到最后修改为：</p>\n\n<p>deploy:\ntype: git\nrepo: 这里填入你之前在GitHub上创建仓库的完整路径，记得加上 .git\nbranch: master\n```</p>\n\n<p>经博主不断面向百度，国内外程序员网站都翻熟了，终于找到解决方法以供参考</p>\n\n<p>参考如下：</p>\n\n<p>```</p>\n\n<h1>Deployment</h1>\n\n<p>deploy:\n  type: git\n  repo: https://github.com/你的github用户名/你的github仓库名.git # 以.git结尾\n  branch: main\n```</p>\n\n<p>保存站点配置文件。</p>\n\n<p>其实就是给hexo d 这个命令做相应的配置，让hexo知道你要把blog部署在哪个位置，很显然，我们部署在我们GitHub的仓库里。最后安装Git部署插件，输入命令：</p>\n\n<p><code>basemake\nnpm install hexo-deployer-git --save # [c]\n</code></p>\n\n<p>注意这里也有个坑, 如</p>\n\n<p><code>\nnpm WARN fsevents@1.2.0 had bundled packages that do not match the required version(s). They have been replaced with non-bundled versions.\nnpm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.2.0 (node_modulesfsevents):\nnpm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.2.0: wanted {\"os\":\"darwin\",\"arch\":\"any\"} (current: {\"os\":\"win32\",\"arch\":\"x64\"})\n</code></p>\n\n<p>在网上找到的说明：</p>\n\n<p><code>\n原因：\nfsevents不在package.json里，但是仍然安装了，是因为你的系统是Windows系统，fsevents是苹果系统的可选依赖,你的项目有可能是团队项目，别人在他的mac上安装了fsevents相关依赖库，所以到这边你也就安装到你的windows上边了。你可以检查你的package.json 文件中是不是有fsevents相关依赖，删除即好！\n如果没有，其他的npm包也会有依赖fsevents的！！！\n这是warning错误，是因为mac下需要 fsevents，这里是在windows环境，所以可以忽略这个警告，对你没什么影响的。\n</code></p>\n\n<p>但实际上我并不能忽略它<code>(&gt;﹏&lt;)′     在后面影响我一直不能部署成功</code>(<em>>﹏&lt;</em>)′</p>\n\n<p>我解决方法是npm前加个c，如：</p>\n\n<p><code>\n cnpm install -g hexo-cli  # [c]\n</code></p>\n\n<p>成功后我们分别输入三条命令：</p>\n\n<p><code>bash\nhexo clean   # 清除缓存文件 db.json 和已生成的静态文件 public\nhexo g  # generate\nhexo d  # deploy\n</code></p>\n\n<p>其实第三条的 hexo d 就是部署网站命令，d是deploy的缩写。完成后，打开浏览器，在地址栏输入你的放置个人网站的仓库路径，即 .github.io  比如我的xxxx就是我的GitHub用户名：</p>\n\n<p><code>\n                            lyq-lin.github.io\n</code></p>\n\n<p>你就会发现你的博客已经上线了，可以在网络上被访问了！</p>\n\n<p><a href=\"#wancheng\">如果你不打算绑定域名，可以点击这里跳过</a></p>\n\n<h2>绑定域名</h2>\n\n<p>这里是一个可选项，就是你不绑定域名也可以正常登录网页，但是喜欢一个个性化又好听的域名又有什么坏心思呢？而且域名也不贵，几块到几十块都有，任自己实力决定。博主使用的是.xyz，主要嘛还是便宜！~?</p>\n\n<p>这里博主演示的是<a href=\"https://console.dnspod.cn/\" >DNSPOD</a>，如下图：</p>\n\n<p><a href=\"https://imgchr.com/i/yWqD6P\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqD6P.png\" alt=\"yWqD6P.png\" /></a></p>\n\n<p>在搜索框输入你想要的域名，如</p>\n\n<p><a href=\"https://imgchr.com/i/yWqdfA\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqdfA.png\" alt=\"yWqdfA.png\" /></a></p>\n\n<p>按步骤购买后你就有一个属于自己的域名了！</p>\n\n<p>随后进入控制台，添加解析，如图</p>\n\n<p><a href=\"https://imgchr.com/i/yWq2kQ\"><img src=\"https://s3.ax1x.com/2021/02/18/yWq2kQ.png\" alt=\"yWq2kQ.png\" /></a></p>\n\n<p>点击添加记录，添加五条，第一条是CNAME的记录，记录值为你的仓库位置，也就是仓库名字，如不确定则打开你的github仓库看看；另外四条是你的git项目地址，你可以打开cmd ping一下你的 xxxx.github.io的ip地址，填入进去。</p>\n\n<p>至于为什么要添加四条，是因为因为你的网站的IP是会变化的。所以你需要添加这四个解析到IP地址的<code>A</code>记录。</p>\n\n<p><code>\n185.199.108.153\n185.199.109.153\n185.199.110.153\n185.199.111.153\n</code></p>\n\n<p>完成后登录GitHub，进入之前创建的仓库，点击settings，设置Custom domain，输入你的域名</p>\n\n<p><a href=\"https://imgchr.com/i/yWqRYj\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqRYj.png\" alt=\"yWqRYj.png\" /></a></p>\n\n<p>点击save保存。</p>\n\n<p>（下一步有个坑，我没设的时候是没有任何问题的，绑定了我的域名并且也成功进入博客了，加上了反而发生404问题。但是当我更换博客主题时，既会出现404的错误，虽然主题因hexo版本问题需要另外下再插件，但是也和CNAME这个文件有关，无法识别到我的域名，最后把它加上才成功解决问题= =）</p>\n\n<p>进入本地博客文件夹 ，进入blog/source目录下，创建一个记事本文件，输入你的域名，对，只要写进你自己的域名即可。如果带有www，那么以后访问的时候必须带有www完整的域名才可以访问，但如果不带有www，以后访问的时候带不带www都可以访问。所以建议，不要带有www。</p>\n\n<p><a href=\"https://imgchr.com/i/yWqBlt\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqBlt.png\" alt=\"yWqBlt.png\" /></a></p>\n\n<p>保存，命名为CNAME ，注意保存成<strong>所有文件</strong>而不是<strong>txt文件</strong>。</p>\n\n<h2>完成</h2>\n\n<div id=\"wancheng\"></div>\n\n<p>完成这三步，进入blog目录中，右击打开Bash命令行，依次输入：</p>\n\n<p><code>bash\nhexo clean\nhexo g\nhexo d\n</code></p>\n\n<p>而后会提示你输入github的注册邮箱及你的密码，如下图：</p>\n\n<p><a href=\"https://imgchr.com/i/yWq60S\"><img src=\"https://s3.ax1x.com/2021/02/18/yWq60S.png\" alt=\"yWq60S.png\" /></a></p>\n\n<p>输入后再输入你的git注册的用户名：</p>\n\n<p><strong>注意是用户名</strong></p>\n\n<p><a href=\"https://imgchr.com/i/yWq0SI\"><img src=\"https://s3.ax1x.com/2021/02/18/yWq0SI.png\" alt=\"yWq0SI.png\" /></a></p>\n\n<p>而后输入注册github的密码：</p>\n\n<p><a href=\"https://imgchr.com/i/yWqcTg\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqcTg.png\" alt=\"yWqcTg.png\" /></a></p>\n\n<p>这里每次点击都会自动切换中文，如果你输入法是win10的并且有中文输入的情况下，密码有标点符号的朋友注意了~~</p>\n\n<p><a href=\"https://imgchr.com/i/yWqym8\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqym8.png\" alt=\"yWqym8.png\" /></a></p>\n\n<p>部署成功输出信息</p>\n\n<p>本人在这里也有过坑哈，就是那种不报错，但是也不会把自己文件上传到GitHub仓库上，如果有小伙伴有这种情况，注意安装git部署插件时在npm前加个c</p>\n\n<p>有的人有我的情况，但有的人又没有~~~    请小伙伴们结合自身情况考虑了</p>\n\n<p>这时候打开浏览器在地址栏输入你的个性化域名将会直接进入你自己搭建的网站了~~~~</p>\n\n<p>?</p>\n\n<p>好了，至此搭建博客的教学已经完成。至于第三篇关于博客的配置，主题啊，如何编写这些，博主本人也是新手上路，等博主在学习的过程中再慢慢总结，将本系列的第三篇完成，谢谢各位观看！?</p>\n\n<hr />\n\n<p>​                                                                                                                                                               本文仅供交流学习</p>\n\n<p>​                                                                                                                                                               QQ：1047419458</p>\n','2023-06-02 19:49:00.000000','9D728073-080A-4AEF-8865-968BEC15D1CA',123,19,0,'08db63f6-2ca0-4142-855a-7abfddf56860'),('8F80DCFD-BB56-4739-B5B1-A0FAB2CBE380','java学习之旅：关于jsp使用out.print方法错误问题','<hr />\n\n<p>title: \'java学习之旅:关于jsp使用out.print方法错误问题\'\ndate: 2021-03-02 22:08:42\ntags: Java学习之旅</p>\n\n<h2>categories: 编程学习</h2>\n\n<h1>前言</h1>\n\n<p>最近博主学习jsp过程中，遇到了out.print()使用报错问题，特此发布解决方法，以供有此问题朋友借鉴和以后再遇到此类问题不卡壳。</p>\n\n<!--more-->\n\n<p>环境：</p>\n\n<p>​   tomcat8.5.31</p>\n\n<p>闲话少说，上图：</p>\n\n<p><a href=\"https://imgtu.com/i/6k4Xmd\"><img src=\"https://s3.ax1x.com/2021/03/02/6k4Xmd.md.png\" alt=\"6k4Xmd.md.png\" /></a></p>\n\n<p>像上图一样，使用out.print()出现了</p>\n\n<p><code>java\nCannot resolve method \'print(java.lang.String) #\'无法解析方法“print(java.lang.String)”\n</code></p>\n\n<p>其实是tomcat的架包依赖没有导入 = =</p>\n\n<p>打开idea选择file-->project Structure-->Dependencies，如图：</p>\n\n<p><a href=\"https://imgtu.com/i/6k4LOH\"><img src=\"https://s3.ax1x.com/2021/03/02/6k4LOH.md.png\" alt=\"6k4LOH.md.png\" /></a></p>\n\n<p>点击下方 + 号选择Library</p>\n\n<p><a href=\"https://imgtu.com/i/6k4q6e\"><img src=\"https://s3.ax1x.com/2021/03/02/6k4q6e.md.png\" alt=\"6k4q6e.md.png\" /></a></p>\n\n<p>选择相关依赖架包，这里博主使用的是Tomcat8.5.31</p>\n\n<p><a href=\"https://imgtu.com/i/6k4HSO\"><img src=\"https://s3.ax1x.com/2021/03/02/6k4HSO.png\" alt=\"6k4HSO.png\" /></a></p>\n\n<p>成功！</p>\n\n<p>现在你可以用idea在jsp页面写java代码并且有智能提示~~</p>\n\n<p><a href=\"https://imgtu.com/i/6k4blD\"><img src=\"https://s3.ax1x.com/2021/03/02/6k4blD.md.png\" alt=\"6k4blD.md.png\" /></a></p>\n\n<p>如果还报错建议重启一下idea ?感谢观看！~</p>\n','2023-06-02 19:49:00.000000','56F0F1A1-83CC-4ABC-A257-6627E2B5DF63',128,19,0,'08db63f6-2ca0-4142-855a-7abfddf56860'),('BFF18AFC-DBD1-422C-B517-0A16E7D305BA','堪称有手就行系列(一)：从零开始搭建博客','<hr />\n\n<p>title: 堪称\"有手就行\"系列(一)：从零开始搭建博客\ndate: 2021-02-08 20:28:51\ntags: 博客搭建</p>\n\n<h2>categories: 软件安装与使用</h2>\n\n<h1>前言</h1>\n\n<p>终于做好自己的博客了，为此走了不少的弯路，而且在网上搭建个人博客更多的都是基于mac os，linux搭建，现将搭建博客过程中遇到的种种大坑做一个总结，做一个windows版本的搭建（不是网络上没有比我好的，而是现在版本更新迭代太快，版本不一样让人撞了不少墙[狗头]）,同时也能帮助自己理清思路，再有下次时不再走错！</p>\n\n<hr />\n\n<!--more-->\n\n<p>本文会从0搭建一个博客开始讲起，我会在下面步骤中做好提示，如果大家也有这种情况，也可以及时解决。</p>\n\n<p>本教程会从三个部分讲起</p>\n\n<p>​           一丶环境配置</p>\n\n<p>​           二丶搭建实践</p>\n\n<p>​           三、博客配置如主题、如何编写博文等</p>\n\n<p>系统环境：\n- 本人Windows10 64位系统\n- GitHub创建个人仓库\n- 安装Git\n- 安装Node.js\n- 安装Hexo博客框架</p>\n\n<p>​       </p>\n\n<h2>GitHub创建个人仓库</h2>\n\n<p>登录到GitHub,如果没有GitHub帐号，使用你的邮箱注册GitHub帐号\n创建好帐号之后，点击New新建仓库。</p>\n\n<p><a href=\"https://imgchr.com/i/yWqjpR\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqjpR.png\" alt=\"yWqjpR.png\" /></a></p>\n\n<p>注意：仓库名应该为：</p>\n\n<p><code>\n用户名.github.io\n</code></p>\n\n<p>这个用户名使用你的GitHub帐号名称代替，这是固定写法，比如我的仓库名为：</p>\n\n<p>​                                                                       <a href=\"https://imgchr.com/i/yWqLtJ\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqLtJ.png\" alt=\"yWqLtJ.png\" /></a></p>\n\n<h2>安装Git</h2>\n\n<p>什么是Git ?简单来说Git是开源的分布式版本控制系统，用于敏捷高效地处理项目。我们网站在本地搭建好了，需要使用Git同步到GitHub上。如果想要了解Git的细节，参看廖雪峰老师的Git教程：</p>\n\n<p>Git教程 从Git官网下载：<a href=\"https://git-scm.com/download/windows\">Git - Downloading Package</a> \n因“某不可抗力”因素，我推荐大家使用国内镜像下载或者在博主打包好的软件中下载（稍后提到）&lt;(￣︶￣)↗[GO!]\n现在的机子基本都是64位的，选择64位的安装包，下载后安装，在命令行里输入git测试是否安装成功: 打开cmd 输入</p>\n\n<p><code>\ngit --version\n</code></p>\n\n<p>​                                                                   <a href=\"https://imgchr.com/i/yWq560\"><img src=\"https://s3.ax1x.com/2021/02/18/yWq560.png\" alt=\"yWq560.png\" /></a></p>\n\n<p>若安装失败，参看其他详细的Git安装教程(～￣▽￣)～。</p>\n\n<p>安装成功后，将你的Git与GitHub帐号绑定，鼠标右击打开Git Bash</p>\n\n<p>​                                                               <a href=\"https://imgchr.com/i/yWqTmT\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqTmT.png\" alt=\"yWqTmT.png\" /></a></p>\n\n<p>打开Git Bash后，设置user.name和user.email配置信息： </p>\n\n<p>```\ngit config --global user.name \"你的GitHub用户名\"</p>\n\n<p>git config --global user.email \"你的GitHub注册邮箱\"\n```</p>\n\n<p>不返回任何信息即可视为成功！</p>\n\n<h2>生成ssh密钥文件</h2>\n\n<p><code>\nssh-keygen -t rsa -C \"你的GitHub注册邮箱\"\n</code></p>\n\n<p>然后直接三个回车即可，默认不需要设置密码\n然后找到生成的.ssh的文件夹中的id_rsa.pub密钥，将内容全部复制\n或者Git Bash中输入 </p>\n\n<p><code>\ncd ~/.ssh       #进入到.ssh目录下\ncat id_rsa.pub  #查看id_rsa.pub\n</code></p>\n\n<p><a href=\"https://imgchr.com/i/yWqIXV\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqIXV.png\" alt=\"yWqIXV.png\" /></a></p>\n\n<p>便可显示ssh密钥文件内容,而后鼠标选中右键点击copy即可复制</p>\n\n<p>打开<a href=\"https://github.com/settings/keys\">GitHub<em>Settings</em>Keys</a>页面，新建new SSH key\n这里博主已经添加过了，就不再演示</p>\n\n<p><a href=\"https://imgchr.com/i/yWqx6x\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqx6x.png\" alt=\"yWqx6x.png\" /></a></p>\n\n<p>随后点击进入自己的仓库，选择settings ，点击左列中的Deploy keys选项，add deploy key，也将自己的ssh密钥复制进去</p>\n\n<p><a href=\"https://imgchr.com/i/yWqv11\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqv11.png\" alt=\"yWqv11.png\" style=\"zoom:50%;\" /></a></p>\n\n<p>随后打开Git Bash检测GitHub公钥设置是否成功， 输入 </p>\n\n<p><code>\nssh git@github.com\n</code></p>\n\n<p>出现以下提示则代表输入配置成功（这里我已经配置过了）</p>\n\n<p><a href=\"https://imgchr.com/i/yWqOh9\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqOh9.png\" alt=\"yWqOh9.png\" /></a></p>\n\n<p>如上则说明成功。这里之所以设置GitHub密钥原因是，通过非对称加密的公钥与私钥来完成加密，公钥放置在GitHub上，私钥放置在自己的电脑里。GitHub要求每次推送代码都是合法用户，所以每次推送都需要输入账号密码验证推送用户是否是合法用户，为了省去每次输入密码的步骤，采用了ssh，当你推送的时候，git就会匹配你的私钥跟GitHub上面的公钥是否是配对的，若是匹配就认为你是合法用户，则允许推送。这样可以保证每次的推送都是正确合法的。</p>\n\n<h2>安装Node.js</h2>\n\n<p>Hexo基于Node.js，Node.js下载地址：<a href=\"https://nodejs.org/en/download/\">Download | Node.js</a> 下载安装包，注意安装Node.js会包含环境变量及npm的安装，安装后，检测Node.js是否安装成功，在命令行中输入</p>\n\n<p><code>\n node -v\n</code></p>\n\n<p>​                                                                       <a href=\"https://imgchr.com/i/yWq70U\"><img src=\"https://s3.ax1x.com/2021/02/18/yWq70U.png\" alt=\"yWq70U.png\" /></a></p>\n\n<p>检测npm是否安装成功，在命令行中输入</p>\n\n<p><code>\nnpm -v\n</code></p>\n\n<p>​                                                                       <a href=\"https://imgchr.com/i/yWqqk4\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqqk4.png\" alt=\"yWqqk4.png\" /></a></p>\n\n<p>这里我们第一次提到npm这个命令，这个命令很关键，我在搭建博客中碰到的不少坑都和npm这个命令有关，而且网上大多数教程都是使用npm这个命令，使我们搭建博客之旅迷雾重重，现知道解决办法是在npm中添加一个c，如cnpm。\n但在本次博客搭建过程中首先使用npm进行演示，如果大家自己实际搭建过程中碰到npm命令行有错误，则用cnpm代替</p>\n\n<p>至此，安装Hexo的环境已经全部搭建完成~~~</p>\n\n<h2>安装Hexo</h2>\n\n<p>Hexo就是我们的个人博客网站的框架， 这里需要自己在电脑常里创建一个文件夹，可以命名为Blog，Hexo框架与以后你自己发布的网页都在这个文件夹中。创建好后，进入文件夹中，右键点击空白进入Git Bash</p>\n\n<p>使用npm命令安装Hexo，输入：</p>\n\n<p><code>\n npm install -g hexo-cli  # [c]\n</code></p>\n\n<p>安装完成后，初始化我们的博客，输入：</p>\n\n<p><code>\nhexo init blog # 初始化并存入blog文件夹\n</code></p>\n\n<p>为了检测我们的网站雏形，分别按顺序输入以下三条命令：</p>\n\n<p>```\nhexo new 博文名字 # 新建一篇博客</p>\n\n<p>hexo generate # 生成网站静态文件到默认设置的 public 文件夹</p>\n\n<p>hexo server  #启动本地服务器，用于预览主题\n```</p>\n\n<p>打开浏览器输入地址：</p>\n\n<p><code>\nlocalhost:4000\n</code></p>\n\n<p><a href=\"https://imgchr.com/i/yWqH7F\"><img src=\"https://s3.ax1x.com/2021/02/18/yWqH7F.png\" alt=\"yWqH7F.png\" /></a></p>\n\n<p>可以看出我们写出第一篇博客，只不过我上图是我修改过的配置，和你的显示不一样。</p>\n\n<p>Hexo框架搭建完成~~?</p>\n\n<hr />\n\n<p>好了，搭建的前期工作至此全部完成，下一篇将详细介绍具体的搭建过程，主要包括怎么部署到git以及我在部署过程中遇到的种种困难[泪目]</p>\n','2023-06-02 19:49:00.000000','9D728073-080A-4AEF-8865-968BEC15D1CA',128,11,0,'08db640e-7de3-4f51-85ac-b8be1d5a7fb0'),('C58074AC-941A-48C6-8232-76C9FDA60BA4','浅学随记：http协议','<hr />\n\n<p>title: 浅学随记：http协议\ndate: 2021-02-19 16:57:12\ntags: http</p>\n\n<h2>categories: 编程学习</h2>\n\n<h1>前言</h1>\n\n<p>前段时间学习HTTP协议内容，它的一些格式，内容，包括Request和Response，现做一份总结，对自己的学习做一份记录。</p>\n\n<!--more-->\n\n<p>本文包括以下内容</p>\n\n<ol>\n<li><p><a href=\"httpone\">http是什么</a></p>\n\n<p>​        概念  </p>\n\n<p>​        特点</p></li>\n<li><p>http的模型</p>\n\n<p>​    请求</p>\n\n<p>​        格式：</p>\n\n<p>​            请求行</p>\n\n<p>​            请求体</p>\n\n<p>​            请求头</p>\n\n<p>​    响应</p>\n\n<p>​        格式：</p>\n\n<p>​            响应行</p>\n\n<p>​            响应体</p>\n\n<p>​            响应头</p></li>\n</ol>\n\n<div id=\"httpone\"> </div>\n\n<h1>http是什么？</h1>\n\n<h3>概念</h3>\n\n<p><strong>超文本传输协议（Hypertext Transfer Protocol，HTTP）</strong>是一个简单的请求-响应协议,它通常运行在<a href=\"https://baike.baidu.com/item/TCP/33012\">TCP</a>之上。</p>\n\n<p><code>\n    传输协议就是用来定义客户端和服务器端通信时，发送数据的格式\n</code></p>\n\n<p>而<strong>http</strong>它指定了客户端可能发送给服务器什么样的消息以及得到什么样的响应。请求和响应消息的头以<a href=\"https://baike.baidu.com/item/ASCII/309296\">ASCII</a>形式给出；而消息内容则具有一个类似<a href=\"https://baike.baidu.com/item/MIME/2900607\">MIME</a>的格式。这个简单模型是早期<a href=\"https://baike.baidu.com/item/Web/150564\">Web</a>成功的有功之臣，因为它使开发和部署非常地直截了当。</p>\n\n<h3>特点</h3>\n\n<ol>\n<li>​                基于TCP/IP的高级协议</li>\n<li>​                默认端口号:80</li>\n<li>​                基于请求/响应模型的:一次请求对应一次响应</li>\n<li>​                无状态的：每次请求之间相互独立，不能交互数据</li>\n</ol>\n\n<div id=\"httptwo\"></div>\n\n<h1>http的模型</h1>\n\n<p>http的模型分为两种，一直是<strong>请求</strong>模型，一种是<strong>响应</strong>模型，他们之间是一一对应的，也就是一次请求对应一次响应。</p>\n\n<h3>request对象和response对象的原理</h3>\n\n<ol>\n<li><p>request和response对象是由服务器创建的。我们来使用它们</p>\n\n<ol start=\"2\">\n<li>request对象是来获取请求消息</li>\n</ol></li>\n</ol>\n\n<p>​       response对象是来设置响应消息</p>\n\n<h3>请求模型Request</h3>\n\n<p>请求消息：客户端发送给服务器端的数据</p>\n\n<p><a href=\"https://imgchr.com/i/y73vFJ\"><img src=\"https://s3.ax1x.com/2021/02/22/y73vFJ.md.png\" alt=\"y73vFJ.md.png\" /></a></p>\n\n<h5>继承体结构:</h5>\n\n<p>​           ServletRequest  ->  HttpServletRequest ->  org.apache.catalina.connector.RequestFacade 类(tomcat)</p>\n\n<p>​       接口ServletRequest 被子接口HttpServletRequest继承，而最终由tomcat(一个免费的开放源代码的轻量级Web 应用服务器)创建的org.apache.catalina.connector.RequestFacade 类实现</p>\n\n<p><strong>请求行</strong>：</p>\n\n<p>①是请求方法，GET和POST是最常见的HTTP方法，除此以外还包括DELETE、HEAD、OPTIONS、PUT、TRACE。</p>\n\n<p>②为请求对应的URL地址，它和报文头的Host属性组成完整的请求URL。</p>\n\n<p>③是协议名称及版本号。</p>\n\n<h6><em>获取请求行数据</em></h6>\n\n<ol>\n<li>获取请求方式 ：GET</li>\n</ol>\n\n<p><code>java\n String getMethod()\n</code></p>\n\n<ol start=\"2\">\n<li>(*)获取虚拟目录：/day14</li>\n</ol>\n\n<p><code>java\n String getContextPath()\n</code></p>\n\n<ol start=\"3\">\n<li>获取Servlet路径: /demo1</li>\n</ol>\n\n<p><code>java\n String getServletPath()\n</code></p>\n\n<ol start=\"4\">\n<li>获取get方式请求参数：name=zhangsan</li>\n</ol>\n\n<p><code>java\n String getQueryString()\n</code></p>\n\n<ol start=\"5\">\n<li>(*)获取请求URI：/day14/demo1</li>\n</ol>\n\n<p>```java\nString getRequestURI()        /day14/demo1</p>\n\n<p>StringBuffer getRequestURL()   http://localhost/day14/demo1\n```</p>\n\n<p>* URL:统一资源定位符 ： http://localhost/day14/demo1    中华人民共和国</p>\n\n<p>* URI:统一资源标识符 :   /day14/demo1                               共和国</p>\n\n<p>注意：URI是比URL范围大的</p>\n\n<ol start=\"6\">\n<li>获取协议及版本：HTTP/1.1</li>\n</ol>\n\n<p><code>java\nString getProtocol()\n</code></p>\n\n<ol start=\"7\">\n<li>获取客户机的IP地址：</li>\n</ol>\n\n<p><code>java\nString getRemoteAddr()\n</code></p>\n\n<p><strong>请求头：</strong></p>\n\n<p>④是HTTP的报文头，报文头包含若干个属性，格式为“属性名:属性值”，服务端据此获取客户端的信息。</p>\n\n<p>与缓存相关的规则信息，均包含在header中</p>\n\n<h6><em>获取请求头数据</em></h6>\n\n<p>通过请求头的名称获取请求头的值</p>\n\n<p><code>java\nString getHeader(String name)\n</code></p>\n\n<p>获取所有的请求头名称</p>\n\n<p><code>java\nEnumeration&lt;String&gt; getHeaderNames()\n</code></p>\n\n<p><strong>请求体：</strong></p>\n\n<p>⑤是报文体，它将一个页面表单中的组件值通过param1=value1&amp;param2=value2的键值对形式编码成一个格式化串，它承载多个请求参数的数据。不但报文体可以传递请求参数，请求URL也可以通过类似于“/chapter15/user.html? param1=value1&amp;param2=value2”的方式传递请求参数。</p>\n\n<p><strong>只有POST请求方式，才有请求体，在请求体中封装了POST请求的请求参数</strong></p>\n\n<h6><em>获取请求体数据</em></h6>\n\n<ol>\n<li><p>获取流对象</p>\n\n<p>获取字符输入流，只能操作字符数据</p>\n\n<p><code>java\nBufferedReader getReader()\n</code></p>\n\n<p>获取字节输入流，可以操作所有类型数据</p>\n\n<p><code>java\nServletInputStream getInputStream()\n</code></p></li>\n<li><p>再从流对象中拿数据</p></li>\n</ol>\n\n<p>例子：</p>\n\n<p>```java\n//获取请求消息体</p>\n\n<p>//1.获取字符流\nBufferedReader br = req.getReader();\n//2.读取数据\nString line = null;\nwhile ((line = br.readLine()) != null) {\n    System.out.println(line);\n}\n```</p>\n\n<h3>响应模型Response</h3>\n\n<p>响应消息：服务器端发送给客户端的数据</p>\n\n<p><a href=\"https://imgchr.com/i/y73Xo4\"><img src=\"https://s3.ax1x.com/2021/02/22/y73Xo4.png\" alt=\"y73Xo4.png\" /></a></p>\n\n<p><strong>响应行</strong></p>\n\n<ol>\n<li><p>组成：协议/版本 响应状态码 状态码描述</p></li>\n<li><p>响应状态码：服务器告诉客户端浏览器本次请求和响应的一个状态。</p>\n\n<p>1. 状态码都是3位数字</p>\n\n<p>2. 分类：</p>\n\n<p>​    1. 1xx：服务器接收客户端消息，但没有接受完成，等待一段时间后，发送1xx多状态码</p>\n\n<p>​    2. 2xx：成功。代表：200</p>\n\n<p>​    3. 3xx：重定向。代表：302(重定向)，304(访问缓存)</p>\n\n<p>​    4. 4xx：客户端错误。</p>\n\n<p>​        * 代表：</p>\n\n<p>​            * 404:（请求路径没有对应的资源） </p>\n\n<p>​            * 405：请求方式没有对应的doXxx方法</p>\n\n<p>​    5. 5xx：服务器端错误。代表：500(服务器内部出现异常)</p></li>\n</ol>\n\n<p><em>设置响应行</em></p>\n\n<p>​       设置状态码：</p>\n\n<p><code>java\nvoid setStatus(int sc)\n</code></p>\n\n<p><strong>响应体</strong></p>\n\n<p>​   传输的数据</p>\n\n<p>​   </p>\n\n<p>​   <em>设置响应体</em></p>\n\n<p>​       1. 获取输出流</p>\n\n<p>​           * 字符输出流：</p>\n\n<p><code>java\nPrintWriter getWriter()\n</code></p>\n\n<p>​           * 字节输出流：</p>\n\n<p><code>java\nServletOutputStream getOutputStream()\n</code></p>\n\n<p>​       2. 使用输出流，将数据输出到客户端浏览器</p>\n\n<p><strong>响应头</strong></p>\n\n<p>格式：    头名称:值</p>\n\n<p>常见的响应头：</p>\n\n<ol>\n<li><p>Content-Type：服务器告诉客户端本次响应体数据格式以及编码格式</p></li>\n<li><p>Content-disposition：服务器告诉客户端以什么格式打开响应体数据</p>\n\n<p>* 值：</p>\n\n<p>* in-line:默认值,在当前页面内打开</p>\n\n<p>* attachment;filename=xxx：以附件形式打开响应体。--> 用于文件下载</p></li>\n</ol>\n\n<p><em>设置响应头</em></p>\n\n<p><code>java\n    setHeader(String name, String value)\n</code></p>\n\n<p>例子：</p>\n\n<p><code>java\n//设置状态码\nresp.setStatus(302);\n//设置地址\nresp.setHeader(\"location\",\"/day15/responseDemo03\");\n</code></p>\n\n<hr />\n\n<h4>forward 和 redirect 区别</h4>\n\n<p>重定向的特点：redirect</p>\n\n<ol>\n<li><p>地址栏发生变化</p></li>\n<li><p>重定向可以访问其他站点(服务器)的资源</p></li>\n<li><p>重定向是两次请求，不能使用request对象来共享数据</p></li>\n</ol>\n\n<p>转发的特点：forward</p>\n\n<ol>\n<li><p>转发地址栏路径不变</p></li>\n<li><p>转发只能访问当前服务器下的资源</p></li>\n<li><p>转发是一次请求，可以使用request对象来共享数据</p></li>\n</ol>\n','2023-06-02 19:49:00.000000','227B9121-AC7A-4E53-BCE8-32BB77399A98',128,19,0,'08db640e-7de3-4f51-85ac-b8be1d5a7fb0'),('FAF5B6C7-E9C7-4434-A08C-1F50DE388F4A','java学习之旅：关于idea2020创建javaweb项目','<hr />\n\n<p>title: java学习之旅：关于idea2020创建javaweb项目\ndate: 2021-02-11 17:12:19\ntags: Java学习之旅</p>\n\n<h2>categories: 软件安装与使用</h2>\n\n<h1>前言</h1>\n\n<p>博主在学习javaweb时，发现idea2020.3.1版本中创建web项目和以往idea 的不同，因博主学习的视频采用的是2017版本，但本人使用2020版本，因这个创建web项目问题导致又得面向百度，平白浪费了点时间，本博文对此操作进行记录，如果有小伙伴有这种情况也可供参照~</p>\n\n<hr />\n\n<!--more-->\n\n<h2>IDEA2017版本创建图</h2>\n\n<p>咱们直接进入正题，看图，因为2017及以下版本如何创建相信大家都有经验，重点是在2020.3.1版本如果创建</p>\n\n<p><a href=\"https://imgchr.com/i/yWLaHU\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLaHU.md.png\" alt=\"yWLaHU.md.png\" /></a></p>\n\n<p>上面可以直接调Java EE版本，可以直接勾选web application并选择版本</p>\n\n<h2>IDEA2020版本创建图</h2>\n\n<p>而在2020.3.1中则是这样：</p>\n\n<p><a href=\"https://imgchr.com/i/yWLNuV\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLNuV.md.png\" alt=\"yWLNuV.md.png\" /></a></p>\n\n<p>虽说相应的都会给你处理好，但是博主本人处于学习阶段，并不是已经出神入化的那种大佬，仍需要按照老师的步骤理解消化~~ = =</p>\n\n<p>闲话少说咱们直接开始嗷~</p>\n\n<p>第一步：</p>\n\n<p>选择创建普通的java项目</p>\n\n<p><a href=\"https://imgchr.com/i/yWLwEF\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLwEF.md.png\" alt=\"yWLwEF.md.png\" /></a></p>\n\n<p>第二步：</p>\n\n<p>选中刚才创建好的项目，右键点击选择 Add Framework Support...(第二个)</p>\n\n<p><a href=\"https://imgchr.com/i/yWLJcq\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLJcq.png\" alt=\"yWLJcq.png\" /></a></p>\n\n<p>第三步：</p>\n\n<p>​   在弹出的界面中可以根据需求调节Java EE版本号，javaee8后才是创建servlet4.0，7是3.1</p>\n\n<p><a href=\"https://imgchr.com/i/yWLUBT\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLUBT.md.png\" alt=\"yWLUBT.md.png\" /></a></p>\n\n<p>第四步：</p>\n\n<p>​   勾选 Web Application 并选择servlet版本</p>\n\n<p><a href=\"https://imgchr.com/i/yWLYj0\"><img src=\"https://s3.ax1x.com/2021/02/18/yWLYj0.md.png\" alt=\"yWLYj0.md.png\" /></a></p>\n\n<p>ok之后，web项目创建完成</p>\n\n<p><a href=\"https://imgchr.com/i/yWL0N4\"><img src=\"https://s3.ax1x.com/2021/02/18/yWL0N4.png\" alt=\"yWL0N4.png\" /></a></p>\n\n<hr />\n\n<p>如有错误欢迎指正交流，谢谢观看！?</p>\n','2023-06-02 19:49:00.000000','56F0F1A1-83CC-4ABC-A257-6627E2B5DF63',128,19,0,'08db640e-7de3-4f51-85ac-b8be1d5a7fb0');
/*!40000 ALTER TABLE `t_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_articletype`
--

DROP TABLE IF EXISTS `t_articletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_articletype` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TypeName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_articletype`
--

LOCK TABLES `t_articletype` WRITE;
/*!40000 ALTER TABLE `t_articletype` DISABLE KEYS */;
INSERT INTO `t_articletype` VALUES ('227B9121-AC7A-4E53-BCE8-32BB77399A98','Http协议',0),('56F0F1A1-83CC-4ABC-A257-6627E2B5DF63','Java',0),('9D728073-080A-4AEF-8865-968BEC15D1CA','博客搭建',0);
/*!40000 ALTER TABLE `t_articletype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-05 16:07:21
