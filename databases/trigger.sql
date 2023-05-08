-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 23 avr. 2023 à 13:23
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `trigger`
--

-- --------------------------------------------------------

--
-- Structure de la table `bibliothecaires`
--

CREATE TABLE `bibliothecaires` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `emprunteurs`
--

CREATE TABLE `emprunteurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `emprunteurs`
--

INSERT INTO `emprunteurs` (`id`, `nom`, `prenom`, `adresse`, `createdAt`, `updatedAt`) VALUES
(1, 'MARA', 'Sambelahatse', 'Tanambao Zoara', '2023-04-22 09:46:36', '2023-04-23 10:05:52'),
(2, 'RANDRIANARIMANANA', 'Zafindraibe Laude Solmon', 'Tanambao Zoara', '2023-04-22 10:03:12', '2023-04-22 19:46:55'),
(4, 'ZAFINDAVANARIVELO', 'Njarimandimby Felana', 'Ambodirano', '2023-04-22 19:38:07', '2023-04-22 19:46:13'),
(6, 'Razakandriantsoa', 'Antsa', 'Ankofafa', '2023-04-22 19:44:41', '2023-04-22 19:44:41');

--
-- Déclencheurs `emprunteurs`
--
DELIMITER $$
CREATE TRIGGER `before_emprunteur_add` AFTER INSERT ON `emprunteurs` FOR EACH ROW BEGIN INSERT INTO emprunteur_audits (idEmprunteur, ancienNom, nouveauNom, action, date, utilisateur) VALUES(NEW.id,'' , NEW.nom,'Insertion',now(),user());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_emprunteur_delete` AFTER DELETE ON `emprunteurs` FOR EACH ROW BEGIN INSERT INTO emprunteur_audits(idEmprunteur, ancienNom, nouveauNom, action, date, utilisateur) values(OLD.id, OLD.nom,OLD.nom,'Suppression', now(), user());

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_emprunteur_update` AFTER UPDATE ON `emprunteurs` FOR EACH ROW BEGIN INSERT INTO emprunteur_audits(idEmprunteur, ancienNom, nouveauNom, action, date, utilisateur) values(OLD.id, OLD.nom,NEW.nom,'Modification', now(), user());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `emprunteur_audits`
--

CREATE TABLE `emprunteur_audits` (
  `id` int(11) NOT NULL,
  `idEmprunteur` int(11) DEFAULT NULL,
  `ancienNom` varchar(255) DEFAULT NULL,
  `nouveauNom` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `utilisateur` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `emprunteur_audits`
--

INSERT INTO `emprunteur_audits` (`id`, `idEmprunteur`, `ancienNom`, `nouveauNom`, `action`, `date`, `utilisateur`, `createdAt`, `updatedAt`) VALUES
(1, 2, '', 'Laude', 'Insertion', '2023-04-22 11:03:37', 'root@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 'Laude', 'Laude Solmon', 'Modification', '2023-04-22 11:11:27', 'root@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 3, '', NULL, 'Insertion', '2023-04-22 19:34:44', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 4, '', NULL, 'Insertion', '2023-04-22 19:38:07', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 5, '', NULL, 'Insertion', '2023-04-22 19:40:08', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 6, '', 'Razakandriantsoa', 'Insertion', '2023-04-22 19:44:41', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 3, NULL, NULL, 'Suppression', '2023-04-22 19:45:39', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 4, NULL, 'ZAFINDAVANARIVELO', 'Modification', '2023-04-22 19:46:13', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 1, 'Mara', 'MARA', 'Modification', '2023-04-22 19:46:27', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 2, 'Laude Solmon', 'RANDRIANARIMANANA', 'Modification', '2023-04-22 19:46:55', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 5, NULL, 'RIJASOA', 'Modification', '2023-04-22 19:47:25', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 5, 'RIJASOA', 'RIJASOA', 'Suppression', '2023-04-22 19:47:37', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 7, '', 'RINANTSOA', 'Insertion', '2023-04-22 21:33:11', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 7, 'RINANTSOA', 'RINANTSOA', 'Suppression', '2023-04-22 21:44:58', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 8, '', 'MIHA', 'Insertion', '2023-04-22 21:47:21', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 8, 'MIHA', 'MIHA', 'Suppression', '2023-04-22 21:48:10', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 1, 'MARA', 'MARA', 'Modification', '2023-04-23 10:05:52', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `emprunts`
--

CREATE TABLE `emprunts` (
  `id` int(11) NOT NULL,
  `idExemplaire` int(11) DEFAULT NULL,
  `idEmprunteur` int(11) DEFAULT NULL,
  `nombreEmprunt` int(11) DEFAULT NULL,
  `dateEmprunt` datetime DEFAULT NULL,
  `dateRetour` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `emprunts`
--

INSERT INTO `emprunts` (`id`, `idExemplaire`, `idEmprunteur`, `nombreEmprunt`, `dateEmprunt`, `dateRetour`, `createdAt`, `updatedAt`) VALUES
(3, 5, 4, 0, '2023-04-23 00:00:00', '2023-04-12 00:00:00', '2023-04-22 21:19:31', '2023-04-22 21:19:53');

--
-- Déclencheurs `emprunts`
--
DELIMITER $$
CREATE TRIGGER `before_emprunt_add` AFTER INSERT ON `emprunts` FOR EACH ROW BEGIN INSERT INTO emprunt_audits (idEmprunt,idExemplaire,idEmprunteur, nombreEmprunt, dateEmprunt,AncienDateRetour,NouvelDateRetour, action, date, utilisateur) VALUES(NEW.id, NEW.idExemplaire, NEW.idEmprunteur, NEW.nombreEmprunt,NEW.dateEmprunt,'', NEW.dateRetour,'Insertion',now(),user());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_emprunt_delete` AFTER DELETE ON `emprunts` FOR EACH ROW BEGIN INSERT INTO emprunt_audits (idEmprunt,idExemplaire,idEmprunteur, nombreEmprunt, dateEmprunt,AncienDateRetour,NouvelDateRetour, action, date, utilisateur) VALUES(OLD.id,OLD.idExemplaire ,OLD.idEmprunteur, OLD.nombreEmprunt,OLD.dateEmprunt,OLD.dateRetour,OLD.dateRetour,'Suppression',now(),user());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_emprunt_update` AFTER UPDATE ON `emprunts` FOR EACH ROW BEGIN INSERT INTO emprunt_audits (idEmprunt,idExemplaire,idEmprunteur, nombreEmprunt, dateEmprunt,AncienDateRetour,NouvelDateRetour, action, date, utilisateur) VALUES(OLD.id, OLD.idExemplaire ,OLD.idEmprunteur, OLD.nombreEmprunt,OLD.dateEmprunt,OLD.dateRetour, NEW.dateRetour,'Modification',now(),user());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `emprunt_audits`
--

CREATE TABLE `emprunt_audits` (
  `id` int(11) NOT NULL,
  `idEmprunt` int(11) DEFAULT NULL,
  `idExemplaire` int(11) DEFAULT NULL,
  `idEmprunteur` int(11) DEFAULT NULL,
  `nombreEmprunt` int(11) DEFAULT NULL,
  `dateEmprunt` datetime DEFAULT NULL,
  `AncienDateRetour` datetime DEFAULT NULL,
  `NouvelDateRetour` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `utilisateur` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `emprunt_audits`
--

INSERT INTO `emprunt_audits` (`id`, `idEmprunt`, `idExemplaire`, `idEmprunteur`, `nombreEmprunt`, `dateEmprunt`, `AncienDateRetour`, `NouvelDateRetour`, `action`, `date`, `utilisateur`, `createdAt`, `updatedAt`) VALUES
(1, 1, 2, 1, 1, '2023-04-03 10:47:44', '0000-00-00 00:00:00', '2023-04-20 10:47:44', 'Insertion', '2023-04-22 10:48:29', 'root@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 2, 1, 1, '2023-04-03 10:47:44', '2023-04-20 10:47:44', '2023-04-19 10:47:44', 'Modification', '2023-04-22 10:53:50', 'root@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 2, 1, 1, '2023-04-03 10:47:44', '2023-04-19 10:47:44', '2023-04-19 10:47:44', 'Suppression', '2023-04-22 10:57:52', 'root@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 2, 4, 1, 5, '2023-04-23 00:00:00', '0000-00-00 00:00:00', '2023-04-30 00:00:00', 'Insertion', '2023-04-22 21:08:40', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 3, 5, 4, 1, '2023-04-23 00:00:00', '0000-00-00 00:00:00', '2023-04-19 00:00:00', 'Insertion', '2023-04-22 21:19:31', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 3, 5, 4, 1, '2023-04-23 00:00:00', '2023-04-19 00:00:00', '2023-04-12 00:00:00', 'Modification', '2023-04-22 21:19:53', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 2, 4, 1, 5, '2023-04-23 00:00:00', '2023-04-30 00:00:00', '2023-04-30 00:00:00', 'Suppression', '2023-04-22 21:21:50', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 4, 6, 7, 5, '2023-04-23 00:00:00', '0000-00-00 00:00:00', '2023-05-05 00:00:00', 'Insertion', '2023-04-22 21:33:43', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 4, 6, 7, 5, '2023-04-23 00:00:00', '2023-05-05 00:00:00', '2023-05-05 00:00:00', 'Suppression', '2023-04-22 21:44:58', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 5, 3, 8, 6, '2023-04-19 00:00:00', '0000-00-00 00:00:00', '2023-04-27 00:00:00', 'Insertion', '2023-04-22 21:47:56', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 5, 3, 8, 6, '2023-04-19 00:00:00', '2023-04-27 00:00:00', '2023-04-27 00:00:00', 'Suppression', '2023-04-22 21:48:10', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `exemplaires`
--

CREATE TABLE `exemplaires` (
  `id` int(11) NOT NULL,
  `idLivre` int(11) DEFAULT NULL,
  `nombreExemplaire` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `exemplaires`
--

INSERT INTO `exemplaires` (`id`, `idLivre`, `nombreExemplaire`, `createdAt`, `updatedAt`) VALUES
(1, 23, 2, '2023-04-22 09:37:42', '2023-04-22 18:32:14'),
(3, NULL, 25, '2023-04-22 17:20:41', '2023-04-22 18:27:54'),
(4, 0, 4, '2023-04-22 17:22:31', '2023-04-22 17:33:11'),
(5, 17, 7, '2023-04-22 17:43:48', '2023-04-23 09:18:05'),
(6, 23, 6, '2023-04-22 18:03:34', '2023-04-22 18:03:34'),
(8, 21, 90, '2023-04-22 18:07:50', '2023-04-23 09:57:09'),
(10, 13, 6, '2023-04-23 09:50:47', '2023-04-23 09:50:47');

--
-- Déclencheurs `exemplaires`
--
DELIMITER $$
CREATE TRIGGER `before_exemplaire_add` AFTER INSERT ON `exemplaires` FOR EACH ROW BEGIN INSERT INTO exemplaire_audits (idExemplaire, ancienNombre, nouveauNombre, action, date, utilisateur) VALUES(NEW.id,'' , NEW.nombreExemplaire,'Insertion',now(),user());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_exemplaire_delete` AFTER DELETE ON `exemplaires` FOR EACH ROW BEGIN INSERT INTO exemplaire_audits (idExemplaire, ancienNombre, nouveauNombre, action, date, utilisateur) VALUES(OLD.id,OLD.nombreExemplaire , OLD.nombreExemplaire,'Suppression',now(),user());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_exemplaire_update` AFTER UPDATE ON `exemplaires` FOR EACH ROW BEGIN INSERT INTO exemplaire_audits (idExemplaire, ancienNombre, nouveauNombre, action, date, utilisateur) VALUES(OLD.id,OLD.nombreExemplaire , NEW.nombreExemplaire,'Modification',now(),user());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `exemplaire_audits`
--

CREATE TABLE `exemplaire_audits` (
  `id` int(11) NOT NULL,
  `idExemplaire` int(11) DEFAULT NULL,
  `ancienNombre` int(11) DEFAULT NULL,
  `nouveauNombre` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `utilisateur` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `exemplaire_audits`
--

INSERT INTO `exemplaire_audits` (`id`, `idExemplaire`, `ancienNombre`, `nouveauNombre`, `action`, `date`, `utilisateur`, `createdAt`, `updatedAt`) VALUES
(1, 1, 0, 5, '2023-04-22 10:38:09', '0000-00-00 00:00:00', 'root@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 0, 5, 'Insertion', '2023-04-22 10:41:25', 'root@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 5, 2, 'Modification', '2023-04-22 10:43:09', 'root@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 2, 5, 5, 'Suppression', '2023-04-22 10:44:40', 'root@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 3, 0, 23, 'Insertion', '2023-04-22 17:20:41', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 4, 0, NULL, 'Insertion', '2023-04-22 17:22:31', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 4, NULL, 4, 'Modification', '2023-04-22 17:33:11', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 5, 0, NULL, 'Insertion', '2023-04-22 17:43:49', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 5, NULL, 7, 'Modification', '2023-04-22 17:46:02', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 6, 0, 6, 'Insertion', '2023-04-22 18:03:34', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 7, 0, 8, 'Insertion', '2023-04-22 18:07:13', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 8, 0, 9, 'Insertion', '2023-04-22 18:07:50', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 1, 2, 23, 'Modification', '2023-04-22 18:25:50', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 1, 23, 2, 'Modification', '2023-04-22 18:26:04', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 1, 2, 2, 'Modification', '2023-04-22 18:26:14', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 1, 2, 2, 'Modification', '2023-04-22 18:26:26', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 1, 2, 2, 'Modification', '2023-04-22 18:26:35', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 5, 7, 7, 'Modification', '2023-04-22 18:27:11', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 5, 7, 7, 'Modification', '2023-04-22 18:27:22', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 3, 23, 25, 'Modification', '2023-04-22 18:27:54', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 1, 2, 2, 'Modification', '2023-04-22 18:28:20', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 1, 2, 2, 'Modification', '2023-04-22 18:30:50', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 1, 2, 2, 'Modification', '2023-04-22 18:31:44', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 1, 2, 2, 'Modification', '2023-04-22 18:32:05', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 1, 2, 2, 'Modification', '2023-04-22 18:32:14', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 7, 8, 8, 'Suppression', '2023-04-22 18:56:59', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 9, 0, 6, 'Insertion', '2023-04-22 20:35:08', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 9, 6, 6, 'Modification', '2023-04-22 20:35:20', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 9, 6, 6, 'Suppression', '2023-04-22 21:41:24', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 5, 7, 7, 'Modification', '2023-04-23 09:18:05', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 10, 0, 6, 'Insertion', '2023-04-23 09:50:47', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 8, 9, 90, 'Modification', '2023-04-23 09:51:28', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 8, 90, 90, 'Modification', '2023-04-23 09:57:09', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `id` int(11) NOT NULL,
  `TitreLivre` text DEFAULT NULL,
  `AuteurLivre` text DEFAULT NULL,
  `EditeurLivre` text DEFAULT NULL,
  `DateParution` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`id`, `TitreLivre`, `AuteurLivre`, `EditeurLivre`, `DateParution`, `createdAt`, `updatedAt`) VALUES
(13, 'IDM Manipulation', 'Mara', 'Sambelahatse', '2023-04-04 00:00:00', '2023-04-20 19:59:59', '2023-04-22 12:17:26'),
(14, 'Sambelahatse', 'Joseph', 'Olona', '2023-04-15 00:00:00', '2023-04-20 20:25:27', '2023-04-20 20:25:27'),
(17, 'Etat de l\'art', 'Felana', 'Mara', '2023-04-21 00:00:00', '2023-04-21 14:35:05', '2023-04-21 14:35:05'),
(21, 'La neolitisme', 'Antsa', 'Sam', '2023-04-27 00:00:00', '2023-04-22 08:59:04', '2023-04-23 10:59:52'),
(22, 'Red teamers', 'Sambelahatse', 'Laude', '2023-04-23 00:00:00', '2023-04-22 08:25:00', '2023-04-23 11:03:37');

--
-- Déclencheurs `livres`
--
DELIMITER $$
CREATE TRIGGER `before_livre_add` AFTER INSERT ON `livres` FOR EACH ROW BEGIN INSERT INTO livre_audits (idLvre, ancienTitreLivre, nouvelTitreLivre, action, date, utilisateur) VALUES (NEW.id,'' ,NEW.TitreLivre, 'Insertion', now(), user());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_livre_delete` AFTER DELETE ON `livres` FOR EACH ROW BEGIN INSERT INTO livre_audits(idLvre, ancienTitreLivre,nouvelTitreLivre,action,date,utilisateur) values(OLD.id, OLD.titreLivre,OLD.titreLivre,'Suppression', now(), user());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_livre_update` AFTER UPDATE ON `livres` FOR EACH ROW BEGIN INSERT INTO livre_audits(idLvre, ancienTitreLivre,nouvelTitreLivre,action,date,utilisateur ) values(OLD.id, OLD.titreLivre,NEW.titreLivre,'Modificatiion', now(), user());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `livre_audits`
--

CREATE TABLE `livre_audits` (
  `id` int(11) NOT NULL,
  `idLvre` int(11) DEFAULT NULL,
  `ancienTitreLivre` varchar(255) DEFAULT NULL,
  `nouvelTitreLivre` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `utilisateur` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livre_audits`
