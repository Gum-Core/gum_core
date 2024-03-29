/*
Navicat MySQL Data Transfer

Source Server         : RedWest_Windows_copy_copy
Source Server Version : 100421
Source Host           : 51.68.190.184:3306
Source Database       : redwest

Target Server Type    : MYSQL
Target Server Version : 100421
File Encoding         : 65001

Date: 2022-03-07 11:09:15
*/

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `bank_users` (
  `identifier` varchar(50) DEFAULT '0',
  `charidentifier` varchar(5) DEFAULT '0',
  `money` varchar(255)  DEFAULT '0',
  `gold` varchar(255) DEFAULT '0',
  `name` varchar(255) DEFAULT '0',
  `borrow` double DEFAULT 0,
  `borrow_pay` datetime DEFAULT NULL,
  `borrow_money` double DEFAULT 0
) ENGINE=InnoDB;



-- ----------------------------
-- Table structure for bans
-- ----------------------------
DROP TABLE IF EXISTS `bans`;
CREATE TABLE `bans` (
  `identifier` varchar(50) DEFAULT NULL,
  `reason` varchar(500)  DEFAULT NULL,
  `date` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  KEY `identifier` (`identifier`),
  KEY `reason` (`reason`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for drops
-- ----------------------------
DROP TABLE IF EXISTS `drops`;
CREATE TABLE `drops` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `drop_list` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7857;

-- ----------------------------
-- Table structure for characters
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `charidentifier` int(11) NOT NULL AUTO_INCREMENT,
  `money` double(11,2) DEFAULT 0.00,
  `gold` double(11,2) DEFAULT 0.00,
  `rol` double(11,2) NOT NULL DEFAULT 0.00,
  `inventory` longtext DEFAULT NULL,
  `job` varchar(50) DEFAULT 'unemployed',
  `status` varchar(140) DEFAULT '{}',
  `meta` varchar(255) NOT NULL DEFAULT '{}',
  `firstname` varchar(50) DEFAULT ' ',
  `lastname` varchar(50) DEFAULT ' ',
  `skinPlayer` longtext DEFAULT NULL,
  `compPlayer` longtext DEFAULT NULL,
  `jobgrade` int(11) DEFAULT 0,
  `coords` varchar(75) DEFAULT '{}',
  `isdead` tinyint(1) DEFAULT 0,
  `walking_style` varchar(50) DEFAULT 'Default',
  UNIQUE KEY `identifier_charidentifier` (`identifier`,`charidentifier`) USING BTREE,
  KEY `charidentifier` (`charidentifier`) USING BTREE,
  KEY `coords` (`coords`),
  KEY `compPlayer` (`compPlayer`(768)),
  KEY `skinPlayer` (`skinPlayer`(768)),
  KEY `money` (`money`),
  KEY `status` (`status`),
  CONSTRAINT `FK_characters_users` FOREIGN KEY (`identifier`) REFERENCES `users` (`identifier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for inventory_storage
-- ----------------------------
DROP TABLE IF EXISTS `inventory_storage`;
CREATE TABLE `inventory_storage` (
  `identifier` varchar(50) NOT NULL,
  `charid` int(11) NOT NULL DEFAULT 0,
  `items` longtext NOT NULL DEFAULT '{}',
  `size` double DEFAULT 0
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `item` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `limit` decimal(10,2)	NOT NULL DEFAULT '1',
  `can_remove` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(50) DEFAULT NULL,
  `usable` tinyint(1) DEFAULT NULL,
  `descriptions` varchar(255) DEFAULT NULL,
  `metadata` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`item`) USING BTREE,
  KEY `label` (`label`)
) ENGINE=InnoDB;

INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`, `descriptions`) VALUES
	('acid', 'Acid', '10', 1, 'item_standard', 1, 'descriptions'),
	('Agarita', 'Agarita', '10', 1, 'item_standard', 1, 'descriptions'),
	('Agarita_Seed', 'Agarita Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Alaskan_Ginseng', 'Alaskan Ginseng', '10', 1, 'item_standard', 1, 'descriptions'),
	('Alaskan_Ginseng_Seed', 'Alaskan Ginseng Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('alcohol', 'Alcohol', '10', 1, 'item_standard', 1, 'descriptions'),
	('American_Ginseng', 'American Ginseng', '10', 1, 'item_standard', 1, 'descriptions'),
	('American_Ginseng_Seed', 'American Ginseng Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammoarrmownormal', 'Arrow Normal', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammoarrowdynamite', 'Arrow Dynamite', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammoarrowfire', 'Arrow Fire', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammoarrowimproved', 'Arrow Improved', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammoarrowpoison', 'Arrow Poison', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammoarrowsmallgame', 'Arrow Small Game', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammobolahawk', 'Bola Ammo Hawk', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammobolainterwired', 'Bola Ammo Interwired', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammobolaironspiked', 'Bola Ammo Ironspiked', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammobolla', 'Bolla Ammo', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammodynamite', 'Dynamite Ammo', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammoelephant', 'Elephant Rifle Ammo', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammoknives', 'Knives Ammo', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammomolotov', 'Molotov Ammo', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammopistolexplosive', 'Pistol Ammo Explosive', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammopistolexpress', 'Pistol Ammo Express', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammopistolnormal', 'Pistol Ammo Normal', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammopistolsplitpoint', 'Pistol Ammo Splitpoint', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammopistolvelocity', 'Pistol Ammo Velocity', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammopoisonbottle', 'Poison Bottle Ammo', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammorepeaterexplosive', 'Repeater Ammo Explosive', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammorepeaterexpress', 'Repeater Ammo Express', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammorepeaternormal', 'Repeater Ammo Normal', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammorepeatersplitpoint', 'Repeater Ammo Splitpoint', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammorepeatervelocity', 'Repeater Ammo Velocity', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammorevolverexplosive', 'Revolver Ammo Explosive', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammorevolverexpress', 'Revolver Ammo Express', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammorevolvernormal', 'Revolver Ammo Normal', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammorevolversplitpoint', 'Revolver Ammo Splitpoint', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammorevolvervelocity', 'Revolver Ammo Velocity', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammorifleexplosive', 'Rifle Ammo Explosive', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammorifleexpress', 'Rifle Ammo Express', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammoriflenormal', 'Rifle Ammo Normal', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammoriflesplitpoint', 'Rifle Ammo Splitpoint', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammoriflevelocity', 'Rifle Ammo Velocity', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammoshotgunexplosive', 'Shotgun Ammo Explosive', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammoshotgunincendiary', 'Shotgun Ammo Incendiary', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammoshotgunnormal', 'Shotgun Ammo Normal', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammoshotgunslug', 'Shotgun Ammo Slug', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammotomahawk', 'Tonmahawk Ammo', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammovarmint', 'Varmint Ammo', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammovarminttranq', 'Varmint Tranquilizer Ammo', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammovoldynamite', 'Volatile Dynamite Ammo', '10', 1, 'item_standard', 1, 'descriptions'),
	('ammovolmolotov', 'Volatile Molotov Ammo', '10', 1, 'item_standard', 1, 'descriptions'),
	('antipoison', 'Antipoison', '20', 1, 'item_standard', 1, 'descriptions'),
	('apple', 'Apple', '20', 1, 'item_standard', 1, 'descriptions'),
	('appleCrumbMash', 'Minty Berry Mash', '10', 1, 'item_standard', 1, 'descriptions'),
	('appleCrumbMoonshine', 'Minty Berry Moonshine', '10', 1, 'item_standard', 1, 'descriptions'),
	('a_c_fishbluegil_01_ms', 'Medium Bluegil', '10', 1, 'item_standard', 0, 'descriptions'),
	('a_c_fishbluegil_01_sm', 'Small Bluegil', '5', 1, 'item_standard', 0, 'descriptions'),
	('a_c_fishbullheadcat_01_ms', 'Medium Bullhead', '10', 1, 'item_standard', 0, 'descriptions'),
	('a_c_fishbullheadcat_01_sm', 'Small Bullhead', '5', 1, 'item_standard', 0, 'descriptions'),
	('a_c_fishchainpickerel_01_ms', 'Medium Pickerel', '10', 1, 'item_standard', 0, 'descriptions'),
	('a_c_fishchainpickerel_01_sm', 'Small Pickerel', '5', 1, 'item_standard', 0, 'descriptions'),
	('a_c_fishlargemouthbass_01_ms', 'Lardgemouth Bass', '10', 1, 'item_standard', 0, 'descriptions'),
	('a_c_fishperch_01_ms', 'Medium Perch', '10', 1, 'item_standard', 0, 'descriptions'),
	('a_c_fishperch_01_sm', 'Small Perch', '5', 1, 'item_standard', 0, 'descriptions'),
	('a_c_fishrainbowtrout_01_ms', 'Rainbow Trout', '10', 1, 'item_standard', 0, 'descriptions'),
	('a_c_fishredfinpickerel_01_ms', 'Medium Redfin Pickerel', '10', 1, 'item_standard', 0, 'descriptions'),
	('a_c_fishredfinpickerel_01_sm', 'Small Redfin Pickerel', '5', 1, 'item_standard', 0, 'descriptions'),
	('a_c_fishrockbass_01_ms', 'Medium Rockbass', '10', 1, 'item_standard', 0, 'descriptions'),
	('a_c_fishrockbass_01_sm', 'Small Rockbass', '5', 1, 'item_standard', 0, 'descriptions'),
	('a_c_fishsalmonsockeye_01_ms', 'Sockeye Salmon', '10', 1, 'item_standard', 0, 'descriptions'),
	('a_c_fishsmallmouthbass_01_ms', 'Smallmouth Bass', '10', 1, 'item_standard', 0, 'descriptions'),
	('bait', 'Bait', '20', 1, 'item_standard', 1, 'descriptions'),
	('banana', 'Banana', '20', 1, 'item_standard', 1, 'descriptions'),
	('bandage', 'Bandage', '20', 1, 'item_standard', 1, 'descriptions'),
	('Bay_Bolete', 'Bay Bolete', '10', 1, 'item_standard', 1, 'descriptions'),
	('Bay_Bolete_Seed', 'Bay Bolete Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('beefjerky', 'Beef Jerky', '20', 1, 'item_standard', 1, 'descriptions'),
	('beer', 'Beer', '10', 1, 'item_standard', 1, 'descriptions'),
	('Big_Leather', 'Big Leather', '10', 1, 'item_standard', 1, 'descriptions'),
	('Bitter_Weed', 'Bitter Weed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Bitter_Weed_Seed', 'Bitter Weed Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('blackberryale', 'Black Berry Ale', '10', 1, 'item_standard', 1, 'descriptions'),
	('Black_Berry', 'Black Berry', '10', 1, 'item_standard', 1, 'descriptions'),
	('Black_Berry_Seed', 'Black Berry Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Black_Currant', 'Black Currant', '10', 1, 'item_standard', 1, 'descriptions'),
	('Black_Currant_Seed', 'Black Currant Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Blood_Flower', 'Blood Flower', '10', 1, 'item_standard', 1, 'descriptions'),
	('Blood_Flower_Seed', 'Blood Flower Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('blueberry', 'Blueberry', '10', 1, 'item_standard', 1, 'descriptions'),
	('boiledegg', 'Boiled Egg', '10', 1, 'item_standard', 1, 'descriptions'),
	('book', 'Book', '5', 1, 'item_standard', 1, 'descriptions'),
	('bountylicns', 'Bounty Hunter License', '10', 1, 'item_standard', 1, 'descriptions'),
	('Bread', 'Bread', '1', 1, 'item_standard', 1, 'Pan'),
	('Bulrush', 'Bulrush', '10', 1, 'item_standard', 1, 'descriptions'),
	('Bulrush_Seed', 'Bulrush Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Burdock_Root', 'Burdock Root', '10', 1, 'item_standard', 1, 'descriptions'),
	('Burdock_Root_Seed', 'Burdock Root Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('campfire', 'Campfire', '5', 1, 'item_standard', 1, 'descriptions'),
	('Cardinal_Flower', 'Cardinal Flower', '10', 1, 'item_standard', 1, 'descriptions'),
	('Cardinal_Flower_Seed', 'Cardinal Flower Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('carrots', 'Carrot', '10', 1, 'item_standard', 1, 'descriptions'),
	('Chanterelles', 'Chanterelles', '10', 1, 'item_standard', 1, 'descriptions'),
	('Chanterelles_Seed', 'Chanterelles Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('char', 'Char', '10', 1, 'item_standard', 0, 'descriptions'),
	('chewingtobacco', 'Chewing Tobacco', '20', 1, 'item_standard', 1, 'descriptions'),
	('Choc_Daisy', 'Choc Daisy', '10', 1, 'item_standard', 1, 'descriptions'),
	('Choc_Daisy_Seed', 'Choc Daisy Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('cigar', 'Cigar', '20', 1, 'item_standard', 1, 'descriptions'),
	('cigarette', 'Cigarette', '20', 1, 'item_standard', 1, 'descriptions'),
	('cigarettefilter', 'Cig Filter', '20', 1, 'item_standard', 1, 'descriptions'),
	('clay', 'Clay', '20', 1, 'item_standard', 1, 'descriptions'),
	('coal', 'Coal', '20', 1, 'item_standard', 1, 'descriptions'),
	('cocoa', 'Cocoa', '20', 1, 'item_standard', 1, 'descriptions'),
	('consumable_bluegil', 'Dried Bluegil', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_breakfast', 'Breakfast', '5', 1, 'item_standard', 1, 'descriptions'),
	('consumable_caramel', 'Caramel', '5', 1, 'item_standard', 1, 'descriptions'),
	('consumable_chocolate', 'Chocolate Bar', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_coffee', 'Coffee', '5', 1, 'item_standard', 1, 'descriptions'),
	('consumable_fruitsalad', 'Fruit Salad', '5', 1, 'item_standard', 1, 'descriptions'),
	('consumable_game', 'Jerkied GameMeat', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_haycube', 'Haycube', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_herb_chanterelles', 'Chanterelles', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_herb_evergreen_huckleberry', 'Evergreen Huckleberry', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_herb_oregano', 'Oregano', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_herb_vanilla_flower', 'Vanilla Flower', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_herb_wintergreen_berry', 'Wintergreen Berry', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_kidneybeans_can', 'Kidney Beans', '5', 1, 'item_standard', 1, 'descriptions'),
	('consumable_lock_breaker', 'Lock Breaker', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_meat_greavy', 'Meat Stew', '12', 1, 'item_standard', 1, 'descriptions'),
	('consumable_medicine', 'Medicine', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_peach', 'Peach', '5', 1, 'item_standard', 1, 'descriptions'),
	('consumable_pear', 'Pear', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_raspberrywater', 'Berry Water', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_salmon', 'Dried Salmon', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_salmon_can', 'Salmon Can', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_trout', 'Cooked Trout', '10', 1, 'item_standard', 1, 'descriptions'),
	('consumable_veggies', 'Edible Veggies', '5', 1, 'item_standard', 1, 'descriptions'),
	('cookedbluegil', 'Cooked Bluegil with Veggies', '5', 1, 'item_standard', 1, 'descriptions'),
	('copper', 'Copper', '30', 1, 'item_standard', 1, 'descriptions'),
	('corn', 'Corn', '10', 1, 'item_standard', 1, 'descriptions'),
	('cornseed', 'Corn seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Creeking_Thyme', 'Creeping Thyme', '10', 1, 'item_standard', 1, 'descriptions'),
	('Creeking_Thyme_Seed', 'Creeping Thyme Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Creekplum', 'Creekplum', '10', 1, 'item_standard', 1, 'descriptions'),
	('Creekplum_Seed', 'Creekplum Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Crows_Garlic', 'Crows Garlic', '10', 1, 'item_standard', 1, 'descriptions'),
	('Crows_Garlic_Seed', 'Crows Garlic Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Desert_Sage', 'Desert Sage', '10', 1, 'item_standard', 1, 'descriptions'),
	('Desert_Sage_Seed', 'Desert Sage Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('diamond', 'Diamond', '20', 1, 'item_standard', 1, 'descriptions'),
	('Drink_For_Dog', 'Pet Water', '10', 1, 'item_standard', 1, 'descriptions'),
	('Duck_Egg', 'Duck Egg', '10', 1, 'item_standard', 1, 'descriptions'),
	('dynamite', 'Pipe charge dynamite', '30', 1, 'item_standard', 1, 'descriptions'),
	('eggs', 'Egg', '50', 1, 'item_standard', 1, 'descriptions'),
	('emerald', 'Emerald', '20', 1, 'item_standard', 1, 'descriptions'),
	('English_Mace', 'English Mace', '10', 1, 'item_standard', 1, 'descriptions'),
	('English_Mace_Seed', 'English Mace Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Evergreen_Huckleberry', 'Evergreen Huckleberry', '10', 1, 'item_standard', 1, 'descriptions'),
	('Evergreen_Huckleberry_Seed', 'Evergreen Huckleberry Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('fan', 'Fan', '5', 1, 'item_standard', 1, 'descriptions'),
	('Fat', 'Animal Fat', '10', 1, 'item_standard', 1, 'descriptions'),
	('Feather', 'Feather', '20', 1, 'item_standard', 1, 'descriptions'),
	('Feed_For_Dog', 'Dog Food', '10', 1, 'item_standard', 1, 'descriptions'),
	('fibers', 'Fibers', '20', 1, 'item_standard', 0, 'descriptions'),
	('fish', 'Fish', '50', 1, 'item_standard', 1, 'descriptions'),
	('fishbait', 'Fishbait', '10', 1, 'item_standard', 1, 'descriptions'),
	('fishchips', 'Fish and Chips', '10', 1, 'item_standard', 1, 'descriptions'),
	('flag', 'Camp Flag', '10', 1, 'item_standard', 1, 'descriptions'),
	('friedtater', 'Fried Taters', '10', 1, 'item_standard', 1, 'descriptions'),
	('Gamey_Meat', 'Gamey Meat', '10', 1, 'item_standard', 1, 'descriptions'),
	('Gator_Egg_3', 'Aligator Egg 3', '10', 1, 'item_standard', 1, 'descriptions'),
	('Gator_Egg_4', 'Aligator Egg 4', '10', 1, 'item_standard', 1, 'descriptions'),
	('Gator_Egg_5', 'Aligator Egg 5', '10', 1, 'item_standard', 1, 'descriptions'),
	('ginsengtea', 'Ginseng Tea', '10', 1, 'item_standard', 1, 'descriptions'),
	('glassbottle', 'Glass Bottle', '15', 1, 'item_standard', 1, 'descriptions'),
	('goldbar', 'GoldBar', '5', 1, 'item_standard', 1, 'descriptions'),
	('Golden_Currant', 'Golden Currant', '10', 1, 'item_standard', 1, 'descriptions'),
	('Golden_Currant_Seed', 'Golden Currant Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('goldfish', 'Gold Fish', '10', 1, 'item_standard', 0, 'descriptions'),
	('goldnugget', 'Gold nugget', '30', 1, 'item_standard', 0, 'descriptions'),
	('goldpan', 'Gold pan', '10', 1, 'item_standard', 1, 'descriptions'),
	('goldring', 'Gold Ring', '10', 1, 'item_standard', 1, 'descriptions'),
	('Goose_Egg_4', 'Goose Egg', '10', 1, 'item_standard', 1, 'descriptions'),
	('hairpomade', 'Hair Pomade', '10', 1, 'item_standard', 1, 'descriptions'),
	('handcuffs', 'Handcuffs', '10', 1, 'item_standard', 1, 'descriptions'),
	('hatchet', 'Hatchet', '1', 1, 'item_standard', 1, 'descriptions'),
	('Health_For_Dog', 'Pet Bandages', '10', 1, 'item_standard', 1, 'descriptions'),
	('hemp', 'Hemp', '10', 1, 'item_standard', 1, 'descriptions'),
	('hemp_cig', 'Hemp Cigarette', '1', 1, 'item_standard', 1, 'descriptions'),
	('herbmed', 'Herbal Remedy', '10', 1, 'item_standard', 1, 'descriptions'),
	('heroin', 'Heroin', '5', 1, 'item_standard', 1, 'descriptions'),
	('honey', 'Honey', '10', 1, 'item_standard', 1, 'descriptions'),
	('horsebrush', 'Horse Brush', '5', 1, 'item_standard', 1, 'descriptions'),
	('Hummingbird_Sage', 'Hummingbird Sage', '10', 1, 'item_standard', 1, 'descriptions'),
	('Hummingbird_Sage_Seed', 'Hummingbird Sage Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('hwood', 'Hard Wood', '20', 1, 'item_standard', 0, 'descriptions'),
	('Indian_Tobbaco', 'Indian Tobbaco', '20', 1, 'item_standard', 1, 'descriptions'),
	('Indian_Tobbaco_Seed', 'Indian Tobbaco Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('iron', 'Iron Ore', '30', 1, 'item_standard', 1, 'descriptions'),
	('ironbar', 'Iron Bar', '30', 1, 'item_standard', 1, 'descriptions'),
	('ironextract', 'Iron Extract', '1', 1, 'item_standard', 0, 'descriptions'),
	('ironhammer', 'Iron Hammer', '5', 1, 'item_standard', 1, 'descriptions'),
	('kit_bandana', 'Bandana', '2', 1, 'item_standard', 1, 'descriptions'),
	('leather', 'Leather', '50', 1, 'item_standard', 1, 'descriptions'),
	('lockpick', 'Lockpick', '5', 1, 'item_standard', 1, 'descriptions'),
	('lockpickmold', 'Lockpick Mold', '5', 1, 'item_standard', 1, 'descriptions'),
	('mackerel', 'Mackerel', '10', 1, 'item_standard', 0, 'descriptions'),
	('meat', 'Meat', '20', 1, 'item_standard', 1, 'descriptions'),
	('milk', 'Milk', '50', 1, 'item_standard', 1, 'descriptions'),
	('Milk_Weed', 'Milk Weed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Milk_Weed_Seed', 'Milk Weed Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('moonshine', 'Moonshine', '10', 1, 'item_standard', 1, 'descriptions'),
	('morpcert', 'Morphine Perscription', '10', 1, 'item_standard', 1, 'descriptions'),
	('morphine', 'Morphine', '10', 1, 'item_standard', 1, 'descriptions'),
	('mp001_p_mp_still02x', 'Brennerei', '1', 1, 'item_standard', 1, 'descriptions'),
	('Mutton', 'Mutton', '20', 1, 'item_standard', 1, 'descriptions'),
	('nails', 'Nails', '40', 1, 'item_standard', 1, 'descriptions'),
	('newspaper', 'NewsPaper', '20', 1, 'item_standard', 1, 'descriptions'),
	('nitrite', 'Nitrite', '20', 1, 'item_standard', 1, 'descriptions'),
	('nitroglyserolia', 'Nitroglycerol', '30', 1, 'item_standard', 1, 'descriptions'),
	('notebook', 'Notebook', '5', 1, 'item_standard', 1, 'descriptions'),
	('Oleander_Sage', 'Oleander Sage', '10', 1, 'item_standard', 1, 'descriptions'),
	('Oleander_Sage_Seed', 'Oleander Sage Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('orden_presidente', 'Order of the President', '10', 1, 'item_standard', 0, 'descriptions'),
	('Oregano', 'Oregano', '10', 1, 'item_standard', 1, 'descriptions'),
	('Oregano_Seed', 'Oregano Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('paper', 'Paper', '20', 1, 'item_standard', 1, 'descriptions'),
	('Parasol_Mushroom', 'Parasol Mushroom', '10', 1, 'item_standard', 1, 'descriptions'),
	('Parasol_Mushroom_Seed', 'Parasol Mushroom Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('pickaxe', 'Pickaxe', '1', 1, 'item_standard', 0, 'descriptions'),
	('pipe', 'Pipe', '5', 1, 'item_standard', 1, 'descriptions'),
	('pocket_watch', 'Pocket Watch', '5', 1, 'item_standard', 1, 'descriptions'),
	('potato', 'Potato', '20', 1, 'item_standard', 1, 'descriptions'),
	('Prairie_Poppy', 'Prairie Poppy', '10', 1, 'item_standard', 1, 'descriptions'),
	('Prairie_Poppy_Seed', 'Prairie Poppy Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('provision_jail_keys', 'Jail Keys', '10', 1, 'item_standard', 1, 'descriptions'),
	('pulp', 'Pulp', '20', 1, 'item_standard', 0, 'descriptions'),
	('p_barrelmoonshine', 'Barrel', '1', 1, 'item_standard', 1, 'descriptions'),
	('quartz', 'Quartz', '20', 1, 'item_standard', 1, 'descriptions'),
	('rajahdysoljy', 'Explosive Oil', '30', 1, 'item_standard', 1, 'descriptions'),
	('Rams_Head', 'Rams Head', '10', 1, 'item_standard', 1, 'descriptions'),
	('Rams_Head_Seed', 'Rams Head Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('raspberryale', 'Raspberry Ale', '10', 1, 'item_standard', 1, 'descriptions'),
	('Red_Raspberry', 'Red Raspberry', '10', 1, 'item_standard', 1, 'descriptions'),
	('Red_Raspberry_Seed', 'Red Raspberry Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Red_Sage', 'Red Sage', '10', 1, 'item_standard', 1, 'descriptions'),
	('Red_Sage_Seed', 'Red Sage Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('repeaterbarrel', 'Repeater Barrel', '5', 1, 'item_standard', 1, 'descriptions'),
	('repeatermold', 'Repeater Mold', '5', 1, 'item_standard', 1, 'descriptions'),
	('repeaterreceiver', 'Repeater Receiver', '5', 1, 'item_standard', 1, 'descriptions'),
	('repeaterrecmold', 'Repeater Receiver Mold', '5', 1, 'item_standard', 1, 'descriptions'),
	('repeaterstock', 'Repeater Stock', '5', 1, 'item_standard', 1, 'descriptions'),
	('revolverbarrel', 'Revolver Barrel', '5', 1, 'item_standard', 1, 'descriptions'),
	('revolvercylinder', 'Revolver Cylinder', '5', 1, 'item_standard', 1, 'descriptions'),
	('revolverhandle', 'Revolver Handle', '5', 1, 'item_standard', 1, 'descriptions'),
	('revolvermold', 'Revolver Mold', '5', 1, 'item_standard', 1, 'descriptions'),
	('riflebarrel', 'Rifle Barrel', '5', 1, 'item_standard', 1, 'descriptions'),
	('riflemold', 'Rifle Mold', '5', 1, 'item_standard', 1, 'descriptions'),
	('riflereceiver', 'Rifle Receiver', '5', 1, 'item_standard', 1, 'descriptions'),
	('riflerecmold', 'Rifle Receiver Mold', '5', 1, 'item_standard', 1, 'descriptions'),
	('riflestock', 'Rifle Stock', '5', 1, 'item_standard', 1, 'descriptions'),
	('roach', 'Roach', '10', 1, 'item_standard', 0, 'descriptions'),
	('rock', 'Rock', '30', 1, 'item_standard', 0, 'descriptions'),
	('rollingpaper', 'Rolling paper', '30', 1, 'item_standard', 1, 'descriptions'),
	('rubber', 'Rubber', '20', 1, 'item_standard', 0, 'descriptions'),
	('salamelle', 'Fresh Pork ', '20', 1, 'item_standard', 1, 'descriptions'),
	('salmon', 'Salmon', '10', 1, 'item_standard', 0, 'descriptions'),
	('salt', 'Salt', '20', 1, 'item_standard', 1, 'descriptions'),
	('Saltbush', 'Saltbush', '10', 1, 'item_standard', 1, 'descriptions'),
	('Saltbush_Seed', 'Saltbush Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('sap', 'Sap', '20', 1, 'item_standard', 0, 'descriptions'),
	('sarsaparilla', 'Sarsaparilla', '10', 1, 'item_standard', 1, 'descriptions'),
	('scale', 'Scale', '5', 1, 'item_standard', 1, 'descriptions'),
	('secondchance', 'Second Chance', '10', 1, 'item_standard', 1, 'descriptions'),
	('shellcasing', 'Shell Casing', '40', 1, 'item_standard', 1, 'descriptions'),
	('shotgunbarrel', 'Shotgun Barrel', '5', 1, 'item_standard', 1, 'descriptions'),
	('shotgunmold', 'Shotgun Mold', '5', 1, 'item_standard', 1, 'descriptions'),
	('shotgunstock', 'Shotgun Stock', '5', 1, 'item_standard', 1, 'descriptions'),
	('shrimps', 'Shrimp Stew', '1', 1, 'item_standard', 1, 'descriptions'),
	('Small_Leather', 'Small Leather', '10', 1, 'item_standard', 1, 'descriptions'),
	('SnakeSkin', 'Snake Skin', '20', 1, 'item_standard', 1, 'descriptions'),
	('Snake_Poison', 'Snake Poison', '10', 1, 'item_standard', 1, 'descriptions'),
	('soborno', 'Soborno Alcohol', '15', 1, 'item_standard', 0, 'descriptions'),
	('steak', 'Steak', '10', 1, 'item_standard', 1, 'descriptions'),
	('steakveg', 'Steak with Veggies', '10', 1, 'item_standard', 1, 'descriptions'),
	('stim', 'Horse Stimulant', '2', 1, 'item_standard', 1, 'descriptions'),
	('stolenmerch', 'Stolen Items', '10', 1, 'item_standard', 0, 'descriptions'),
	('stonehammer', 'Stone Hammer', '5', 1, 'item_standard', 1, 'descriptions'),
	('sugar', 'Sugar', '20', 1, 'item_standard', 0, 'descriptions'),
	('sugarcaneseed', 'Surgarcane seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('sulfur', 'Sulfur', '30', 1, 'item_standard', 0, 'descriptions'),
	('syn', 'Syn', '50', 1, 'item_standard', 1, 'descriptions'),
	('synpackage', 'Syn Package', '10', 1, 'item_standard', 1, 'descriptions'),
	('syringe', 'Syringe', '20', 1, 'item_standard', 1, 'descriptions'),
	('syringecert', 'Syringe Cert', '10', 1, 'item_standard', 1, 'descriptions'),
	('tent', 'Tent', '1', 1, 'item_standard', 1, 'descriptions'),
	('tequila', 'Tequila', '10', 1, 'item_standard', 1, 'descriptions'),
	('Texas_Bonnet', 'Texas Bonnet', '10', 1, 'item_standard', 1, 'descriptions'),
	('Texas_Bonnet_Seed', 'Texas Bonnet Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('token', 'Camp License', '5', 1, 'item_standard', 1, 'descriptions'),
	('trainkey', 'Train Key', '1', 1, 'item_standard', 1, 'descriptions'),
	('tropicalPunchMash', 'Ginseng Mash', '10', 1, 'item_standard', 0, 'descriptions'),
	('tropicalPunchMoonshine', 'Ginseng Moonshine', '10', 1, 'item_standard', 0, 'descriptions'),
	('trout', 'Trout', '10', 1, 'item_standard', 0, 'descriptions'),
	('TurtleShell', 'Turtle Shell', '20', 1, 'item_standard', 1, 'descriptions'),
	('tylenol', 'Tylenol', '10', 1, 'item_standard', 1, 'descriptions'),
	('vanillaFlower', 'Vanille Flower', '20', 1, 'item_standard', 0, 'descriptions'),
	('Violet_Snowdrop', 'Violet Snowdrop', '10', 1, 'item_standard', 1, 'descriptions'),
	('Violet_Snowdrop_Seed', 'Violet Snowdrop Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('vodka', 'Vodka', '10', 1, 'item_standard', 1, 'descriptions'),
	('Volture_Egg', 'Volture Egg', '10', 1, 'item_standard', 1, 'descriptions'),
	('water', 'Water', '15', 1, 'item_standard', 1, 'descriptions'),
	('wateringcan', 'Water Jug', '10', 1, 'item_standard', 1, 'descriptions'),
	('wateringcan_dirtywater', 'Dirty Watering Jug', '10', 1, 'item_standard', 1, 'descriptions'),
	('wateringcan_empty', 'Empty Watering Jug', '10', 1, 'item_standard', 1, 'descriptions'),
	('whisky', 'Whisky', '10', 1, 'item_standard', 1, 'descriptions'),
	('wildCiderMash', 'Black Berry Mash', '10', 1, 'item_standard', 0, 'descriptions'),
	('wildCiderMoonshine', 'Black Berry Moonshine', '10', 1, 'item_standard', 0, 'descriptions'),
	('Wild_Carrot', 'Wild Carrot', '10', 1, 'item_standard', 1, 'descriptions'),
	('Wild_Carrot_Seed', 'Wild Carrot Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Wild_Feverfew', 'Wild Feverfew', '10', 1, 'item_standard', 1, 'descriptions'),
	('Wild_Feverfew_Seed', 'Wild Feverfew Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Wild_Mint', 'Wild Mint', '10', 1, 'item_standard', 1, 'descriptions'),
	('Wild_Mint_Seed', 'Wild Mint Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Wild_Rhubarb', 'Wild Rhubarb', '10', 1, 'item_standard', 1, 'descriptions'),
	('Wild_Rhubarb_Seed', 'Wild Rhubarb Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('wine', 'Wine', '10', 1, 'item_standard', 1, 'descriptions'),
	('Wintergreen_Berry', 'Wintergreen Berry', '10', 1, 'item_standard', 1, 'descriptions'),
	('Wintergreen_Berry_Seed', 'Wintergreen Berry Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('Wisteria', 'Wisteria', '10', 1, 'item_standard', 1, 'descriptions'),
	('Wisteria_Seed', 'Wisteria Seed', '10', 1, 'item_standard', 1, 'descriptions'),
	('wojape', 'Wojape', '5', 1, 'item_standard', 1, 'descriptions'),
	('wood', 'Soft Wood', '20', 1, 'item_standard', 0, 'descriptions'),
	('wooden_boards', 'Wooden Boards', '25', 1, 'item_standard', 0, 'descriptions'),
	('wool', 'Wool', '50', 1, 'item_standard', 1, 'descriptions'),
	('Yarrow', 'Yarrow', '10', 1, 'item_standard', 1, 'descriptions'),
	('Yarrow_Seed', 'Yarrow Seed', '10', 1, 'item_standard', 1, 'descriptions');
-- ----------------------------
-- Table structure for loadout
-- ----------------------------
DROP TABLE IF EXISTS `loadout`;
CREATE TABLE `loadout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `charidentifier` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ammo` varchar(255) NOT NULL DEFAULT '{}',
  `dirtlevel` double DEFAULT 0,
  `conditionlevel` double DEFAULT 0,
  `used` tinyint(4) DEFAULT 0,
  `comps` varchar(15000) DEFAULT '{}',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `identifier` (`identifier`),
  KEY `charidentifier` (`charidentifier`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

-- ----------------------------
-- Table structure for outfits
-- ----------------------------
DROP TABLE IF EXISTS `outfits`;
CREATE TABLE `outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(45) NOT NULL,
  `charidentifier` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `comps` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`),
  KEY `charidentifier` (`charidentifier`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `identifier` varchar(50) NOT NULL,
  `group` varchar(50) DEFAULT 'user',
  `warnings` int(11) DEFAULT 0,
  `banned` tinyint(4) DEFAULT 0,
  `chars` int(1) DEFAULT 1,
  PRIMARY KEY (`identifier`) USING BTREE,
  UNIQUE KEY `identifier` (`identifier`) USING BTREE,
  KEY `group` (`group`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for whitelist
-- ----------------------------
DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE `whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1;
SET FOREIGN_KEY_CHECKS=1;

INSERT INTO `users` (`identifier`, `group`, `warnings`, `banned`, `chars`) VALUES ('steam:', 'user', '0', '0', '1');

