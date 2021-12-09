-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  lun. 04 jan. 2021 à 15:31
-- Version du serveur :  10.3.27-MariaDB-0+deb10u1
-- Version de PHP :  7.3.19-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Fyore 2_118`
--

-- --------------------------------------------------------

--
-- Structure de la table `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `source` varchar(4096) COLLATE utf8_bin NOT NULL,
  `target` varchar(4096) COLLATE utf8_bin NOT NULL,
  `text` varchar(1024) COLLATE utf8_bin NOT NULL,
  `weight` float DEFAULT 1,
  `nofollow` tinyint(1) DEFAULT NULL,
  `disallow` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `urls`
--

CREATE TABLE `urls` (
  `id` int(11) NOT NULL,
  `url` text COLLATE utf8_bin NOT NULL,
  `response_code` int(11) NOT NULL DEFAULT 0,
  `content_type` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT -1,
  `referer` text COLLATE utf8_bin DEFAULT NULL,
  `latency` float DEFAULT 0,
  `crawled_at` text COLLATE utf8_bin DEFAULT '0',
  `nb_title` int(11) NOT NULL DEFAULT 0,
  `title` text COLLATE utf8_bin DEFAULT NULL,
  `nb_meta_robots` int(11) NOT NULL DEFAULT 0,
  `meta_robots` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `meta_description` text COLLATE utf8_bin DEFAULT NULL,
  `meta_viewport` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `meta_keywords` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `canonical` varchar(4096) COLLATE utf8_bin DEFAULT NULL,
  `prev` text COLLATE utf8_bin DEFAULT NULL,
  `next` text COLLATE utf8_bin DEFAULT NULL,
  `h1` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `nb_h1` int(11) NOT NULL DEFAULT 0,
  `nb_h2` int(11) NOT NULL DEFAULT 0,
  `wordcount` int(11) DEFAULT 0,
  `content` text COLLATE utf8_bin DEFAULT NULL,
  `XRobotsTag` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `outlinks` int(11) DEFAULT 0,
  `http_date` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `html_lang` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `hreflangs` text COLLATE utf8_bin DEFAULT NULL,
  `microdata` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `urls`
--

INSERT INTO `urls` (`id`, `url`, `response_code`, `content_type`, `level`, `referer`, `latency`, `crawled_at`, `nb_title`, `title`, `nb_meta_robots`, `meta_robots`, `meta_description`, `meta_viewport`, `meta_keywords`, `canonical`, `prev`, `next`, `h1`, `nb_h1`, `nb_h2`, `wordcount`, `content`, `XRobotsTag`, `outlinks`, `http_date`, `size`, `html_lang`, `hreflangs`, `microdata`) VALUES
(1, 'https://www.demarseilleetdailleurs.com', 301, 'text/html; charset=UTF-8', 0, NULL, 0.510289, '2020-11-15T16:20:33', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 'Sun, 15 Nov 2020 16:20:33 GMT', 0, NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `urls`
--
ALTER TABLE `urls`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `urls`
--
ALTER TABLE `urls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
