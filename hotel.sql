-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: database:3306
-- Creato il: Gen 13, 2021 alle 16:39
-- Versione del server: 5.7.32
-- Versione PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `camera`
--

CREATE TABLE `camera` (
  `cam_id` int(11) NOT NULL,
  `cam_n_persone` tinyint(4) NOT NULL,
  `cam_servizi` varchar(20) NOT NULL,
  `cam_tv` varchar(20) NOT NULL,
  `cam_cassaforte` tinyint(4) NOT NULL,
  `cam_aria_condizionata` tinyint(4) NOT NULL,
  `cam_frigo_bar` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ospite`
--

CREATE TABLE `ospite` (
  `osp_id` int(11) NOT NULL,
  `osp_nome` varchar(50) NOT NULL,
  `osp_cognome` varchar(50) NOT NULL,
  `osp_n_telefono` varchar(20) NOT NULL,
  `osp_n_doc_identità` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazione`
--

CREATE TABLE `prenotazione` (
  `pre_id` int(11) NOT NULL,
  `pre_data_inizio` date NOT NULL,
  `pre_data_fine` date NOT NULL,
  `pre_camera` int(11) NOT NULL,
  `pre_ospite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `camera`
--
ALTER TABLE `camera`
  ADD PRIMARY KEY (`cam_id`);

--
-- Indici per le tabelle `ospite`
--
ALTER TABLE `ospite`
  ADD PRIMARY KEY (`osp_id`);

--
-- Indici per le tabelle `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD PRIMARY KEY (`pre_id`),
  ADD KEY `fk_pre_ospite` (`pre_ospite`),
  ADD KEY `fk_pre_camera` (`pre_camera`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `camera`
--
ALTER TABLE `camera`
  MODIFY `cam_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ospite`
--
ALTER TABLE `ospite`
  MODIFY `osp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  MODIFY `pre_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD CONSTRAINT `fk_pre_camera` FOREIGN KEY (`pre_camera`) REFERENCES `camera` (`cam_id`),
  ADD CONSTRAINT `fk_pre_ospite` FOREIGN KEY (`pre_ospite`) REFERENCES `ospite` (`osp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
