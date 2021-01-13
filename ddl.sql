CREATE DATABASE IF NOT EXISTS `TLOU2db`;
USE `TLOU2db`;


# Table structure for table 'Chapters'

DROP TABLE IF EXISTS `Chapters`;

CREATE TABLE `Chapters` (
  `ID` INTEGER NOT NULL AUTO_INCREMENT, 
  `Chapter_Number` VARCHAR(255), 
  `Chapter_Name` VARCHAR(255), 
  `Character_ID` INTEGER DEFAULT 0, 
  `Number_of_Acts_Appeared_In` INTEGER DEFAULT 0, 
  INDEX (`Character_ID`), 
  INDEX (`Number_of_Acts_Appeared_In`), 
  PRIMARY KEY (`ID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;




# Table structure for table 'Crafting_Items'

DROP TABLE IF EXISTS `Crafting_Items`;

CREATE TABLE `Crafting_Items` (
  `ID` INTEGER NOT NULL AUTO_INCREMENT, 
  `Type` LONGTEXT, 
  `Name` LONGTEXT, 
  `Effect` LONGTEXT, 
  `Materials` LONGTEXT, 
  `Recipe_Unlock` LONGTEXT, 
  `Picture` LONGTEXT, 
  PRIMARY KEY (`ID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;




# Table structure for table 'Infected_Types'

DROP TABLE IF EXISTS `Infected_Types`;

CREATE TABLE `Infected_Types` (
  `Enemy_Type` VARCHAR(50), 
  `Bio` LONGTEXT, 
  `Picture` LONGTEXT, 
  `ID` INTEGER AUTO_INCREMENT, 
  INDEX (`ID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;




# Table structure for table 'Playable_Characters'

DROP TABLE IF EXISTS `Playable_Characters`;

CREATE TABLE `Playable_Characters` (
  `Character_ID` INTEGER AUTO_INCREMENT, 
  `Name` LONGTEXT, 
  `Gender` VARCHAR(255), 
  `Game_Origin` VARCHAR(255), 
  `Bio` LONGTEXT, 
  `Character_Image` LONGTEXT, 
  `Kill_Count` INTEGER DEFAULT 0, 
  INDEX (`Character_ID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;





# Table structure for table 'Skill_Upgrades'

DROP TABLE IF EXISTS `Skill_Upgrades`;

CREATE TABLE `Skill_Upgrades` (
  `Skill_Type` LONGTEXT, 
  `Skill_Name` VARCHAR(255), 
  `Skill_Cost` INTEGER DEFAULT 0, 
  `Details` VARCHAR(255), 
  `Effect` VARCHAR(255), 
  `ID` INTEGER AUTO_INCREMENT, 
  INDEX (`ID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;



# Table structure for table 'Weapons'

DROP TABLE IF EXISTS `Weapons`;

CREATE TABLE `Weapons` (
  `ID` INTEGER NOT NULL AUTO_INCREMENT, 
  `Character_ID` VARCHAR(255), 
  `Weapon_Name` VARCHAR(255), 
  `Description` LONGTEXT, 
  `Location` LONGTEXT, 
  `Weapon_Picture` LONGTEXT, 
  `Character Portrait` LONGTEXT, 
  INDEX (`Character_ID`), 
  PRIMARY KEY (`ID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;