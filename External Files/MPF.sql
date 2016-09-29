-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 30, 2016 at 06:06 PM
-- Server version: 5.5.41-log
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mpf`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gear` varchar(2500) NOT NULL,
  `position` varchar(50) NOT NULL,
`playerNumber` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

CREATE TABLE IF NOT EXISTS `slots` (
  `uid` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `gear` varchar(2500) NOT NULL,
  `position` varchar(50) NOT NULL,
`slotNumber` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

CREATE TABLE IF NOT EXISTS `storage` (
  `class` varchar(50) DEFAULT NULL,
  `gear` varchar(2500) NOT NULL,
  `position` varchar(50) NOT NULL,
  `storageNumber` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`playerNumber`), ADD UNIQUE KEY `uid` (`uid`);

ALTER TABLE `slots`
  ADD PRIMARY KEY (`slotNumber`), ADD UNIQUE KEY `uid` (`uid`);

ALTER TABLE `storage`
  ADD PRIMARY KEY (`storageNumber`), ADD UNIQUE KEY `storageNumber` (`storageNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `playerNumber` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;

ALTER TABLE `slots`
MODIFY `slotNumber` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;

ALTER TABLE `storage`
MODIFY `storageNumber` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
