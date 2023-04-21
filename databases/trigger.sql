-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 21 avr. 2023 à 16:56
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
(7, 'Titre de mon livre', 'Sambelahatse', 'Editeur de mon Joseph', '0000-00-00 00:00:00', '2023-04-20 18:58:44', '2023-04-20 20:21:34'),
(13, 'Titre de mon Livre', 'Mara', 'Sambelahatse', '2023-04-20 00:00:00', '2023-04-20 19:59:59', '2023-04-20 19:59:59'),
(14, 'Sambelahatse', 'Joseph', 'Olona', '2023-04-15 00:00:00', '2023-04-20 20:25:27', '2023-04-20 20:25:27'),
(16, 'Titre de mon livreqwerty', 'Sambelahatse', 'Editeur de mon Joseph', '0000-00-00 00:00:00', '2023-04-20 20:51:00', '2023-04-20 20:51:00'),
(17, 'Etat de l\'art', 'Felana', 'Mara', '2023-04-21 00:00:00', '2023-04-21 14:35:05', '2023-04-21 14:35:05');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `emprunteur_audits`
--
ALTER TABLE `emprunteur_audits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `emprunts`
--
ALTER TABLE `emprunts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `emprunt_audits`
--
ALTER TABLE `emprunt_audits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `exemplaires`
--
ALTER TABLE `exemplaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `exemplaire_audits`
--
ALTER TABLE `exemplaire_audits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `livres`
--
ALTER TABLE `livres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `livre_audits`
--
ALTER TABLE `livre_audits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