--

INSERT INTO `livre_audits` (`id`, `idLvre`, `ancienTitreLivre`, `nouvelTitreLivre`, `action`, `date`, `utilisateur`, `createdAt`, `updatedAt`) VALUES
(1, 21, '', 'Qwertyuiop', 'Insertion', '2023-04-22 09:59:42', 'root@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 13, 'Titre de mon Livre', 'IDM Manipulation', 'Modificatiion', '2023-04-22 10:06:23', 'root@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 7, 'Titre de mon livre', 'Titre de mon livre', 'Supprimer', '2023-04-22 10:11:01', 'root@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 22, '', 'MaraLivre', 'Insertion', '2023-04-22 08:25:00', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 13, 'IDM Manipulation', 'IDM Manipulation', 'Modificatiion', '2023-04-22 08:30:58', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 23, '', 'Sidina Machine Learning basic', 'Insertion', '2023-04-22 10:38:29', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 23, 'Sidina Machine Learning basic', 'Sidina Machine Learning basic', 'Modificatiion', '2023-04-22 10:38:56', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 16, 'Titre de mon livreqwerty', 'Titre de mon livreqwerty', 'Suppression', '2023-04-22 10:43:01', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 13, 'IDM Manipulation', 'IDM Manipulation', 'Modificatiion', '2023-04-22 11:54:32', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 13, 'IDM Manipulation', 'IDM Manipulation', 'Modificatiion', '2023-04-22 11:54:41', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 13, 'IDM Manipulation', 'IDM Manipulation', 'Modificatiion', '2023-04-22 11:54:50', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 13, 'IDM Manipulation', 'IDM Manipulation', 'Modificatiion', '2023-04-22 12:17:13', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 13, 'IDM Manipulation', 'IDM Manipulation', 'Modificatiion', '2023-04-22 12:17:26', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 23, 'Sidina Machine Learning basic', 'Sidina Machine Learning basic', 'Modificatiion', '2023-04-22 12:18:36', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 24, '', 'My Livre', 'Insertion', '2023-04-22 19:28:59', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 23, 'Sidina Machine Learning basic', 'Sidina Machine Learning basic', 'Suppression', '2023-04-22 19:29:10', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 24, 'My Livre', 'My Livre', 'Suppression', '2023-04-22 21:41:24', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 21, 'Qwertyuiop', 'La neolitisme', 'Modificatiion', '2023-04-23 10:59:52', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 22, 'MaraLivre', 'Red teamers', 'Modificatiion', '2023-04-23 11:03:38', 'mara@localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20230417171103-create-menu.js'),
('20230417182006-create-livre.js'),
('20230418161447-create-bibliothecaire.js'),
('20230420070540-create-livre-audit.js'),
('20230420071121-create-exemplaire.js'),
('20230420071425-create-exemplaire-audit.js'),
('20230420071618-create-emprunteur.js'),
('20230420071747-create-emprunteur-audit.js'),
('20230420072118-create-emprunt.js'),
('20230420072439-create-emprunt-audit.js');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bibliothecaires`
--
ALTER TABLE `bibliothecaires`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `emprunteurs`
--
ALTER TABLE `emprunteurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `emprunteur_audits`
--
ALTER TABLE `emprunteur_audits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `emprunt_audits`
--
ALTER TABLE `emprunt_audits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `exemplaires`
--
ALTER TABLE `exemplaires`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `exemplaire_audits`
--
ALTER TABLE `exemplaire_audits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `livre_audits`
--
ALTER TABLE `livre_audits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bibliothecaires`
--
ALTER TABLE `bibliothecaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `emprunteurs`
--
ALTER TABLE `emprunteurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `emprunteur_audits`
--
ALTER TABLE `emprunteur_audits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `emprunts`
--
ALTER TABLE `emprunts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `emprunt_audits`
--
ALTER TABLE `emprunt_audits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `exemplaires`
--
ALTER TABLE `exemplaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `exemplaire_audits`
--
ALTER TABLE `exemplaire_audits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `livres`
--
ALTER TABLE `livres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `livre_audits`
--
ALTER TABLE `livre_audits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
