-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.6.10-log - MySQL Community Server (GPL)
-- ОС Сервера:                   Win32
-- HeidiSQL Версия:              7.0.0.4381
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных gb_php_lvl_1
CREATE DATABASE IF NOT EXISTS `gb_php_lvl_1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gb_php_lvl_1`;


-- Дамп структуры для таблица gb_php_lvl_1.basket
CREATE TABLE IF NOT EXISTS `basket` (
  `id_basket` int(10) NOT NULL AUTO_INCREMENT,
  `id_good` int(10) NOT NULL DEFAULT '0',
  `id_order` int(10) DEFAULT NULL,
  `id_user` int(10) NOT NULL DEFAULT '0',
  `price` int(10) NOT NULL DEFAULT '0',
  `is_in_order` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_basket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица gb_php_lvl_1.books
CREATE TABLE IF NOT EXISTS `books` (
  `id_book` int(10) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_book`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица gb_php_lvl_1.feedback
CREATE TABLE IF NOT EXISTS `feedback` (
  `id_feedback` int(10) NOT NULL AUTO_INCREMENT,
  `feedback_body` text,
  `feedback_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='`id_feedback`, `feedback_body`, `feedback_user`';

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица gb_php_lvl_1.goods
CREATE TABLE IF NOT EXISTS `goods` (
  `id_good` int(10) NOT NULL AUTO_INCREMENT,
  `good_name` varchar(50) DEFAULT NULL,
  `good_description` varchar(50) DEFAULT NULL,
  `good_price` int(10) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_good`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица gb_php_lvl_1.news
CREATE TABLE IF NOT EXISTS `news` (
  `id_news` int(10) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(50) DEFAULT NULL,
  `news_preview` varchar(50) DEFAULT NULL,
  `news_content` text,
  PRIMARY KEY (`id_news`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица gb_php_lvl_1.order
CREATE TABLE IF NOT EXISTS `order` (
  `id_order` int(10) NOT NULL AUTO_INCREMENT,
  `id_user` int(10) NOT NULL DEFAULT '0',
  `amount` int(10) NOT NULL DEFAULT '0',
  `id_status` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица gb_php_lvl_1.role
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица gb_php_lvl_1.status
CREATE TABLE IF NOT EXISTS `status` (
  `id_status` int(10) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица gb_php_lvl_1.user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL DEFAULT '0',
  `user_login` varchar(50) NOT NULL DEFAULT '0',
  `user_password` text NOT NULL,
  `user_last_action` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='INSERT INTO `user` (`id_user`, `user_name`, `user_login`, `user_password`, `user_last_action`) VALUES\r\n	(1, ''admin'', ''admin'', ''$2a$08$ZDYxOGU5ODA0YTk3M2Y1YugWWmWSZ0TTigwlFqe7TePdk6KanN5WS'', ''0000-00-00 00:00:00'');';

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица gb_php_lvl_1.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `id_user_role` int(10) NOT NULL AUTO_INCREMENT,
  `id_role` int(10) NOT NULL DEFAULT '0',
  `id_user` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
