-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Dim 22 Juillet 2018 à 18:11
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestionpaie`
--

-- --------------------------------------------------------

--
-- Structure de la table `bulletin`
--

CREATE TABLE `bulletin` (
  `idBulletin` bigint(20) NOT NULL,
  `codeBulletin` varchar(255) DEFAULT NULL,
  `dateDeb` datetime DEFAULT NULL,
  `dateFin` datetime DEFAULT NULL,
  `nomBul` varchar(255) DEFAULT NULL,
  `periode` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `bulletin`
--

INSERT INTO `bulletin` (`idBulletin`, `codeBulletin`, `dateDeb`, `dateFin`, `nomBul`, `periode`) VALUES
(1, 'HSSJ', NULL, NULL, 'HSJKKKSKS', 'Juillet 2018'),
(3, 'a3f1f4f1-cea0-4734-aae7-2895444f888e', NULL, NULL, 'UTAPATA_Juillet_2018', 'Juillet 2018');

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

CREATE TABLE `contrat` (
  `idContrat` bigint(20) NOT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `salaireBase` decimal(19,2) DEFAULT NULL,
  `titrePoste` varchar(255) DEFAULT NULL,
  `typeContrat` varchar(255) DEFAULT NULL,
  `idEmpl` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `contrat`
--

INSERT INTO `contrat` (`idContrat`, `ref`, `salaireBase`, `titrePoste`, `typeContrat`, `idEmpl`) VALUES
(1, 'CDD-06-2018', '7.00', 'Responsable Informatique', 'CDI', 1),
(3, 'DFGSS', '15.00', 'Chargé communication', 'CDI', 2);

-- --------------------------------------------------------

--
-- Structure de la table `contribution`
--

CREATE TABLE `contribution` (
  `id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `idDep` bigint(20) NOT NULL,
  `depParent` varchar(255) DEFAULT NULL,
  `gestionnaire` varchar(255) DEFAULT NULL,
  `nomDep` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `departement`
--

INSERT INTO `departement` (`idDep`, `depParent`, `gestionnaire`, `nomDep`) VALUES
(1, 'Administration', 'Kriss bizz', 'Informatique'),
(2, 'Administration', '', 'Communication');

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `idEmpl` bigint(20) NOT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `nomEmpl` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `poste` varchar(255) DEFAULT NULL,
  `idDep` bigint(20) DEFAULT NULL,
  `idLieu` bigint(20) DEFAULT NULL,
  `enfant` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `employe`
--

INSERT INTO `employe` (`idEmpl`, `adress`, `mail`, `nomEmpl`, `photo`, `poste`, `idDep`, `idLieu`, `enfant`) VALUES
(1, 'Nguba', 'bizzkriss@gmail.com', 'kriss bizz', NULL, NULL, 1, NULL, 4),
(2, 'Bukavu', 'utapata@gmail.com', 'UTAPATA KWIGOMBA', 'https://farm1.static.flickr.com/852/42854768094_974df8d24d_z.jpg', NULL, 2, NULL, 4);

-- --------------------------------------------------------

--
-- Structure de la table `lieu_affectation`
--

