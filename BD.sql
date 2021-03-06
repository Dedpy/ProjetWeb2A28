-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 05, 2021 at 12:27 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yana`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Dumping data for table `administrateur`
--

INSERT INTO `administrateur` (`id`, `email`, `password`) VALUES
(1, 'admin@esprit.tn', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `comment` longtext NOT NULL,
  `date_com` datetime NOT NULL,
  `id_patient` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_post` (`id_post`),
  KEY `id_patient` (`id_patient`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commentaire`
--

INSERT INTO `commentaire` (`id`, `nom`, `comment`, `date_com`, `id_patient`, `id_post`) VALUES
(19, 'wassim', 'Hello', '2021-01-04 09:30:05', 3, 35),
(18, 'behija', 'Merci wassim!', '2021-01-03 19:54:30', 1, 35),
(17, 'wassim', 'Merci cher administrateur.', '2021-01-03 19:46:13', 1, 35),
(16, 'admin', 'Bravo wassim!', '2021-01-03 19:45:40', 1, 35);

-- --------------------------------------------------------

--
-- Table structure for table `enregistrements`
--

DROP TABLE IF EXISTS `enregistrements`;
CREATE TABLE IF NOT EXISTS `enregistrements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lien` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enregistrements`
--

INSERT INTO `enregistrements` (`id`, `lien`) VALUES
(14, 'https://drive.google.com/file/d/1SmHwoxa202TI5gg7-YEmCqCzmGDbG8fZ/preview');

-- --------------------------------------------------------

--
-- Table structure for table `hitorique_consultation`
--

DROP TABLE IF EXISTS `hitorique_consultation`;
CREATE TABLE IF NOT EXISTS `hitorique_consultation` (
  `id_historique_consultation` int(11) NOT NULL AUTO_INCREMENT,
  `description_consultation` varchar(250) NOT NULL,
  `id_rendezvous` int(11) NOT NULL,
  PRIMARY KEY (`id_historique_consultation`),
  KEY `FK_id_rdv` (`id_rendezvous`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
CREATE TABLE IF NOT EXISTS `medecin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(250) NOT NULL,
  `prenom` varchar(250) NOT NULL,
  `diplome` varchar(250) NOT NULL,
  `adresse` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medecin`
--

INSERT INTO `medecin` (`id`, `nom`, `prenom`, `diplome`, `adresse`, `email`) VALUES
(2, 'Ben omor', 'Ahlem', 'medecin psychiatre', 'naser 1', 'benamorahlem@gmail.com'),
(1, 'Ben salah', 'Mohamed', 'medecin psychiatre', 'manzah 5', 'mohamedbensalah@yahoo.fr'),
(3, 'Ben njima', 'soufia', 'medecin psychiatre', 'manzah 6', 'soufiabenghorbel@gmail.com'),
(4, 'Ben ghorbel', 'Imed', 'medecin psychiatre', 'naser 2', 'imedbenghorbel@gmail.com'),
(6, 'halouani', 'maysa', 'medecin psychiatre', 'lac 2', 'maysahalouani@gmail.com'),
(7, 'behija', 'ben mahmoud', 'medecin psychologue', 'marsa', 'behijabenmahoud@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(250) NOT NULL,
  `prenom` varchar(250) NOT NULL,
  `date_naissance` date NOT NULL,
  `telephone` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `login` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `nom`, `prenom`, `date_naissance`, `telephone`, `email`, `login`, `password`, `code`) VALUES
(3, 'wassim', 'benromdhane', '1998-01-09', 94366666, 'wassimbenr@gmail.com', 'wassim', 'wassim', NULL),
(4, 'behija', 'benghorbel', '1999-01-11', 92582051, 'behija.benghorbel@esprit.tn', 'behija', 'behija', 5002),
(0, 'admin', 'admin', '2021-01-01', 90000000, 'admin@esprit.tn', 'admin', 'admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `categorie` varchar(100) NOT NULL,
  `post` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `date_post` datetime NOT NULL,
  `id_patient` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_commentaire` (`id_patient`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `titre`, `categorie`, `post`, `image`, `date_post`, `id_patient`) VALUES
(35, 'Les psychologues en renforts nâ€™arriveront pas avant la fin janvier', 'Maladie mentale', 'Les renforts en santÃ© mentale tardent Ã  se dÃ©ployer au QuÃ©bec. Il faudra attendre Ã  la fin du mois de janvier avant que des psychologues du secteur privÃ© puissent sâ€™ajouter aux ressources existantes pour rÃ©duire les listes dâ€™attente.\r\nEn entrevue, le ministre dÃ©lÃ©guÃ© Ã  la SantÃ©, Lionel Carmant, a reconnu lundi que Â« câ€™est plus long Â» que ce quâ€™il Â« aurait souhaitÃ© Â».\r\nDeux jours aprÃ¨s lâ€™attaque de lâ€™Halloween dans le Vieux-QuÃ©bec, le ministre avait promis des investissements supplÃ©mentaires de 100 millions de dollars en santÃ© mentale. Le plan incluait lâ€™ajout de 350 sentinelles psychosociales en prÃ©vention et la mise Ã  contribution de 800 psychologues du secteur privÃ©.\r\nCes derniers, disait-il, allaient aider leurs collÃ¨gues du rÃ©seau public Ã  Â« vider les listes dâ€™attente Â» qui comptaient alors 16 000 noms.\r\nOr lors de lâ€™Ã©tude des crÃ©dits le 4 dÃ©cembre, le ministre a dÃ» concÃ©der que les renforts nâ€™arriveraient pas avant la fin du mois de janvier, et que le guichet dâ€™accÃ¨s contenait dÃ©sormais non plus 16 000, mais 18 300 noms.', '../assets/img/blog/general.png', '2021-01-03 19:44:16', 3),
(36, 'Articles du mois', 'Developement personnel', 'SantÃ© publique France, agence dâ€™expertise scientifique, adopte de multiples canaux de diffusion des connaissances et, en particulier, celui des revues scientifiques internationales. Lâ€™agence publie chaque annÃ©e plus de 200 articles scientifiques, depuis des revues gÃ©nÃ©ralistes de santÃ© publique et de prÃ©vention et promotion de la santÃ©, jusquâ€™Ã  des revues spÃ©cialisÃ©es dans ses champs d\'intervention. Une diversitÃ© qui reflÃ¨te celle des missions de SantÃ© publique France Ã  savoir la veille et la surveillance, la prÃ©vention et la promotion de la santÃ©, et la rÃ©ponse aux alertes sanitaires.\r\n\r\nL\'excellence scientifique est un des 7 principes fondateurs de SantÃ© publique France. Chaque mois, un article est mis en avant que ce soit par les nouvelles connaissances quâ€™il apporte, pour son originalitÃ© ou encore pour son lien avec des questions dâ€™actualitÃ©.', 'img/blog/general.png', '2021-01-04 11:29:59', 0),
(39, 'Quelles sont les diffÃ©rences entre les vaccins Moderna et Pfizer ?', 'Developement personnel', 'La vaccination a dÃ©butÃ© en France le 27 dÃ©cembre dernier, comme partout en Europe. Pour le moment, seuls sont concernÃ©s les rÃ©sidants des Ephad et les soignants Ã¢gÃ©s de plus de 50 ans. Selon le site CovidTracker, qui utilise les donnÃ©es du ministÃ¨re des SolidaritÃ©s et de la SantÃ© pour suivre la couverture vaccinale en France, 516 personnes ont reÃ§u la premiÃ¨re dose du vaccin Pfizer-BioNTech au 1er janvier 2021.\r\n\r\nLes autres firmes pharmaceutiques n\'arrÃªtent pas pour autant la conception de leur propre formule vaccinale. L\'AmÃ©ricain Moderna a publiÃ© les rÃ©sultats concernant l\'efficacitÃ© et la sÃ»retÃ© de son vaccin mRNA-1273 dans The New England Journal of Medicine le 30 dÃ©cembre 2020. Pfizer avait fait de mÃªme le 10 dÃ©cembre dernier.\r\n\r\nTout comme le vaccin BNT162b2, il est basÃ© sur la technologie innovante des ARN messagers (ARNm). Sur le papier, ces deux vaccins se ressemblent beaucoup mais voyons en dÃ©tail leurs points communs et leurs diffÃ©rences, selon les donnÃ©es publiÃ©es dans la littÃ©rature scientifique.', 'img/blog/general.png', '2021-01-05 13:24:32', 0);

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
CREATE TABLE IF NOT EXISTS `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  `auteur` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `text`, `auteur`) VALUES
(1, 'L amitie est l union de deux personnes liees par un amour et un respect egaux et reciproques. \r\n', 'Emmanuel Kant'),
(2, 'There is nothing noble in being superior to your fellow man; true nobility is being superior to your former self\r\n', 'Ernest Hemingway'),
(3, 'Become addicted to constant and never-ending self-improvement', 'Anthony J. D Angelo'),
(4, 'Those who cannot change their minds cannot change anything', 'George Bernard Shaw ');

-- --------------------------------------------------------

--
-- Table structure for table `reclamation`
--

DROP TABLE IF EXISTS `reclamation`;
CREATE TABLE IF NOT EXISTS `reclamation` (
  `id_reclamation` int(11) NOT NULL AUTO_INCREMENT,
  `message_reclamation` varchar(250) NOT NULL,
  PRIMARY KEY (`id_reclamation`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reclamation`
--

INSERT INTO `reclamation` (`id_reclamation`, `message_reclamation`) VALUES
(1, 'erreur mail'),
(2, 'qsd'),
(3, 'qsd'),
(4, ''),
(5, 'az'),
(6, 'aze');

-- --------------------------------------------------------

--
-- Table structure for table `rendezvous`
--

DROP TABLE IF EXISTS `rendezvous`;
CREATE TABLE IF NOT EXISTS `rendezvous` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `docteur` varchar(255) NOT NULL,
  `id_patient` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_patient` (`id_patient`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rendezvous`
--

INSERT INTO `rendezvous` (`id`, `date`, `heure`, `docteur`, `id_patient`) VALUES
(117, '2021-01-20', '18:19:10', 'sexologue', 0),
(119, '2021-01-20', '13:08:00', 'Sexologue', 3);

-- --------------------------------------------------------

--
-- Table structure for table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specialite` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `specialite`
--

INSERT INTO `specialite` (`id`, `specialite`) VALUES
(67, 'Sexologue'),
(2, 'Psychiatre'),
(3, 'Psychologue'),
(4, 'Psychanalyste'),
(5, 'Pédopsychiatre'),
(6, 'Neuropsychiatre'),
(7, 'Psychomotricien'),
(8, 'Hypnothérapeute'),
(9, 'Psychothérapeute'),
(10, 'Psychopédagogue');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE IF NOT EXISTS `subscribe` (
  `email` varchar(50) NOT NULL,
  `hash` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`email`, `hash`) VALUES
('wassimbenr@gmail.com', '09642b17565872e384927451c09c576a');

-- --------------------------------------------------------

--
-- Table structure for table `typededev`
--

DROP TABLE IF EXISTS `typededev`;
CREATE TABLE IF NOT EXISTS `typededev` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typededev` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `typededev`
--

INSERT INTO `typededev` (`id`, `typededev`, `video`, `description`) VALUES
(2, 'Depression', 'https://www.youtube.com/embed/aPdl0Xzop6k', 'ask for help'),
(4, 'Cultivation du relaxation', 'https://www.youtube.com/embed/8eURfJvxOcM', ''),
(5, 'Decouvrir la voie et les objectifs de vie', 'https://www.youtube.com/embed/LJu02cmK31o', ''),
(11, 'Addiction', 'https://www.youtube.com/embed/zfKvo1bTi6E', 'missing');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
