-- phpMyAdmin SQL Dump
-- version 4.6.6deb4+deb9u2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 06, 2021 at 12:14 PM
-- Server version: 10.1.47-MariaDB-0+deb9u1
-- PHP Version: 7.0.33-0+deb9u10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crowl_interface`
--

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `crawl_id` int(11) DEFAULT NULL,
  `projectName` varchar(255) DEFAULT NULL,
  `startUrl` varchar(255) DEFAULT NULL,
  `userAgent` varchar(255) DEFAULT NULL,
  `acceptLanguage` varchar(255) DEFAULT NULL,
  `mimeTypes` varchar(255) DEFAULT NULL,
  `amountInputDelay` int(11) DEFAULT NULL,
  `amountInputThreads` int(11) DEFAULT NULL,
  `amountInputDepth` int(11) DEFAULT NULL,
  `exclusions` text,
  `obeyRobots` varchar(4) DEFAULT NULL,
  `storeLinks` varchar(4) DEFAULT NULL,
  `storePageContent` varchar(4) DEFAULT NULL,
  `outputMysql` varchar(4) DEFAULT NULL,
  `outputCsv` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`id`, `crawl_id`, `projectName`, `startUrl`, `userAgent`, `acceptLanguage`, `mimeTypes`, `amountInputDelay`, `amountInputThreads`, `amountInputDepth`, `exclusions`, `obeyRobots`, `storeLinks`, `storePageContent`, `outputMysql`, `outputCsv`) VALUES
(8, 13, 'club232323', 'http://clubgtevolution.fr/', 'Crowl (+https://www.crowl.tech/)', 'en', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 1, 5, 5, '', 'on', 'on', NULL, 'on', NULL),
(9, 13, 'CLUB', 'http://clubgtevolution.fr/', 'Crowl (+https://www.crowl.tech/)', 'en', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 1, 5, 5, '', 'on', 'on', NULL, 'on', NULL),
(10, 14, 'zzzz', 'http://clubgtevolution.fr/', 'Crowl (+https://www.crowl.tech/)', 'en', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 1, 5, 5, '', 'on', 'on', NULL, 'on', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `crawls`
--

CREATE TABLE `crawls` (
  `id` int(255) NOT NULL,
  `name` varchar(2500) NOT NULL DEFAULT 'Crawl',
  `domain` varchar(4096) DEFAULT NULL,
  `nameid` varchar(1000) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` varchar(255) NOT NULL DEFAULT 'running',
  `db` tinyint(255) NOT NULL DEFAULT '0',
  `config` varchar(2555) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crawls`
--

INSERT INTO `crawls` (`id`, `name`, `domain`, `nameid`, `start_time`, `state`, `db`, `config`) VALUES
(12, 'etetetetetet', 'example.com', 'etetetetetet_12', '2021-01-05 15:58:36', 'finished', 1, '\n[PROJECT]\nPROJECT_NAME = club\nSTART_URL = http://clubgtevolution.fr/\n[CRAWLER]\nUSER_AGENT = Crowl (+https://www.crowl.tech/)\nROBOTS_TXT_OBEY = True\nEXCLUSION_PATTERN = \nDOWNLOAD_DELAY = 0.5\nCONCURRENT_REQUESTS = 5\nMIME_TYPES = text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\nACCEPT_LANGUAGE = en\n\n[EXTRACTION]\nLINKS = True\nCONTENT = False\nDEPTH = 5\n\n[OUTPUT]\n\ncrowl.CrowlMySQLPipeline = 200\n\n[MYSQL]\nMYSQL_HOST = localhost\nMYSQL_PORT = 3306\nMYSQL_USER = vladislav\nMYSQL_PASSWORD = Pakatopopopopo*4\n            '),
(14, 'zzzz', 'clubgtevolution.fr', 'zzzz_14', '2021-01-05 16:04:13', 'finished', 1, '\n[PROJECT]\nPROJECT_NAME = zzzz\nSTART_URL = http://clubgtevolution.fr/\n[CRAWLER]\nUSER_AGENT = Crowl (+https://www.crowl.tech/)\nROBOTS_TXT_OBEY = True\nEXCLUSION_PATTERN = \nDOWNLOAD_DELAY = 0.5\nCONCURRENT_REQUESTS = 5\nMIME_TYPES = text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\nACCEPT_LANGUAGE = en\n\n[EXTRACTION]\nLINKS = True\nCONTENT = False\nDEPTH = 5\n\n[OUTPUT]\n\ncrowl.CrowlMySQLPipeline = 200\n\n[MYSQL]\nMYSQL_HOST = localhost\nMYSQL_PORT = 3306\nMYSQL_USER = vladislav\nMYSQL_PASSWORD = Pakatopopopopo*4\n            ');

-- --------------------------------------------------------

--
-- Table structure for table `crawl_stats`
--

CREATE TABLE `crawl_stats` (
  `stats_id` int(11) NOT NULL,
  `crawl_id` int(11) NOT NULL,
  `enqueued` int(50) NOT NULL,
  `dequeued` int(50) NOT NULL,
  `response_bytes` int(50) NOT NULL,
  `response_received_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crawl_stats`
--

INSERT INTO `crawl_stats` (`stats_id`, `crawl_id`, `enqueued`, `dequeued`, `response_bytes`, `response_received_count`) VALUES
(1, 1, 14, 14, 41860, 14),
(2, 11, 1, 1, 984, 1),
(3, 12, 1, 1, 1000, 1),
(5, 14, 8, 8, 42352, 8);

-- --------------------------------------------------------

--
-- Table structure for table `lastId`
--

CREATE TABLE `lastId` (
  `lastId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lastId`
--

INSERT INTO `lastId` (`lastId`) VALUES
(14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crawls`
--
ALTER TABLE `crawls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crawl_stats`
--
ALTER TABLE `crawl_stats`
  ADD PRIMARY KEY (`stats_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `crawls`
--
ALTER TABLE `crawls`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `crawl_stats`
--
ALTER TABLE `crawl_stats`
  MODIFY `stats_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