CREATE TABLE `lieu_affectation` (
  `idLieu` bigint(20) NOT NULL,
  `codeLieu` varchar(255) DEFAULT NULL,
  `gestionnaire` varchar(255) DEFAULT NULL,
  `nomLieu` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lieu_affectation`
--

INSERT INTO `lieu_affectation` (`idLieu`, `codeLieu`, `gestionnaire`, `nomLieu`) VALUES
(1, 'KARH', 'Kriss bizz', 'Campus de Karhale'),
(2, 'CD455', 'UTAPATA KWIGOMBA', 'Campus de Bugabo');

-- --------------------------------------------------------

--
-- Structure de la table `lots`
--

CREATE TABLE `lots` (
  `idLot` bigint(20) NOT NULL,
  `avoir` decimal(19,2) DEFAULT NULL,
  `dateDeb` datetime DEFAULT NULL,
  `dateFin` datetime DEFAULT NULL,
  `etat` varchar(255) DEFAULT NULL,
  `nomLot` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `prestation`
--

CREATE TABLE `prestation` (
  `idPrest` bigint(20) NOT NULL,
  `datePrestation` datetime DEFAULT NULL,
  `heureDebut` varchar(255) DEFAULT NULL,
  `heureFin` varchar(255) DEFAULT NULL,
  `heurePrest` bigint(20) DEFAULT NULL,
  `periode` varchar(255) DEFAULT NULL,
  `idEmpl` bigint(20) DEFAULT NULL,
  `idLieu` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `prestation`
--

INSERT INTO `prestation` (`idPrest`, `datePrestation`, `heureDebut`, `heureFin`, `heurePrest`, `periode`, `idEmpl`, `idLieu`) VALUES
(1, '2018-07-07 09:29:00', '08:00', '16:00', 8, 'Juillet 2018', 1, 1),
(2, '2018-07-12 09:29:00', '08:00', '16:00', 8, 'Juillet 2018', 1, 1),
(3, '2018-07-22 20:18:00', '08:00', '16:00', 8, 'Juillet 2018', 2, 2),
(4, '2018-07-23 20:19:00', '08:00', '17:00', 9, 'Juillet 2018', 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `idRole` bigint(20) NOT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `idUtilisateur` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `roles`
--

INSERT INTO `roles` (`idRole`, `roleName`, `idUtilisateur`) VALUES
(3, 'ROLE_ADMIN', 2),
(2, 'ROLE_ADMIN', 1);

-- --------------------------------------------------------

--
-- Structure de la table `salaire`
--

CREATE TABLE `salaire` (
  `idSalaire` bigint(20) NOT NULL,
  `annuites` decimal(19,2) DEFAULT NULL,
  `codeSalaire` varchar(255) DEFAULT NULL,
  `heureSup` int(11) NOT NULL,
  `periode` varchar(255) DEFAULT NULL,
  `primeDipmlome` decimal(19,2) DEFAULT NULL,
  `primeFonction` decimal(19,2) DEFAULT NULL,
  `regularisation` decimal(19,2) DEFAULT NULL,
  `idBulletin` bigint(20) DEFAULT NULL,
  `idEmpl` bigint(20) DEFAULT NULL,
  `accompte` decimal(19,2) DEFAULT NULL,
  `avance` decimal(19,2) DEFAULT NULL,
  `contribution` decimal(19,2) DEFAULT NULL,
  `epargne` decimal(19,2) DEFAULT NULL,
  `familliale` decimal(19,2) DEFAULT NULL,
  `ferme` decimal(19,2) DEFAULT NULL,
  `inss` decimal(19,2) DEFAULT NULL,
  `logement` decimal(19,2) DEFAULT NULL,
  `muso` decimal(19,2) DEFAULT NULL,
  `pretEchus` decimal(19,2) DEFAULT NULL,
  `retenu` decimal(19,2) DEFAULT NULL,
  `suspendu` decimal(19,2) DEFAULT NULL,
  `transport` decimal(19,2) DEFAULT NULL,
  `acompte` decimal(19,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `salaire`
--

INSERT INTO `salaire` (`idSalaire`, `annuites`, `codeSalaire`, `heureSup`, `periode`, `primeDipmlome`, `primeFonction`, `regularisation`, `idBulletin`, `idEmpl`, `accompte`, `avance`, `contribution`, `epargne`, `familliale`, `ferme`, `inss`, `logement`, `muso`, `pretEchus`, `retenu`, `suspendu`, `transport`, `acompte`) VALUES
(1, '12.00', 'SJED', 0, 'Juillet 2018', '15.00', '24.00', '20.00', 1, 1, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Structure de la table `temps`
--

CREATE TABLE `temps` (
  `idTemp` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUtilisateur` bigint(20) NOT NULL,
  `actived` bit(1) NOT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `motDePasse` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `actived`, `mail`, `motDePasse`, `nom`, `photo`, `prenom`) VALUES
(1, b'0', 'kriss@gmail.com', '581918322537', 'kriss', '', 'bizz'),
(2, b'1', 'admin@test.com', 'admin', 'admin', '', 'admin');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `bulletin`
--
ALTER TABLE `bulletin`
  ADD PRIMARY KEY (`idBulletin`);

--
-- Index pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD PRIMARY KEY (`idContrat`),
  ADD KEY `FK9BEFFB9322D42864` (`idEmpl`);

--
-- Index pour la table `contribution`
--
ALTER TABLE `contribution`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`idDep`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`idEmpl`),
  ADD KEY `FK9F32AC975CAEF571` (`idDep`),
  ADD KEY `FK9F32AC976EE0D68` (`idLieu`);

--
-- Index pour la table `lieu_affectation`
--
ALTER TABLE `lieu_affectation`
  ADD PRIMARY KEY (`idLieu`);

--
-- Index pour la table `lots`
--
ALTER TABLE `lots`
  ADD PRIMARY KEY (`idLot`);

--
-- Index pour la table `prestation`
--
ALTER TABLE `prestation`
  ADD PRIMARY KEY (`idPrest`),
  ADD KEY `FKE82F7D5122D42864` (`idEmpl`),
  ADD KEY `FKE82F7D516EE0D68` (`idLieu`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRole`),
  ADD KEY `FK4B79E9DC73A1799` (`idUtilisateur`);

--
-- Index pour la table `salaire`
--
ALTER TABLE `salaire`
  ADD PRIMARY KEY (`idSalaire`),
  ADD KEY `FKD24AE519A45C39B` (`idBulletin`),
  ADD KEY `FKD24AE51922D42864` (`idEmpl`);

--
-- Index pour la table `temps`
--
ALTER TABLE `temps`
  ADD PRIMARY KEY (`idTemp`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `bulletin`
--
ALTER TABLE `bulletin`
  MODIFY `idBulletin` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `contrat`
--
ALTER TABLE `contrat`
  MODIFY `idContrat` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `contribution`
--
ALTER TABLE `contribution`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `departement`
--
ALTER TABLE `departement`
  MODIFY `idDep` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `idEmpl` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `lieu_affectation`
--
ALTER TABLE `lieu_affectation`
  MODIFY `idLieu` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `lots`
--
ALTER TABLE `lots`
  MODIFY `idLot` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `prestation`
--
ALTER TABLE `prestation`
  MODIFY `idPrest` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `idRole` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `salaire`
--
ALTER TABLE `salaire`
  MODIFY `idSalaire` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `temps`
--
ALTER TABLE `temps`
  MODIFY `idTemp` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUtilisateur` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
