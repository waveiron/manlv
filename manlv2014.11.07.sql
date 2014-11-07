-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2014 at 04:36 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+8:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `manlv`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE IF NOT EXISTS `brands` (
`brand_id` smallint(5) unsigned NOT NULL,
  `brand_name` varchar(64) NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `craft_types`
--

CREATE TABLE IF NOT EXISTS `craft_types` (
`craft_type_id` smallint(5) unsigned NOT NULL,
  `craft_type` varchar(32) NOT NULL,
  `price` int(11) NOT NULL,
  `could_be_customized` smallint(6) NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cus_products_properties`
--

CREATE TABLE IF NOT EXISTS `cus_products_properties` (
  `property_id` int(10) unsigned NOT NULL,
  `property_name` varchar(255) NOT NULL,
  `category_l4_id` smallint(5) unsigned NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cus_tables`
--

CREATE TABLE IF NOT EXISTS `cus_tables` (
  `table_id` int(10) unsigned NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `descriptions`
--

CREATE TABLE IF NOT EXISTS `descriptions` (
`description_id` bigint(20) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `description_types`
--

CREATE TABLE IF NOT EXISTS `description_types` (
`type_id` int(10) unsigned NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE IF NOT EXISTS `discounts` (
`discount_type_id` smallint(5) unsigned NOT NULL,
  `discount_type` varchar(64) NOT NULL,
  `discount` double NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `photo_types`
--

CREATE TABLE IF NOT EXISTS `photo_types` (
`type_id` int(10) unsigned NOT NULL,
  `type` varchar(64) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`product_id` bigint(20) unsigned NOT NULL COMMENT 'product id',
  `specified_id` varchar(32) NOT NULL COMMENT 'sufix of product category (product number)',
  `color` varchar(32) NOT NULL,
  `peice_weight` int(11) DEFAULT NULL,
  `substance` varchar(32) DEFAULT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_admin_users`
--

CREATE TABLE IF NOT EXISTS `rt_admin_users` (
`r_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `permission_level` smallint(6) NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_products_brands`
--

CREATE TABLE IF NOT EXISTS `rt_products_brands` (
`r_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `brand_id` smallint(5) unsigned NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_products_categories_l1`
--

CREATE TABLE IF NOT EXISTS `rt_products_categories_l1` (
`category_l1_id` smallint(5) unsigned NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_products_categories_l2`
--

CREATE TABLE IF NOT EXISTS `rt_products_categories_l2` (
`category_l2_id` smallint(5) unsigned NOT NULL,
  `parent_id` smallint(5) unsigned NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `category_name` varchar(255) NOT NULL,
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_products_categories_l3`
--

CREATE TABLE IF NOT EXISTS `rt_products_categories_l3` (
`category_l3_id` smallint(5) unsigned NOT NULL,
  `parent_id` smallint(5) unsigned NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_products_categories_l4`
--

CREATE TABLE IF NOT EXISTS `rt_products_categories_l4` (
`category_l4_id` smallint(5) unsigned NOT NULL,
  `parent_id` smallint(5) unsigned NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_products_craft_types`
--

CREATE TABLE IF NOT EXISTS `rt_products_craft_types` (
`r_id` bigint(20) unsigned NOT NULL,
  `craft_type_id` smallint(5) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_products_discounts`
--

CREATE TABLE IF NOT EXISTS `rt_products_discounts` (
`r_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `discount_type_id` smallint(5) unsigned NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_products_discription`
--

CREATE TABLE IF NOT EXISTS `rt_products_discription` (
`r_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `title` varchar(64) NOT NULL,
  `descreption` text,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_products_main_photos`
--

CREATE TABLE IF NOT EXISTS `rt_products_main_photos` (
`r_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `sequence_number` int(10) unsigned NOT NULL,
  `address` varchar(255) NOT NULL,
  `descreption` text,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_products_tags`
--

CREATE TABLE IF NOT EXISTS `rt_products_tags` (
`r_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `tag_id` smallint(5) unsigned NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_users_addresses`
--

CREATE TABLE IF NOT EXISTS `rt_users_addresses` (
`r_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `province` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `detail` text,
  `is_default` smallint(1) unsigned NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_users_partners`
--

CREATE TABLE IF NOT EXISTS `rt_users_partners` (
`partner_id` int(255) unsigned NOT NULL COMMENT 'user''s partner''s id',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'user''s id',
  `given_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `id_card_number` varchar(32) DEFAULT NULL,
  `birth_date` bigint(12) unsigned DEFAULT NULL COMMENT 'user''s bithdate (unix timestamp)',
  `phone_number` varchar(32) DEFAULT NULL,
  `qq_number` varchar(255) DEFAULT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_users_shopping_cart_items`
--

CREATE TABLE IF NOT EXISTS `rt_users_shopping_cart_items` (
`r_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_users_types`
--

CREATE TABLE IF NOT EXISTS `rt_users_types` (
`r_id` bigint(20) unsigned NOT NULL,
  `type_id` smallint(5) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_users_wish_items`
--

CREATE TABLE IF NOT EXISTS `rt_users_wish_items` (
`r_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
`tag_id` smallint(5) unsigned NOT NULL,
  `tag_title` varchar(64) NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` bigint(20) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(32) DEFAULT NULL,
  `qq_number` varchar(255) DEFAULT NULL,
  `gender` smallint(1) unsigned DEFAULT NULL COMMENT '1 stands for male, 0 stands for female',
  `partner_id` bigint(32) unsigned DEFAULT NULL COMMENT 'current user''s partner id',
  `given_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `id_card_number` varchar(32) DEFAULT NULL,
  `birth_date` bigint(12) unsigned DEFAULT NULL COMMENT 'user''s bithdate (unix timestamp)',
  `signup_time` bigint(12) unsigned DEFAULT NULL COMMENT 'user''s signup time unix timestamp',
  `last_login_time` bigint(12) unsigned DEFAULT NULL,
  `email_verify_code` varchar(255) DEFAULT NULL COMMENT 'use for identify user when submit signup',
  `wedding_anniversary` date DEFAULT NULL COMMENT 'user''s wedding anniversary date',
  `default_address_id` smallint(5) unsigned DEFAULT NULL COMMENT 'user''s default_address id',
  `is_admin` smallint(5) unsigned DEFAULT '0' COMMENT 'whether current user using admin account',
  `visible` smallint(5) unsigned DEFAULT '1' COMMENT 'whether user account is frozen',
  `last_modify_time` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users_types`
--

CREATE TABLE IF NOT EXISTS `users_types` (
`type_id` smallint(5) unsigned NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `visible` smallint(5) unsigned DEFAULT '1',
  `create_time` bigint(20) unsigned NOT NULL,
  `last_modify_time` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `last_modifier_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
 ADD PRIMARY KEY (`brand_id`), ADD KEY `fk_brands_creator_id` (`creator_id`), ADD KEY `fk_brands_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `craft_types`
--
ALTER TABLE `craft_types`
 ADD PRIMARY KEY (`craft_type_id`), ADD KEY `fk_craft_types_creator_id` (`creator_id`), ADD KEY `fk_craft_types_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `cus_products_properties`
--
ALTER TABLE `cus_products_properties`
 ADD PRIMARY KEY (`property_id`), ADD KEY `fk_cus_products_properties_category_l4_id` (`category_l4_id`), ADD KEY `fk_cus_products_properties_creator_id` (`creator_id`), ADD KEY `fk_cus_products_properties_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `cus_tables`
--
ALTER TABLE `cus_tables`
 ADD PRIMARY KEY (`table_id`), ADD KEY `fk_cus_tables_creator_id` (`creator_id`), ADD KEY `fk_cus_tables_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `descriptions`
--
ALTER TABLE `descriptions`
 ADD PRIMARY KEY (`description_id`), ADD KEY `fk_descriptions_type_id` (`type_id`), ADD KEY `fk_descriptions_creator_id` (`creator_id`), ADD KEY `fk_descriptions_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `description_types`
--
ALTER TABLE `description_types`
 ADD PRIMARY KEY (`type_id`), ADD KEY `fk_description_types_creator_id` (`creator_id`), ADD KEY `fk_description_types_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
 ADD PRIMARY KEY (`discount_type_id`), ADD KEY `fk_discounts_creator_id` (`creator_id`), ADD KEY `fk_discounts_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `photo_types`
--
ALTER TABLE `photo_types`
 ADD PRIMARY KEY (`type_id`), ADD KEY `fk_photo_types_creator_id` (`creator_id`), ADD KEY `fk_photo_types_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`product_id`), ADD KEY `fk_products_creator_id` (`creator_id`), ADD KEY `fk_products_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `rt_admin_users`
--
ALTER TABLE `rt_admin_users`
 ADD PRIMARY KEY (`r_id`), ADD KEY `fk_rt_admin_user_user_id` (`user_id`), ADD KEY `fk_rt_admin_users_creator_id` (`creator_id`), ADD KEY `fk_rt_admin_users_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `rt_products_brands`
--
ALTER TABLE `rt_products_brands`
 ADD PRIMARY KEY (`r_id`), ADD KEY `fk_rt_products_brands_product_id` (`product_id`), ADD KEY `fk_rt_products_brands_brand_id` (`brand_id`), ADD KEY `fk_rt_product_brand_creator_id` (`creator_id`), ADD KEY `fk_rt_product_brand_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `rt_products_categories_l1`
--
ALTER TABLE `rt_products_categories_l1`
 ADD PRIMARY KEY (`category_l1_id`), ADD KEY `fk_rt_products_categories_l1_creator_id` (`creator_id`), ADD KEY `fk_rt_products_categories_l1_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `rt_products_categories_l2`
--
ALTER TABLE `rt_products_categories_l2`
 ADD PRIMARY KEY (`category_l2_id`), ADD KEY `fk_rt_products_categories_l2_parent_id` (`parent_id`), ADD KEY `fk_rt_products_categories_l2_creator_id` (`creator_id`), ADD KEY `fk_rt_products_categories_l2_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `rt_products_categories_l3`
--
ALTER TABLE `rt_products_categories_l3`
 ADD PRIMARY KEY (`category_l3_id`), ADD KEY `fk_rt_products_categories_l3_parent_id` (`parent_id`), ADD KEY `fk_rt_products_categories_l3_creator_id` (`creator_id`), ADD KEY `fk_rt_products_categories_l3_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `rt_products_categories_l4`
--
ALTER TABLE `rt_products_categories_l4`
 ADD PRIMARY KEY (`category_l4_id`), ADD KEY `fk_rt_products_categories_l4_parent_id` (`parent_id`), ADD KEY `fk_rt_products_categories_l4_creator_id` (`creator_id`), ADD KEY `fk_rt_products_categories_l4_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `rt_products_craft_types`
--
ALTER TABLE `rt_products_craft_types`
 ADD PRIMARY KEY (`r_id`), ADD UNIQUE KEY `ui_rt_product_craft_types` (`craft_type_id`,`product_id`), ADD KEY `fk_rt_product_craft_type_product_id` (`product_id`), ADD KEY `fk_rt_product_craft_types_creator_id` (`creator_id`), ADD KEY `fk_rt_product_craft_types_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `rt_products_discounts`
--
ALTER TABLE `rt_products_discounts`
 ADD PRIMARY KEY (`r_id`), ADD KEY `fk_rt_product_discounts_discount_type_id` (`discount_type_id`), ADD KEY `fk_rt_product_discounts_product_id` (`product_id`), ADD KEY `fk_rt_product_discounts_creator_id` (`creator_id`), ADD KEY `fk_rt_product_discounts_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `rt_products_discription`
--
ALTER TABLE `rt_products_discription`
 ADD PRIMARY KEY (`r_id`), ADD KEY `fk_rt_product_discription_product_id` (`product_id`), ADD KEY `fk_rt_product_discription_creator_id` (`creator_id`), ADD KEY `fk_rt_product_discription_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `rt_products_main_photos`
--
ALTER TABLE `rt_products_main_photos`
 ADD PRIMARY KEY (`r_id`), ADD KEY `fk_rt_products_main_photo_product_id` (`product_id`), ADD KEY `fk_rt_products_main_photo_type_id` (`type_id`), ADD KEY `fk_rt_products_main_photo_creator_id` (`creator_id`), ADD KEY `fk_rt_products_main_photo_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `rt_products_tags`
--
ALTER TABLE `rt_products_tags`
 ADD PRIMARY KEY (`r_id`), ADD KEY `fk_rt_products_tags_product_id` (`product_id`), ADD KEY `fk_rt_products_tags_tag_id` (`tag_id`);

--
-- Indexes for table `rt_users_addresses`
--
ALTER TABLE `rt_users_addresses`
 ADD PRIMARY KEY (`r_id`), ADD KEY `fk_rt_users_address_user_id` (`user_id`), ADD KEY `fk_rt_users_addresses_creator_id` (`creator_id`), ADD KEY `fk_rt_users_addresses_last_modifier_id` (`last_modifier_id`), ADD KEY `i_province` (`province`), ADD KEY `i_city` (`city`);

--
-- Indexes for table `rt_users_partners`
--
ALTER TABLE `rt_users_partners`
 ADD PRIMARY KEY (`partner_id`), ADD UNIQUE KEY `ui_id_card_number` (`id_card_number`), ADD KEY `fk_rt_users_partners_user_id` (`user_id`), ADD KEY `fk_rt_users_partners_creator_id` (`creator_id`), ADD KEY `fk_rt_users_partners_last_modifier_id` (`last_modifier_id`), ADD KEY `i_phone_number` (`phone_number`), ADD KEY `i_qq_number` (`qq_number`);

--
-- Indexes for table `rt_users_shopping_cart_items`
--
ALTER TABLE `rt_users_shopping_cart_items`
 ADD PRIMARY KEY (`r_id`), ADD KEY `fk_rt_users_shopping_cart_item_user_id` (`user_id`), ADD KEY `fk_rt_users_shopping_cart_item_product_id` (`product_id`), ADD KEY `fk_rt_users_shopping_cart_items_creator_id` (`creator_id`), ADD KEY `fk_rt_users_shopping_cart_items_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `rt_users_types`
--
ALTER TABLE `rt_users_types`
 ADD PRIMARY KEY (`r_id`), ADD UNIQUE KEY `i_type_id` (`type_id`), ADD KEY `fk_rt_users_types_user_id` (`user_id`), ADD KEY `fk_rt_users_types_creator_id` (`creator_id`), ADD KEY `fk_rt_users_types_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `rt_users_wish_items`
--
ALTER TABLE `rt_users_wish_items`
 ADD PRIMARY KEY (`r_id`), ADD UNIQUE KEY `ui_users_wish_items_pair` (`user_id`,`product_id`), ADD KEY `fk_rt_users_wish_item_product_id` (`product_id`), ADD KEY `fk_rt_users_wish_items_creator_id` (`creator_id`), ADD KEY `fk_rt_users_wish_items_modifier` (`last_modifier_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
 ADD PRIMARY KEY (`tag_id`), ADD KEY `fk_tags_creator_id` (`creator_id`), ADD KEY `fk_tags_last_modifier_id` (`last_modifier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `ui_username` (`username`), ADD UNIQUE KEY `ui_id_card_number` (`id_card_number`), ADD KEY `i_phone_number` (`phone_number`);

--
-- Indexes for table `users_types`
--
ALTER TABLE `users_types`
 ADD PRIMARY KEY (`type_id`), ADD KEY `fk_users_types_creator_id` (`creator_id`), ADD KEY `fk_users_types_last_modifier_id` (`last_modifier_id`), ADD KEY `ui_type_name` (`type_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
MODIFY `brand_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_types`
--
ALTER TABLE `craft_types`
MODIFY `craft_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `descriptions`
--
ALTER TABLE `descriptions`
MODIFY `description_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `description_types`
--
ALTER TABLE `description_types`
MODIFY `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
MODIFY `discount_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `photo_types`
--
ALTER TABLE `photo_types`
MODIFY `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `product_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'product id';
--
-- AUTO_INCREMENT for table `rt_admin_users`
--
ALTER TABLE `rt_admin_users`
MODIFY `r_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_products_brands`
--
ALTER TABLE `rt_products_brands`
MODIFY `r_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_products_categories_l1`
--
ALTER TABLE `rt_products_categories_l1`
MODIFY `category_l1_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_products_categories_l2`
--
ALTER TABLE `rt_products_categories_l2`
MODIFY `category_l2_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_products_categories_l3`
--
ALTER TABLE `rt_products_categories_l3`
MODIFY `category_l3_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_products_categories_l4`
--
ALTER TABLE `rt_products_categories_l4`
MODIFY `category_l4_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_products_craft_types`
--
ALTER TABLE `rt_products_craft_types`
MODIFY `r_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_products_discounts`
--
ALTER TABLE `rt_products_discounts`
MODIFY `r_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_products_discription`
--
ALTER TABLE `rt_products_discription`
MODIFY `r_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_products_main_photos`
--
ALTER TABLE `rt_products_main_photos`
MODIFY `r_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_products_tags`
--
ALTER TABLE `rt_products_tags`
MODIFY `r_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_users_addresses`
--
ALTER TABLE `rt_users_addresses`
MODIFY `r_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_users_partners`
--
ALTER TABLE `rt_users_partners`
MODIFY `partner_id` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT 'user''s partner''s id';
--
-- AUTO_INCREMENT for table `rt_users_shopping_cart_items`
--
ALTER TABLE `rt_users_shopping_cart_items`
MODIFY `r_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_users_types`
--
ALTER TABLE `rt_users_types`
MODIFY `r_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_users_wish_items`
--
ALTER TABLE `rt_users_wish_items`
MODIFY `r_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
MODIFY `tag_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_types`
--
ALTER TABLE `users_types`
MODIFY `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
ADD CONSTRAINT `fk_brands_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_brands_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_types`
--
ALTER TABLE `craft_types`
ADD CONSTRAINT `fk_craft_types_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_craft_types_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cus_products_properties`
--
ALTER TABLE `cus_products_properties`
ADD CONSTRAINT `fk_cus_products_properties_category_l4_id` FOREIGN KEY (`category_l4_id`) REFERENCES `rt_products_categories_l4` (`category_l4_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_cus_products_properties_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_cus_products_properties_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cus_tables`
--
ALTER TABLE `cus_tables`
ADD CONSTRAINT `fk_cus_tables_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_cus_tables_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `descriptions`
--
ALTER TABLE `descriptions`
ADD CONSTRAINT `fk_descriptions_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_descriptions_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_descriptions_type_id` FOREIGN KEY (`type_id`) REFERENCES `description_types` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `description_types`
--
ALTER TABLE `description_types`
ADD CONSTRAINT `fk_description_types_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_description_types_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discounts`
--
ALTER TABLE `discounts`
ADD CONSTRAINT `fk_discounts_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_discounts_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photo_types`
--
ALTER TABLE `photo_types`
ADD CONSTRAINT `fk_photo_types_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_photo_types_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
ADD CONSTRAINT `fk_products_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_products_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_admin_users`
--
ALTER TABLE `rt_admin_users`
ADD CONSTRAINT `fk_rt_admin_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_admin_users_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_admin_users_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_products_brands`
--
ALTER TABLE `rt_products_brands`
ADD CONSTRAINT `fk_rt_product_brand_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_product_brand_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_products_brands_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_products_brands_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_products_categories_l1`
--
ALTER TABLE `rt_products_categories_l1`
ADD CONSTRAINT `fk_rt_products_categories_l1_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_products_categories_l1_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_products_categories_l2`
--
ALTER TABLE `rt_products_categories_l2`
ADD CONSTRAINT `fk_rt_products_categories_l2_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_products_categories_l2_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_products_categories_l2_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `rt_products_categories_l1` (`category_l1_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_products_categories_l3`
--
ALTER TABLE `rt_products_categories_l3`
ADD CONSTRAINT `fk_rt_products_categories_l3_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_products_categories_l3_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_products_categories_l3_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `rt_products_categories_l2` (`category_l2_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_products_categories_l4`
--
ALTER TABLE `rt_products_categories_l4`
ADD CONSTRAINT `fk_rt_products_categories_l4_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_products_categories_l4_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_products_categories_l4_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `rt_products_categories_l3` (`category_l3_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_products_craft_types`
--
ALTER TABLE `rt_products_craft_types`
ADD CONSTRAINT `fk_rt_product_craft_type_craft_type_id` FOREIGN KEY (`craft_type_id`) REFERENCES `craft_types` (`craft_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_product_craft_type_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_product_craft_types_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_product_craft_types_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_products_discounts`
--
ALTER TABLE `rt_products_discounts`
ADD CONSTRAINT `fk_rt_product_discounts_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_product_discounts_discount_type_id` FOREIGN KEY (`discount_type_id`) REFERENCES `discounts` (`discount_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_product_discounts_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_product_discounts_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_products_discription`
--
ALTER TABLE `rt_products_discription`
ADD CONSTRAINT `fk_rt_product_discription_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_product_discription_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_product_discription_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_products_main_photos`
--
ALTER TABLE `rt_products_main_photos`
ADD CONSTRAINT `fk_rt_products_main_photo_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_products_main_photo_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_products_main_photo_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_products_main_photo_type_id` FOREIGN KEY (`type_id`) REFERENCES `photo_types` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_products_tags`
--
ALTER TABLE `rt_products_tags`
ADD CONSTRAINT `fk_rt_products_tags_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_products_tags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_users_addresses`
--
ALTER TABLE `rt_users_addresses`
ADD CONSTRAINT `fk_rt_users_address_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_users_addresses_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_users_addresses_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_users_partners`
--
ALTER TABLE `rt_users_partners`
ADD CONSTRAINT `fk_rt_users_partners_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_users_partners_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_users_partners_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_users_shopping_cart_items`
--
ALTER TABLE `rt_users_shopping_cart_items`
ADD CONSTRAINT `fk_rt_users_shopping_cart_item_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_users_shopping_cart_item_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_users_shopping_cart_items_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_users_shopping_cart_items_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_users_types`
--
ALTER TABLE `rt_users_types`
ADD CONSTRAINT `fk_rt_users_types_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_users_types_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_users_types_type_id` FOREIGN KEY (`type_id`) REFERENCES `users_types` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_users_types_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rt_users_wish_items`
--
ALTER TABLE `rt_users_wish_items`
ADD CONSTRAINT `fk_rt_users_wish_item_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_users_wish_item_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_users_wish_items_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_rt_users_wish_items_modifier` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
ADD CONSTRAINT `fk_tags_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tags_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_types`
--
ALTER TABLE `users_types`
ADD CONSTRAINT `fk_users_types_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_users_types_last_modifier_id` FOREIGN KEY (`last_modifier_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
