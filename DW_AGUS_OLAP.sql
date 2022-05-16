-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 16, 2022 at 11:00 AM
-- Server version: 8.0.29-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DW_AGUS_OLAP`
--

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

CREATE TABLE `cabang` (
  `cabang_id` varchar(5) NOT NULL,
  `nama_cabang` varchar(50) NOT NULL,
  `cabang delete` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cabang`
--

INSERT INTO `cabang` (`cabang_id`, `nama_cabang`, `cabang delete`) VALUES
('OLTP1', 'Surabaya', 0),
('OLTP2', 'Bali', 0),
('OLTP3', 'Makassar', 0);

-- --------------------------------------------------------

--
-- Table structure for table `penyewa`
--

CREATE TABLE `penyewa` (
  `id_penyewa` varchar(20) NOT NULL,
  `nama_penyewa` varchar(50) NOT NULL,
  `username_penyewa` varchar(25) NOT NULL,
  `alamat_penyewa` varchar(200) NOT NULL,
  `telp_penyewa` varchar(15) NOT NULL,
  `saldo_penyewa` decimal(8,0) UNSIGNED NOT NULL,
  `email_address` varchar(200) NOT NULL,
  `cabang_id` varchar(5) NOT NULL,
  `penyewa_delete` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `penyewa`
--

INSERT INTO `penyewa` (`id_penyewa`, `nama_penyewa`, `username_penyewa`, `alamat_penyewa`, `telp_penyewa`, `saldo_penyewa`, `email_address`, `cabang_id`, `penyewa_delete`) VALUES
('AB001', 'Arien Bruce', 'ArienBruce', 'Christie Way2', '081332554002', '2000', 'ArienBruce@gmail.com', 'OLTP1', 0),
('AB002', 'Arien Brooks', 'ArienBrooks', 'Pinewood Drive15', '081332554015', '15000', 'ArienBrooks@gmail.com', 'OLTP1', 0),
('AB003', 'Ayline Bruce', 'AylineBruce', 'Christie Way22', '081332554022', '22000', 'AylineBruce@gmail.com', 'OLTP1', 0),
('AB004', 'Ayline Brooks', 'AylineBrooks', 'Pinewood Drive35', '081332554035', '35000', 'AylineBrooks@gmail.com', 'OLTP1', 0),
('AB005', 'Andraya Bruce', 'AndrayaBruce', 'Christie Way62', '081332554062', '62000', 'AndrayaBruce@gmail.com', 'OLTP1', 0),
('AB006', 'Andraya Brooks', 'AndrayaBrooks', 'Pinewood Drive75', '081332554075', '75000', 'AndrayaBrooks@gmail.com', 'OLTP1', 0),
('AC001', 'Arien Clay', 'ArienClay', 'Hidden Valley Road12', '081332554012', '12000', 'ArienClay@gmail.com', 'OLTP1', 0),
('AC002', 'Arien Case', 'ArienCase', 'Traders Alley20', '081332554020', '20000', 'ArienCase@gmail.com', 'OLTP1', 0),
('AC003', 'Ayline Clay', 'AylineClay', 'Hidden Valley Road32', '081332554032', '32000', 'AylineClay@gmail.com', 'OLTP1', 0),
('AC004', 'Ayline Case', 'AylineCase', 'Traders Alley40', '081332554040', '40000', 'AylineCase@gmail.com', 'OLTP1', 0),
('AC005', 'Andraya Clay', 'AndrayaClay', 'Hidden Valley Road72', '081332554072', '72000', 'AndrayaClay@gmail.com', 'OLTP1', 0),
('AC006', 'Andraya Case', 'AndrayaCase', 'Traders Alley80', '081332554080', '80000', 'AndrayaCase@gmail.com', 'OLTP1', 0),
('AD001', 'Arien Dickerson', 'ArienDickerson', 'Valley Lane7', '081332554007', '7000', 'ArienDickerson@gmail.com', 'OLTP1', 0),
('AD002', 'Arien Daugherty', 'ArienDaugherty', 'University Hill Road10', '081332554010', '10000', 'ArienDaugherty@gmail.com', 'OLTP1', 0),
('AD003', 'Arien Deleon', 'ArienDeleon', 'Simpson Avenue16', '081332554016', '16000', 'ArienDeleon@gmail.com', 'OLTP1', 0),
('AD004', 'Ayline Dickerson', 'AylineDickerson', 'Valley Lane27', '081332554027', '27000', 'AylineDickerson@gmail.com', 'OLTP1', 0),
('AD005', 'Ayline Daugherty', 'AylineDaugherty', 'University Hill Road30', '081332554030', '30000', 'AylineDaugherty@gmail.com', 'OLTP1', 0),
('AD006', 'Ayline Deleon', 'AylineDeleon', 'Simpson Avenue36', '081332554036', '36000', 'AylineDeleon@gmail.com', 'OLTP1', 0),
('AD007', 'Andraya Dickerson', 'AndrayaDickerson', 'Valley Lane67', '081332554067', '67000', 'AndrayaDickerson@gmail.com', 'OLTP1', 0),
('AD008', 'Andraya Daugherty', 'AndrayaDaugherty', 'University Hill Road70', '081332554070', '70000', 'AndrayaDaugherty@gmail.com', 'OLTP1', 0),
('AD009', 'Andraya Deleon', 'AndrayaDeleon', 'Simpson Avenue76', '081332554076', '76000', 'AndrayaDeleon@gmail.com', 'OLTP1', 0),
('AG001', 'Arien Guerrero', 'ArienGuerrero', 'Locust Court3', '081332554003', '3000', 'ArienGuerrero@gmail.com', 'OLTP1', 0),
('AG002', 'Ayline Guerrero', 'AylineGuerrero', 'Locust Court23', '081332554023', '23000', 'AylineGuerrero@gmail.com', 'OLTP1', 0),
('AG003', 'Andraya Guerrero', 'AndrayaGuerrero', 'Locust Court63', '081332554063', '63000', 'AndrayaGuerrero@gmail.com', 'OLTP1', 0),
('AH001', 'Arien Holt', 'ArienHolt', 'Keyser Ridge Road13', '081332554013', '13000', 'ArienHolt@gmail.com', 'OLTP1', 0),
('AH002', 'Arien Horne', 'ArienHorne', 'Calico Drive17', '081332554017', '17000', 'ArienHorne@gmail.com', 'OLTP1', 0),
('AH003', 'Arien Haley', 'ArienHaley', 'Renwick Drive19', '081332554019', '19000', 'ArienHaley@gmail.com', 'OLTP1', 0),
('AH004', 'Ayline Holt', 'AylineHolt', 'Keyser Ridge Road33', '081332554033', '33000', 'AylineHolt@gmail.com', 'OLTP1', 0),
('AH005', 'Ayline Horne', 'AylineHorne', 'Calico Drive37', '081332554037', '37000', 'AylineHorne@gmail.com', 'OLTP1', 0),
('AH006', 'Ayline Haley', 'AylineHaley', 'Renwick Drive39', '081332554039', '39000', 'AylineHaley@gmail.com', 'OLTP1', 0),
('AH007', 'Andraya Holt', 'AndrayaHolt', 'Keyser Ridge Road73', '081332554073', '73000', 'AndrayaHolt@gmail.com', 'OLTP1', 0),
('AH008', 'Andraya Horne', 'AndrayaHorne', 'Calico Drive77', '081332554077', '77000', 'AndrayaHorne@gmail.com', 'OLTP1', 0),
('AH009', 'Andraya Haley', 'AndrayaHaley', 'Renwick Drive79', '081332554079', '79000', 'AndrayaHaley@gmail.com', 'OLTP1', 0),
('AM001', 'Arien Mooney', 'ArienMooney', 'Pyramid Valley Road6', '081332554006', '6000', 'ArienMooney@gmail.com', 'OLTP1', 0),
('AM002', 'Arien Mcmillan', 'ArienMcmillan', 'Emily Drive11', '081332554011', '11000', 'ArienMcmillan@gmail.com', 'OLTP1', 0),
('AM003', 'Arien Massey', 'ArienMassey', 'Libby Street18', '081332554018', '18000', 'ArienMassey@gmail.com', 'OLTP1', 0),
('AM004', 'Ayline Mooney', 'AylineMooney', 'Pyramid Valley Road26', '081332554026', '26000', 'AylineMooney@gmail.com', 'OLTP1', 0),
('AM005', 'Ayline Mcmillan', 'AylineMcmillan', 'Emily Drive31', '081332554031', '31000', 'AylineMcmillan@gmail.com', 'OLTP1', 0),
('AM006', 'Ayline Massey', 'AylineMassey', 'Libby Street38', '081332554038', '38000', 'AylineMassey@gmail.com', 'OLTP1', 0),
('AM007', 'Andraya Mooney', 'AndrayaMooney', 'Pyramid Valley Road66', '081332554066', '66000', 'AndrayaMooney@gmail.com', 'OLTP1', 0),
('AM008', 'Andraya Mcmillan', 'AndrayaMcmillan', 'Emily Drive71', '081332554071', '71000', 'AndrayaMcmillan@gmail.com', 'OLTP1', 0),
('AM009', 'Andraya Massey', 'AndrayaMassey', 'Libby Street78', '081332554078', '78000', 'AndrayaMassey@gmail.com', 'OLTP1', 0),
('AP001', 'Arien Porter', 'ArienPorter', 'Gambler Lane4', '081332554004', '4000', 'ArienPorter@gmail.com', 'OLTP1', 0),
('AP002', 'Arien Phelps', 'ArienPhelps', 'Hershell Hollow Road9', '081332554009', '9000', 'ArienPhelps@gmail.com', 'OLTP1', 0),
('AP003', 'Ayline Porter', 'AylinePorter', 'Gambler Lane24', '081332554024', '24000', 'AylinePorter@gmail.com', 'OLTP1', 0),
('AP004', 'Ayline Phelps', 'AylinePhelps', 'Hershell Hollow Road29', '081332554029', '29000', 'AylinePhelps@gmail.com', 'OLTP1', 0),
('AP005', 'Andraya Porter', 'AndrayaPorter', 'Gambler Lane64', '081332554064', '64000', 'AndrayaPorter@gmail.com', 'OLTP1', 0),
('AP006', 'Andraya Phelps', 'AndrayaPhelps', 'Hershell Hollow Road69', '081332554069', '69000', 'AndrayaPhelps@gmail.com', 'OLTP1', 0),
('AR001', 'Arien Riggs', 'ArienRiggs', 'Dane Street1', '081332554001', '1000', 'ArienRiggs@gmail.com', 'OLTP1', 0),
('AR002', 'Arien Roberts', 'ArienRoberts', 'Monroe Avenue5', '081332554005', '5000', 'ArienRoberts@gmail.com', 'OLTP1', 0),
('AR003', 'Arien Rhodes', 'ArienRhodes', 'Lawman Avenue14', '081332554014', '14000', 'ArienRhodes@gmail.com', 'OLTP1', 0),
('AR004', 'Ayline Riggs', 'AylineRiggs', 'Dane Street21', '081332554021', '21000', 'AylineRiggs@gmail.com', 'OLTP1', 0),
('AR005', 'Ayline Roberts', 'AylineRoberts', 'Monroe Avenue25', '081332554025', '25000', 'AylineRoberts@gmail.com', 'OLTP1', 0),
('AR006', 'Ayline Rhodes', 'AylineRhodes', 'Lawman Avenue34', '081332554034', '34000', 'AylineRhodes@gmail.com', 'OLTP1', 0),
('AR007', 'Andraya Riggs', 'AndrayaRiggs', 'Dane Street61', '081332554061', '61000', 'AndrayaRiggs@gmail.com', 'OLTP1', 0),
('AR008', 'Andraya Roberts', 'AndrayaRoberts', 'Monroe Avenue65', '081332554065', '65000', 'AndrayaRoberts@gmail.com', 'OLTP1', 0),
('AR009', 'Andraya Rhodes', 'AndrayaRhodes', 'Lawman Avenue74', '081332554074', '74000', 'AndrayaRhodes@gmail.com', 'OLTP1', 0),
('AW001', 'Arien Willis', 'ArienWillis', 'Bryan Avenue8', '081332554008', '8000', 'ArienWillis@gmail.com', 'OLTP1', 0),
('AW002', 'Ayline Willis', 'AylineWillis', 'Bryan Avenue28', '081332554028', '28000', 'AylineWillis@gmail.com', 'OLTP1', 0),
('AW003', 'Andraya Willis', 'AndrayaWillis', 'Bryan Avenue68', '081332554068', '68000', 'AndrayaWillis@gmail.com', 'OLTP1', 0),
('CB001', 'Cyncere Bruce', 'CyncereBruce', 'Christie Way82', '081332554082', '82000', 'CyncereBruce@gmail.com', 'OLTP1', 0),
('CB002', 'Cyncere Brooks', 'CyncereBrooks', 'Pinewood Drive95', '081332554095', '95000', 'CyncereBrooks@gmail.com', 'OLTP1', 0),
('CC001', 'Cyncere Clay', 'CyncereClay', 'Hidden Valley Road92', '081332554092', '92000', 'CyncereClay@gmail.com', 'OLTP1', 0),
('CC002', 'Cyncere Case', 'CyncereCase', 'Traders Alley100', '081332554100', '100000', 'CyncereCase@gmail.com', 'OLTP1', 0),
('CD001', 'Cyncere Dickerson', 'CyncereDickerson', 'Valley Lane87', '081332554087', '87000', 'CyncereDickerson@gmail.com', 'OLTP1', 0),
('CD002', 'Cyncere Daugherty', 'CyncereDaugherty', 'University Hill Road90', '081332554090', '90000', 'CyncereDaugherty@gmail.com', 'OLTP1', 0),
('CD003', 'Cyncere Deleon', 'CyncereDeleon', 'Simpson Avenue96', '081332554096', '96000', 'CyncereDeleon@gmail.com', 'OLTP1', 0),
('CG001', 'Cyncere Guerrero', 'CyncereGuerrero', 'Locust Court83', '081332554083', '83000', 'CyncereGuerrero@gmail.com', 'OLTP1', 0),
('CH001', 'Cyncere Holt', 'CyncereHolt', 'Keyser Ridge Road93', '081332554093', '93000', 'CyncereHolt@gmail.com', 'OLTP1', 0),
('CH002', 'Cyncere Horne', 'CyncereHorne', 'Calico Drive97', '081332554097', '97000', 'CyncereHorne@gmail.com', 'OLTP1', 0),
('CH003', 'Cyncere Haley', 'CyncereHaley', 'Renwick Drive99', '081332554099', '99000', 'CyncereHaley@gmail.com', 'OLTP1', 0),
('CM001', 'Cyncere Mooney', 'CyncereMooney', 'Pyramid Valley Road86', '081332554086', '86000', 'CyncereMooney@gmail.com', 'OLTP1', 0),
('CM002', 'Cyncere Mcmillan', 'CyncereMcmillan', 'Emily Drive91', '081332554091', '91000', 'CyncereMcmillan@gmail.com', 'OLTP1', 0),
('CM003', 'Cyncere Massey', 'CyncereMassey', 'Libby Street98', '081332554098', '98000', 'CyncereMassey@gmail.com', 'OLTP1', 0),
('CP001', 'Cyncere Porter', 'CyncerePorter', 'Gambler Lane84', '081332554084', '84000', 'CyncerePorter@gmail.com', 'OLTP1', 0),
('CP002', 'Cyncere Phelps', 'CyncerePhelps', 'Hershell Hollow Road89', '081332554089', '89000', 'CyncerePhelps@gmail.com', 'OLTP1', 0),
('CR001', 'Cyncere Riggs', 'CyncereRiggs', 'Dane Street81', '081332554081', '81000', 'CyncereRiggs@gmail.com', 'OLTP1', 0),
('CR002', 'Cyncere Roberts', 'CyncereRoberts', 'Monroe Avenue85', '081332554085', '85000', 'CyncereRoberts@gmail.com', 'OLTP1', 0),
('CR003', 'Cyncere Rhodes', 'CyncereRhodes', 'Lawman Avenue94', '081332554094', '94000', 'CyncereRhodes@gmail.com', 'OLTP1', 0),
('CW001', 'Cyncere Willis', 'CyncereWillis', 'Bryan Avenue88', '081332554088', '88000', 'CyncereWillis@gmail.com', 'OLTP1', 0),
('DA001', 'Daniel Andrews', 'DanielAndrews', 'Jenna Lane28', '085745665428', '28000', 'DanielAndrews@gmail.com', 'OLTP3', 0),
('DA002', 'Daniel Adams', 'DanielAdams', 'Morningview Lane38', '085745665438', '38000', 'DanielAdams@gmail.com', 'OLTP3', 0),
('DB001', 'Devendra Bruce', 'DevendraBruce', 'Christie Way42', '081332554042', '42000', 'DevendraBruce@gmail.com', 'OLTP1', 0),
('DB002', 'Devendra Brooks', 'DevendraBrooks', 'Pinewood Drive55', '081332554055', '55000', 'DevendraBrooks@gmail.com', 'OLTP1', 0),
('DB003', 'Daniel Burns', 'DanielBurns', 'Elsie Drive33', '085745665433', '33000', 'DanielBurns@gmail.com', 'OLTP3', 0),
('DC001', 'Devendra Clay', 'DevendraClay', 'Hidden Valley Road52', '081332554052', '52000', 'DevendraClay@gmail.com', 'OLTP1', 0),
('DC002', 'Devendra Case', 'DevendraCase', 'Traders Alley60', '081332554060', '60000', 'DevendraCase@gmail.com', 'OLTP1', 0),
('DC003', 'Daniel Castillo', 'DanielCastillo', ' Abia Martin Drive32', '085745665432', '32000', 'DanielCastillo@gmail.com', 'OLTP3', 0),
('DD001', 'Devendra Dickerson', 'DevendraDickerson', 'Valley Lane47', '081332554047', '47000', 'DevendraDickerson@gmail.com', 'OLTP1', 0),
('DD002', 'Devendra Daugherty', 'DevendraDaugherty', 'University Hill Road50', '081332554050', '50000', 'DevendraDaugherty@gmail.com', 'OLTP1', 0),
('DD003', 'Devendra Deleon', 'DevendraDeleon', 'Simpson Avenue56', '081332554056', '56000', 'DevendraDeleon@gmail.com', 'OLTP1', 0),
('DD004', 'Daniel Dixon', 'DanielDixon', 'Richards Avenue37', '085745665437', '37000', 'DanielDixon@gmail.com', 'OLTP3', 0),
('DE001', 'Daniel Edwards', 'DanielEdwards', 'Crim Lane34', '085745665434', '34000', 'DanielEdwards@gmail.com', 'OLTP3', 0),
('DG001', 'Devendra Guerrero', 'DevendraGuerrero', 'Locust Court43', '081332554043', '43000', 'DevendraGuerrero@gmail.com', 'OLTP1', 0),
('DG002', 'Daniel Graham', 'DanielGraham', 'Holt Street22', '085745665422', '22000', 'DanielGraham@gmail.com', 'OLTP3', 0),
('DG003', 'Daniel Gardner', 'DanielGardner', 'Duff Avenue30', '085745665430', '30000', 'DanielGardner@gmail.com', 'OLTP3', 0),
('DG004', 'Daniel Grantt', 'DanielGrantt', 'Aviation Way35', '085745665435', '35000', 'DanielGrantt@gmail.com', 'OLTP3', 0),
('DH001', 'Devendra Holt', 'DevendraHolt', 'Keyser Ridge Road53', '081332554053', '53000', 'DevendraHolt@gmail.com', 'OLTP1', 0),
('DH002', 'Devendra Horne', 'DevendraHorne', 'Calico Drive57', '081332554057', '57000', 'DevendraHorne@gmail.com', 'OLTP1', 0),
('DH003', 'Devendra Haley', 'DevendraHaley', 'Renwick Drive59', '081332554059', '59000', 'DevendraHaley@gmail.com', 'OLTP1', 0),
('DH004', 'Daniel Henderson', 'DanielHenderson', 'Perine Street23', '085745665423', '23000', 'DanielHenderson@gmail.com', 'OLTP3', 0),
('DJ001', 'Daniel Jenkins', 'DanielJenkins', 'Charmaine Lane31', '085745665431', '31000', 'DanielJenkins@gmail.com', 'OLTP3', 0),
('DM001', 'Devendra Mooney', 'DevendraMooney', 'Pyramid Valley Road46', '081332554046', '46000', 'DevendraMooney@gmail.com', 'OLTP1', 0),
('DM002', 'Devendra Mcmillan', 'DevendraMcmillan', 'Emily Drive51', '081332554051', '51000', 'DevendraMcmillan@gmail.com', 'OLTP1', 0),
('DM003', 'Devendra Massey', 'DevendraMassey', 'Libby Street58', '081332554058', '58000', 'DevendraMassey@gmail.com', 'OLTP1', 0),
('DM004', 'Daniel Morgan', 'DanielMorgan', 'Broaddus Avenue25', '085745665425', '25000', 'DanielMorgan@gmail.com', 'OLTP3', 0),
('DM005', 'Daniel Mason', 'DanielMason', 'Callison Lane26', '085745665426', '26000', 'DanielMason@gmail.com', 'OLTP3', 0),
('DN001', 'Daniel Nelson', 'DanielNelson', 'Franklee Lane40', '085745665440', '40000', 'DanielNelson@gmail.com', 'OLTP3', 0),
('DP001', 'Devendra Porter', 'DevendraPorter', 'Gambler Lane44', '081332554044', '44000', 'DevendraPorter@gmail.com', 'OLTP1', 0),
('DP002', 'Devendra Phelps', 'DevendraPhelps', 'Hershell Hollow Road49', '081332554049', '49000', 'DevendraPhelps@gmail.com', 'OLTP1', 0),
('DR001', 'Devendra Riggs', 'DevendraRiggs', 'Dane Street41', '081332554041', '41000', 'DevendraRiggs@gmail.com', 'OLTP1', 0),
('DR002', 'Devendra Roberts', 'DevendraRoberts', 'Monroe Avenue45', '081332554045', '45000', 'DevendraRoberts@gmail.com', 'OLTP1', 0),
('DR003', 'Devendra Rhodes', 'DevendraRhodes', 'Lawman Avenue54', '081332554054', '54000', 'DevendraRhodes@gmail.com', 'OLTP1', 0),
('DR004', 'Daniel Russell', 'DanielRussell', 'Hill Haven Drive36', '085745665436', '36000', 'DanielRussell@gmail.com', 'OLTP3', 0),
('DR005', 'Daniel Rogers', 'DanielRogers', 'Hoffman Avenue39', '085745665439', '39000', 'DanielRogers@gmail.com', 'OLTP3', 0),
('DS001', 'Daniel Sullivan', 'DanielSullivan', 'Beechwood Avenue27', '085745665427', '27000', 'DanielSullivan@gmail.com', 'OLTP3', 0),
('DS002', 'Daniel Spencer', 'DanielSpencer', 'Harley Brook Lane29', '085745665429', '29000', 'DanielSpencer@gmail.com', 'OLTP3', 0),
('DW001', 'Devendra Willis', 'DevendraWillis', 'Bryan Avenue48', '081332554048', '48000', 'DevendraWillis@gmail.com', 'OLTP1', 0),
('DW002', 'Daniel Warren', 'DanielWarren', 'Candlelight Drive21', '085745665421', '21000', 'DanielWarren@gmail.com', 'OLTP3', 0),
('DW003', 'Daniel Walker', 'DanielWalker', 'Bird Spring Lane24', '085745665424', '24000', 'DanielWalker@gmail.com', 'OLTP3', 0),
('EA001', 'Eddie Ayers', 'EddieAyers', 'Court Locust43', '088124230043', '43000', 'EddieAyers@gmail.com', 'OLTP2', 0),
('EA002', 'Eddie Austin', 'EddieAustin', 'Drive Pinewood55', '088124230055', '55000', 'EddieAustin@gmail.com', 'OLTP2', 0),
('EA003', 'Eddie Alexander', 'EddieAlexander', 'Drive Renwick59', '088124230059', '59000', 'EddieAlexander@gmail.com', 'OLTP2', 0),
('EB001', 'Eddie Bauer', 'EddieBauer', 'Way Christie42', '088124230042', '42000', 'EddieBauer@gmail.com', 'OLTP2', 0),
('EB002', 'Eddie Bean', 'EddieBean', 'Drive Emily51', '088124230051', '51000', 'EddieBean@gmail.com', 'OLTP2', 0),
('EB003', 'Eddie Bass', 'EddieBass', 'Drive Calico57', '088124230057', '57000', 'EddieBass@gmail.com', 'OLTP2', 0),
('EC001', 'Eddie Cameron', 'EddieCameron', 'Avenue Bryan48', '088124230048', '48000', 'EddieCameron@gmail.com', 'OLTP2', 0),
('ED001', 'Eddie Davis', 'EddieDavis', 'Avenue Monroe45', '088124230045', '45000', 'EddieDavis@gmail.com', 'OLTP2', 0),
('EE001', 'Eddie Esparza', 'EddieEsparza', 'Ridge Keyser Road53', '088124230053', '53000', 'EddieEsparza@gmail.com', 'OLTP2', 0),
('EE002', 'Eddie Estrada', 'EddieEstrada', 'Street Libby58', '088124230058', '58000', 'EddieEstrada@gmail.com', 'OLTP2', 0),
('EF001', 'Eddie Frederick', 'EddieFrederick', 'Alley Traders60', '088124230060', '60000', 'EddieFrederick@gmail.com', 'OLTP2', 0),
('EG001', 'Eddie Garner', 'EddieGarner', 'Street Dane41', '088124230041', '41000', 'EddieGarner@gmail.com', 'OLTP2', 0),
('EH001', 'Eddie Holden', 'EddieHolden', 'Avenue Lawman54', '088124230054', '54000', 'EddieHolden@gmail.com', 'OLTP2', 0),
('EM001', 'Eddie Maddox', 'EddieMaddox', 'Lane Gambler44', '088124230044', '44000', 'EddieMaddox@gmail.com', 'OLTP2', 0),
('EM002', 'Eddie Merritt', 'EddieMerritt', 'Lane Valley47', '088124230047', '47000', 'EddieMerritt@gmail.com', 'OLTP2', 0),
('EM003', 'Eddie Madden', 'EddieMadden', 'Valley Hidden Road52', '088124230052', '52000', 'EddieMadden@gmail.com', 'OLTP2', 0),
('ES001', 'Eddie Schaefer', 'EddieSchaefer', 'Valley Pyramid Road46', '088124230046', '46000', 'EddieSchaefer@gmail.com', 'OLTP2', 0),
('ES002', 'Eddie Simpson', 'EddieSimpson', 'Hollow Hershell Road49', '088124230049', '49000', 'EddieSimpson@gmail.com', 'OLTP2', 0),
('ET001', 'Eddie Thompson', 'EddieThompson', 'Hill University Road50', '088124230050', '50000', 'EddieThompson@gmail.com', 'OLTP2', 0),
('EW001', 'Eddie Wyatt', 'EddieWyatt', 'Avenue Simpson56', '088124230056', '56000', 'EddieWyatt@gmail.com', 'OLTP2', 0),
('GA001', 'Gerald Andrews', 'GeraldAndrews', 'Jenna Lane88', '085745665488', '88000', 'GeraldAndrews@gmail.com', 'OLTP3', 0),
('GA002', 'Gerald Adams', 'GeraldAdams', 'Morningview Lane98', '085745665498', '98000', 'GeraldAdams@gmail.com', 'OLTP3', 0),
('GB001', 'Gerald Burns', 'GeraldBurns', 'Elsie Drive93', '085745665493', '93000', 'GeraldBurns@gmail.com', 'OLTP3', 0),
('GC001', 'Gerald Castillo', 'GeraldCastillo', ' Abia Martin Drive92', '085745665492', '92000', 'GeraldCastillo@gmail.com', 'OLTP3', 0),
('GD001', 'Gerald Dixon', 'GeraldDixon', 'Richards Avenue97', '085745665497', '97000', 'GeraldDixon@gmail.com', 'OLTP3', 0),
('GE001', 'Gerald Edwards', 'GeraldEdwards', 'Crim Lane94', '085745665494', '94000', 'GeraldEdwards@gmail.com', 'OLTP3', 0),
('GG001', 'Gerald Graham', 'GeraldGraham', 'Holt Street82', '085745665482', '82000', 'GeraldGraham@gmail.com', 'OLTP3', 0),
('GG002', 'Gerald Gardner', 'GeraldGardner', 'Duff Avenue90', '085745665490', '90000', 'GeraldGardner@gmail.com', 'OLTP3', 0),
('GG003', 'Gerald Grantt', 'GeraldGrantt', 'Aviation Way95', '085745665495', '95000', 'GeraldGrantt@gmail.com', 'OLTP3', 0),
('GH001', 'Gerald Henderson', 'GeraldHenderson', 'Perine Street83', '085745665483', '83000', 'GeraldHenderson@gmail.com', 'OLTP3', 0),
('GJ001', 'Gerald Jenkins', 'GeraldJenkins', 'Charmaine Lane91', '085745665491', '91000', 'GeraldJenkins@gmail.com', 'OLTP3', 0),
('GM001', 'Gerald Morgan', 'GeraldMorgan', 'Broaddus Avenue85', '085745665485', '85000', 'GeraldMorgan@gmail.com', 'OLTP3', 0),
('GM002', 'Gerald Mason', 'GeraldMason', 'Callison Lane86', '085745665486', '86000', 'GeraldMason@gmail.com', 'OLTP3', 0),
('GN001', 'Gerald Nelson', 'GeraldNelson', 'Franklee Lane100', '085745665100', '100000', 'GeraldNelson@gmail.com', 'OLTP3', 0),
('GR001', 'Gerald Russell', 'GeraldRussell', 'Hill Haven Drive96', '085745665496', '96000', 'GeraldRussell@gmail.com', 'OLTP3', 0),
('GR002', 'Gerald Rogers', 'GeraldRogers', 'Hoffman Avenue99', '085745665499', '99000', 'GeraldRogers@gmail.com', 'OLTP3', 0),
('GS001', 'Gerald Sullivan', 'GeraldSullivan', 'Beechwood Avenue87', '085745665487', '87000', 'GeraldSullivan@gmail.com', 'OLTP3', 0),
('GS002', 'Gerald Spencer', 'GeraldSpencer', 'Harley Brook Lane89', '085745665489', '89000', 'GeraldSpencer@gmail.com', 'OLTP3', 0),
('GW001', 'Gerald Warren', 'GeraldWarren', 'Candlelight Drive81', '085745665481', '81000', 'GeraldWarren@gmail.com', 'OLTP3', 0),
('GW002', 'Gerald Walker', 'GeraldWalker', 'Bird Spring Lane84', '085745665484', '84000', 'GeraldWalker@gmail.com', 'OLTP3', 0),
('JA001', 'James Andrews', 'JamesAndrews', 'Jenna Lane68', '085745665468', '68000', 'JamesAndrews@gmail.com', 'OLTP3', 0),
('JA002', 'James Adams', 'JamesAdams', 'Morningview Lane78', '085745665478', '78000', 'JamesAdams@gmail.com', 'OLTP3', 0),
('JA003', 'Jayda Ayers', 'JaydaAyers', 'Court Locust3', '088124230003', '3000', 'JaydaAyers@gmail.com', 'OLTP2', 0),
('JA004', 'Jayda Austin', 'JaydaAustin', 'Drive Pinewood15', '088124230015', '15000', 'JaydaAustin@gmail.com', 'OLTP2', 0),
('JA005', 'Jayda Alexander', 'JaydaAlexander', 'Drive Renwick19', '088124230019', '19000', 'JaydaAlexander@gmail.com', 'OLTP2', 0),
('JA006', 'Jovan Ayers', 'JovanAyers', 'Court Locust63', '088124230063', '63000', 'JovanAyers@gmail.com', 'OLTP2', 0),
('JA007', 'Jovan Austin', 'JovanAustin', 'Drive Pinewood75', '088124230075', '75000', 'JovanAustin@gmail.com', 'OLTP2', 0),
('JA008', 'Jovan Alexander', 'JovanAlexander', 'Drive Renwick79', '088124230079', '79000', 'JovanAlexander@gmail.com', 'OLTP2', 0),
('JB001', 'James Burns', 'JamesBurns', 'Elsie Drive73', '085745665473', '73000', 'JamesBurns@gmail.com', 'OLTP3', 0),
('JB002', 'Jayda Bauer', 'JaydaBauer', 'Way Christie2', '088124230002', '2000', 'JaydaBauer@gmail.com', 'OLTP2', 0),
('JB003', 'Jayda Bean', 'JaydaBean', 'Drive Emily11', '088124230011', '11000', 'JaydaBean@gmail.com', 'OLTP2', 0),
('JB004', 'Jayda Bass', 'JaydaBass', 'Drive Calico17', '088124230017', '17000', 'JaydaBass@gmail.com', 'OLTP2', 0),
('JB005', 'Jovan Bauer', 'JovanBauer', 'Way Christie62', '088124230062', '62000', 'JovanBauer@gmail.com', 'OLTP2', 0),
('JB006', 'Jovan Bean', 'JovanBean', 'Drive Emily71', '088124230071', '71000', 'JovanBean@gmail.com', 'OLTP2', 0),
('JB007', 'Jovan Bass', 'JovanBass', 'Drive Calico77', '088124230077', '77000', 'JovanBass@gmail.com', 'OLTP2', 0),
('JC001', 'James Castillo', 'JamesCastillo', ' Abia Martin Drive72', '085745665472', '72000', 'JamesCastillo@gmail.com', 'OLTP3', 0),
('JC002', 'Jayda Cameron', 'JaydaCameron', 'Avenue Bryan8', '088124230008', '8000', 'JaydaCameron@gmail.com', 'OLTP2', 0),
('JC003', 'Jovan Cameron', 'JovanCameron', 'Avenue Bryan68', '088124230068', '68000', 'JovanCameron@gmail.com', 'OLTP2', 0),
('JD001', 'James Dixon', 'JamesDixon', 'Richards Avenue77', '085745665477', '77000', 'JamesDixon@gmail.com', 'OLTP3', 0),
('JD002', 'Jayda Davis', 'JaydaDavis', 'Avenue Monroe5', '088124230005', '5000', 'JaydaDavis@gmail.com', 'OLTP2', 0),
('JD003', 'Jovan Davis', 'JovanDavis', 'Avenue Monroe65', '088124230065', '65000', 'JovanDavis@gmail.com', 'OLTP2', 0),
('JE001', 'James Edwards', 'JamesEdwards', 'Crim Lane74', '085745665474', '74000', 'JamesEdwards@gmail.com', 'OLTP3', 0),
('JE002', 'Jayda Esparza', 'JaydaEsparza', 'Ridge Keyser Road13', '088124230013', '13000', 'JaydaEsparza@gmail.com', 'OLTP2', 0),
('JE003', 'Jayda Estrada', 'JaydaEstrada', 'Street Libby18', '088124230018', '18000', 'JaydaEstrada@gmail.com', 'OLTP2', 0),
('JE004', 'Jovan Esparza', 'JovanEsparza', 'Ridge Keyser Road73', '088124230073', '73000', 'JovanEsparza@gmail.com', 'OLTP2', 0),
('JE005', 'Jovan Estrada', 'JovanEstrada', 'Street Libby78', '088124230078', '78000', 'JovanEstrada@gmail.com', 'OLTP2', 0),
('JF001', 'Jayda Frederick', 'JaydaFrederick', 'Alley Traders20', '088124230020', '20000', 'JaydaFrederick@gmail.com', 'OLTP2', 0),
('JF002', 'Jovan Frederick', 'JovanFrederick', 'Alley Traders80', '088124230080', '80000', 'JovanFrederick@gmail.com', 'OLTP2', 0),
('JG001', 'James Graham', 'JamesGraham', 'Holt Street62', '085745665462', '62000', 'JamesGraham@gmail.com', 'OLTP3', 0),
('JG002', 'James Gardner', 'JamesGardner', 'Duff Avenue70', '085745665470', '70000', 'JamesGardner@gmail.com', 'OLTP3', 0),
('JG003', 'James Grantt', 'JamesGrantt', 'Aviation Way75', '085745665475', '75000', 'JamesGrantt@gmail.com', 'OLTP3', 0),
('JG004', 'Jayda Garner', 'JaydaGarner', 'Street Dane1', '088124230001', '1000', 'JaydaGarner@gmail.com', 'OLTP2', 0),
('JG005', 'Jovan Garner', 'JovanGarner', 'Street Dane61', '088124230061', '61000', 'JovanGarner@gmail.com', 'OLTP2', 0),
('JH001', 'James Henderson', 'JamesHenderson', 'Perine Street63', '085745665463', '63000', 'JamesHenderson@gmail.com', 'OLTP3', 0),
('JH002', 'Jayda Holden', 'JaydaHolden', 'Avenue Lawman14', '088124230014', '14000', 'JaydaHolden@gmail.com', 'OLTP2', 0),
('JH003', 'Jovan Holden', 'JovanHolden', 'Avenue Lawman74', '088124230074', '74000', 'JovanHolden@gmail.com', 'OLTP2', 0),
('JJ001', 'James Jenkins', 'JamesJenkins', 'Charmaine Lane71', '085745665471', '71000', 'JamesJenkins@gmail.com', 'OLTP3', 0),
('JM001', 'James Morgan', 'JamesMorgan', 'Broaddus Avenue65', '085745665465', '65000', 'JamesMorgan@gmail.com', 'OLTP3', 0),
('JM002', 'James Mason', 'JamesMason', 'Callison Lane66', '085745665466', '66000', 'JamesMason@gmail.com', 'OLTP3', 0),
('JM003', 'Jayda Maddox', 'JaydaMaddox', 'Lane Gambler4', '088124230004', '4000', 'JaydaMaddox@gmail.com', 'OLTP2', 0),
('JM004', 'Jayda Merritt', 'JaydaMerritt', 'Lane Valley7', '088124230007', '7000', 'JaydaMerritt@gmail.com', 'OLTP2', 0),
('JM005', 'Jayda Madden', 'JaydaMadden', 'Valley Hidden Road12', '088124230012', '12000', 'JaydaMadden@gmail.com', 'OLTP2', 0),
('JM006', 'Jovan Maddox', 'JovanMaddox', 'Lane Gambler64', '088124230064', '64000', 'JovanMaddox@gmail.com', 'OLTP2', 0),
('JM007', 'Jovan Merritt', 'JovanMerritt', 'Lane Valley67', '088124230067', '67000', 'JovanMerritt@gmail.com', 'OLTP2', 0),
('JM008', 'Jovan Madden', 'JovanMadden', 'Valley Hidden Road72', '088124230072', '72000', 'JovanMadden@gmail.com', 'OLTP2', 0),
('JN001', 'James Nelson', 'JamesNelson', 'Franklee Lane80', '085745665480', '80000', 'JamesNelson@gmail.com', 'OLTP3', 0),
('JR001', 'James Russell', 'JamesRussell', 'Hill Haven Drive76', '085745665476', '76000', 'JamesRussell@gmail.com', 'OLTP3', 0),
('JR002', 'James Rogers', 'JamesRogers', 'Hoffman Avenue79', '085745665479', '79000', 'JamesRogers@gmail.com', 'OLTP3', 0),
('JS001', 'James Sullivan', 'JamesSullivan', 'Beechwood Avenue67', '085745665467', '67000', 'JamesSullivan@gmail.com', 'OLTP3', 0),
('JS002', 'James Spencer', 'JamesSpencer', 'Harley Brook Lane69', '085745665469', '69000', 'JamesSpencer@gmail.com', 'OLTP3', 0),
('JS003', 'Jayda Schaefer', 'JaydaSchaefer', 'Valley Pyramid Road6', '088124230006', '6000', 'JaydaSchaefer@gmail.com', 'OLTP2', 0),
('JS004', 'Jayda Simpson', 'JaydaSimpson', 'Hollow Hershell Road9', '088124230009', '9000', 'JaydaSimpson@gmail.com', 'OLTP2', 0),
('JS005', 'Jovan Schaefer', 'JovanSchaefer', 'Valley Pyramid Road66', '088124230066', '66000', 'JovanSchaefer@gmail.com', 'OLTP2', 0),
('JS006', 'Jovan Simpson', 'JovanSimpson', 'Hollow Hershell Road69', '088124230069', '69000', 'JovanSimpson@gmail.com', 'OLTP2', 0),
('JT001', 'Jayda Thompson', 'JaydaThompson', 'Hill University Road10', '088124230010', '10000', 'JaydaThompson@gmail.com', 'OLTP2', 0),
('JT002', 'Jovan Thompson', 'JovanThompson', 'Hill University Road70', '088124230070', '70000', 'JovanThompson@gmail.com', 'OLTP2', 0),
('JW001', 'James Warren', 'JamesWarren', 'Candlelight Drive61', '085745665461', '61000', 'JamesWarren@gmail.com', 'OLTP3', 0),
('JW002', 'James Walker', 'JamesWalker', 'Bird Spring Lane64', '085745665464', '64000', 'JamesWalker@gmail.com', 'OLTP3', 0),
('JW003', 'Jayda Wyatt', 'JaydaWyatt', 'Avenue Simpson16', '088124230016', '16000', 'JaydaWyatt@gmail.com', 'OLTP2', 0),
('JW004', 'Jovan Wyatt', 'JovanWyatt', 'Avenue Simpson76', '088124230076', '76000', 'JovanWyatt@gmail.com', 'OLTP2', 0),
('KA001', 'Kevin Andrews', 'KevinAndrews', 'Jenna Lane8', '085745665408', '8000', 'KevinAndrews@gmail.com', 'OLTP3', 0),
('KA002', 'Kevin Adams', 'KevinAdams', 'Morningview Lane18', '085745665418', '18000', 'KevinAdams@gmail.com', 'OLTP3', 0),
('KA003', 'Kopid Andrews', 'KopidAndrews', 'Jenna Lane48', '085745665448', '48000', 'KopidAndrews@gmail.com', 'OLTP3', 0),
('KA004', 'Kopid Adams', 'KopidAdams', 'Morningview Lane58', '085745665458', '58000', 'KopidAdams@gmail.com', 'OLTP3', 0),
('KB001', 'Kevin Burns', 'KevinBurns', 'Elsie Drive13', '085745665413', '13000', 'KevinBurns@gmail.com', 'OLTP3', 0),
('KB002', 'Kopid Burns', 'KopidBurns', 'Elsie Drive53', '085745665453', '53000', 'KopidBurns@gmail.com', 'OLTP3', 0),
('KC001', 'Kevin Castillo', 'KevinCastillo', ' Abia Martin Drive12', '085745665412', '12000', 'KevinCastillo@gmail.com', 'OLTP3', 0),
('KC002', 'Kopid Castillo', 'KopidCastillo', ' Abia Martin Drive52', '085745665452', '52000', 'KopidCastillo@gmail.com', 'OLTP3', 0),
('KD001', 'Kevin Dixon', 'KevinDixon', 'Richards Avenue17', '085745665417', '17000', 'KevinDixon@gmail.com', 'OLTP3', 0),
('KD002', 'Kopid Dixon', 'KopidDixon', 'Richards Avenue57', '085745665457', '57000', 'KopidDixon@gmail.com', 'OLTP3', 0),
('KE001', 'Kevin Edwards', 'KevinEdwards', 'Crim Lane14', '085745665414', '14000', 'KevinEdwards@gmail.com', 'OLTP3', 0),
('KE002', 'Kopid Edwards', 'KopidEdwards', 'Crim Lane54', '085745665454', '54000', 'KopidEdwards@gmail.com', 'OLTP3', 0),
('KG001', 'Kevin Graham', 'KevinGraham', 'Holt Street2', '085745665402', '2000', 'KevinGraham@gmail.com', 'OLTP3', 0),
('KG002', 'Kevin Gardner', 'KevinGardner', 'Duff Avenue10', '085745665410', '10000', 'KevinGardner@gmail.com', 'OLTP3', 0),
('KG003', 'Kevin Grantt', 'KevinGrantt', 'Aviation Way15', '085745665415', '15000', 'KevinGrantt@gmail.com', 'OLTP3', 0),
('KG004', 'Kopid Graham', 'KopidGraham', 'Holt Street42', '085745665442', '42000', 'KopidGraham@gmail.com', 'OLTP3', 0),
('KG005', 'Kopid Gardner', 'KopidGardner', 'Duff Avenue50', '085745665450', '50000', 'KopidGardner@gmail.com', 'OLTP3', 0),
('KG006', 'Kopid Grantt', 'KopidGrantt', 'Aviation Way55', '085745665455', '55000', 'KopidGrantt@gmail.com', 'OLTP3', 0),
('KH001', 'Kevin Henderson', 'KevinHenderson', 'Perine Street3', '085745665403', '3000', 'KevinHenderson@gmail.com', 'OLTP3', 0),
('KH002', 'Kopid Henderson', 'KopidHenderson', 'Perine Street43', '085745665443', '43000', 'KopidHenderson@gmail.com', 'OLTP3', 0),
('KJ001', 'Kevin Jenkins', 'KevinJenkins', 'Charmaine Lane11', '085745665411', '11000', 'KevinJenkins@gmail.com', 'OLTP3', 0),
('KJ002', 'Kopid Jenkins', 'KopidJenkins', 'Charmaine Lane51', '085745665451', '51000', 'KopidJenkins@gmail.com', 'OLTP3', 0),
('KM001', 'Kevin Morgan', 'KevinMorgan', 'Broaddus Avenue5', '085745665405', '5000', 'KevinMorgan@gmail.com', 'OLTP3', 0),
('KM002', 'Kevin Mason', 'KevinMason', 'Callison Lane6', '085745665406', '6000', 'KevinMason@gmail.com', 'OLTP3', 0),
('KM003', 'Kopid Morgan', 'KopidMorgan', 'Broaddus Avenue45', '085745665445', '45000', 'KopidMorgan@gmail.com', 'OLTP3', 0),
('KM004', 'Kopid Mason', 'KopidMason', 'Callison Lane46', '085745665446', '46000', 'KopidMason@gmail.com', 'OLTP3', 0),
('KN001', 'Kevin Nelson', 'KevinNelson', 'Franklee Lane20', '085745665420', '20000', 'KevinNelson@gmail.com', 'OLTP3', 0),
('KN002', 'Kopid Nelson', 'KopidNelson', 'Franklee Lane60', '085745665460', '60000', 'KopidNelson@gmail.com', 'OLTP3', 0),
('KR001', 'Kevin Russell', 'KevinRussell', 'Hill Haven Drive16', '085745665416', '16000', 'KevinRussell@gmail.com', 'OLTP3', 0),
('KR002', 'Kevin Rogers', 'KevinRogers', 'Hoffman Avenue19', '085745665419', '19000', 'KevinRogers@gmail.com', 'OLTP3', 0),
('KR003', 'Kopid Russell', 'KopidRussell', 'Hill Haven Drive56', '085745665456', '56000', 'KopidRussell@gmail.com', 'OLTP3', 0),
('KR004', 'Kopid Rogers', 'KopidRogers', 'Hoffman Avenue59', '085745665459', '59000', 'KopidRogers@gmail.com', 'OLTP3', 0),
('KS001', 'Kevin Sullivan', 'KevinSullivan', 'Beechwood Avenue7', '085745665407', '7000', 'KevinSullivan@gmail.com', 'OLTP3', 0),
('KS002', 'Kevin Spencer', 'KevinSpencer', 'Harley Brook Lane9', '085745665409', '9000', 'KevinSpencer@gmail.com', 'OLTP3', 0),
('KS003', 'Kopid Sullivan', 'KopidSullivan', 'Beechwood Avenue47', '085745665447', '47000', 'KopidSullivan@gmail.com', 'OLTP3', 0),
('KS004', 'Kopid Spencer', 'KopidSpencer', 'Harley Brook Lane49', '085745665449', '49000', 'KopidSpencer@gmail.com', 'OLTP3', 0),
('KW001', 'Kevin Warren', 'KevinWarren', 'Candlelight Drive1', '085745665401', '1000', 'KevinWarren@gmail.com', 'OLTP3', 0),
('KW002', 'Kevin Walker', 'KevinWalker', 'Bird Spring Lane4', '085745665404', '4000', 'KevinWalker@gmail.com', 'OLTP3', 0),
('KW003', 'Kopid Warren', 'KopidWarren', 'Candlelight Drive41', '085745665441', '41000', 'KopidWarren@gmail.com', 'OLTP3', 0),
('KW004', 'Kopid Walker', 'KopidWalker', 'Bird Spring Lane44', '085745665444', '44000', 'KopidWalker@gmail.com', 'OLTP3', 0),
('QA001', 'Quincy Ayers', 'QuincyAyers', 'Court Locust83', '088124230083', '83000', 'QuincyAyers@gmail.com', 'OLTP2', 0),
('QA002', 'Quincy Austin', 'QuincyAustin', 'Drive Pinewood95', '088124230095', '95000', 'QuincyAustin@gmail.com', 'OLTP2', 0),
('QA003', 'Quincy Alexander', 'QuincyAlexander', 'Drive Renwick99', '088124230099', '99000', 'QuincyAlexander@gmail.com', 'OLTP2', 0),
('QB001', 'Quincy Bauer', 'QuincyBauer', 'Way Christie82', '088124230082', '82000', 'QuincyBauer@gmail.com', 'OLTP2', 0),
('QB002', 'Quincy Bean', 'QuincyBean', 'Drive Emily91', '088124230091', '91000', 'QuincyBean@gmail.com', 'OLTP2', 0),
('QB003', 'Quincy Bass', 'QuincyBass', 'Drive Calico97', '088124230097', '97000', 'QuincyBass@gmail.com', 'OLTP2', 0),
('QC001', 'Quincy Cameron', 'QuincyCameron', 'Avenue Bryan88', '088124230088', '88000', 'QuincyCameron@gmail.com', 'OLTP2', 0),
('QD001', 'Quincy Davis', 'QuincyDavis', 'Avenue Monroe85', '088124230085', '85000', 'QuincyDavis@gmail.com', 'OLTP2', 0),
('QE001', 'Quincy Esparza', 'QuincyEsparza', 'Ridge Keyser Road93', '088124230093', '93000', 'QuincyEsparza@gmail.com', 'OLTP2', 0),
('QE002', 'Quincy Estrada', 'QuincyEstrada', 'Street Libby98', '088124230098', '98000', 'QuincyEstrada@gmail.com', 'OLTP2', 0),
('QF001', 'Quincy Frederick', 'QuincyFrederick', 'Alley Traders100', '0881242310100', '100000', 'QuincyFrederick@gmail.com', 'OLTP2', 0),
('QG001', 'Quincy Garner', 'QuincyGarner', 'Street Dane81', '088124230081', '81000', 'QuincyGarner@gmail.com', 'OLTP2', 0),
('QH001', 'Quincy Holden', 'QuincyHolden', 'Avenue Lawman94', '088124230094', '94000', 'QuincyHolden@gmail.com', 'OLTP2', 0),
('QM001', 'Quincy Maddox', 'QuincyMaddox', 'Lane Gambler84', '088124230084', '84000', 'QuincyMaddox@gmail.com', 'OLTP2', 0),
('QM002', 'Quincy Merritt', 'QuincyMerritt', 'Lane Valley87', '088124230087', '87000', 'QuincyMerritt@gmail.com', 'OLTP2', 0),
('QM003', 'Quincy Madden', 'QuincyMadden', 'Valley Hidden Road92', '088124230092', '92000', 'QuincyMadden@gmail.com', 'OLTP2', 0),
('QS001', 'Quincy Schaefer', 'QuincySchaefer', 'Valley Pyramid Road86', '088124230086', '86000', 'QuincySchaefer@gmail.com', 'OLTP2', 0),
('QS002', 'Quincy Simpson', 'QuincySimpson', 'Hollow Hershell Road89', '088124230089', '89000', 'QuincySimpson@gmail.com', 'OLTP2', 0),
('QT001', 'Quincy Thompson', 'QuincyThompson', 'Hill University Road90', '088124230090', '90000', 'QuincyThompson@gmail.com', 'OLTP2', 0),
('QW001', 'Quincy Wyatt', 'QuincyWyatt', 'Avenue Simpson96', '088124230096', '96000', 'QuincyWyatt@gmail.com', 'OLTP2', 0),
('YA001', 'Yosef Ayers', 'YosefAyers', 'Court Locust23', '088124230023', '23000', 'YosefAyers@gmail.com', 'OLTP2', 0),
('YA002', 'Yosef Austin', 'YosefAustin', 'Drive Pinewood35', '088124230035', '35000', 'YosefAustin@gmail.com', 'OLTP2', 0),
('YA003', 'Yosef Alexander', 'YosefAlexander', 'Drive Renwick39', '088124230039', '39000', 'YosefAlexander@gmail.com', 'OLTP2', 0),
('YB001', 'Yosef Bauer', 'YosefBauer', 'Way Christie22', '088124230022', '22000', 'YosefBauer@gmail.com', 'OLTP2', 0),
('YB002', 'Yosef Bean', 'YosefBean', 'Drive Emily31', '088124230031', '31000', 'YosefBean@gmail.com', 'OLTP2', 0),
('YB003', 'Yosef Bass', 'YosefBass', 'Drive Calico37', '088124230037', '37000', 'YosefBass@gmail.com', 'OLTP2', 0),
('YC001', 'Yosef Cameron', 'YosefCameron', 'Avenue Bryan28', '088124230028', '28000', 'YosefCameron@gmail.com', 'OLTP2', 0),
('YD001', 'Yosef Davis', 'YosefDavis', 'Avenue Monroe25', '088124230025', '25000', 'YosefDavis@gmail.com', 'OLTP2', 0),
('YE001', 'Yosef Esparza', 'YosefEsparza', 'Ridge Keyser Road33', '088124230033', '33000', 'YosefEsparza@gmail.com', 'OLTP2', 0),
('YE002', 'Yosef Estrada', 'YosefEstrada', 'Street Libby38', '088124230038', '38000', 'YosefEstrada@gmail.com', 'OLTP2', 0),
('YF001', 'Yosef Frederick', 'YosefFrederick', 'Alley Traders40', '088124230040', '40000', 'YosefFrederick@gmail.com', 'OLTP2', 0),
('YG001', 'Yosef Garner', 'YosefGarner', 'Street Dane21', '088124230021', '21000', 'YosefGarner@gmail.com', 'OLTP2', 0),
('YH001', 'Yosef Holden', 'YosefHolden', 'Avenue Lawman34', '088124230034', '34000', 'YosefHolden@gmail.com', 'OLTP2', 0),
('YM001', 'Yosef Maddox', 'YosefMaddox', 'Lane Gambler24', '088124230024', '24000', 'YosefMaddox@gmail.com', 'OLTP2', 0),
('YM002', 'Yosef Merritt', 'YosefMerritt', 'Lane Valley27', '088124230027', '27000', 'YosefMerritt@gmail.com', 'OLTP2', 0),
('YM003', 'Yosef Madden', 'YosefMadden', 'Valley Hidden Road32', '088124230032', '32000', 'YosefMadden@gmail.com', 'OLTP2', 0),
('YS001', 'Yosef Schaefer', 'YosefSchaefer', 'Valley Pyramid Road26', '088124230026', '26000', 'YosefSchaefer@gmail.com', 'OLTP2', 0),
('YS002', 'Yosef Simpson', 'YosefSimpson', 'Hollow Hershell Road29', '088124230029', '29000', 'YosefSimpson@gmail.com', 'OLTP2', 0),
('YT001', 'Yosef Thompson', 'YosefThompson', 'Hill University Road30', '088124230030', '30000', 'YosefThompson@gmail.com', 'OLTP2', 0),
('YW001', 'Yosef Wyatt', 'YosefWyatt', 'Avenue Simpson36', '088124230036', '36000', 'YosefWyatt@gmail.com', 'OLTP2', 0);

--
-- Triggers `penyewa`
--
DELIMITER $$
CREATE TRIGGER `new_idpenyewa` BEFORE INSERT ON `penyewa` FOR EACH ROW BEGIN
    
    SET @IDD = (
        SELECT substring(new.nama_penyewa,1,1) as `NamaD`
    );
    
    SET @IDB = (
        SELECT substring(substring_index(new.nama_penyewa,' ', -1),1,1) as `NamaB`
    );
    SET @ID = concat(@IDD, @IDB);
    
    SET @num = (
       SELECT concat(LPAD(IFNULL(substring(max(id_penyewa),3,3),0) + 1, 3, '0')) as ID_BARU
    	FROM penyewa
   	 	WHERE substring(id_penyewa,1,2) = @ID 
    );
    
    SET new.id_penyewa = concat(@ID, @num);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `new_penyewa` BEFORE INSERT ON `penyewa` FOR EACH ROW BEGIN
	Declare firstname varchar(200);
    Declare lastname varchar(200);
    
    set firstname = substring_index(new.nama_penyewa,' ',1);
    set lastname = substring_index(new.nama_penyewa,' ',-1);
    set firstname = concat(upper(substring(firstname,1,1)), lower(substring(firstname,2,length(firstname))));
    set lastname = concat(upper(substring(lastname,1,1)),lower(substring(lastname,2,length(lastname))));


set new.nama_penyewa = concat(firstname,' ',lastname);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `p_cabang`
-- (See below for the actual view)
--
CREATE TABLE `p_cabang` (
`Lokasi Gerai` varchar(50)
,`Total Pemasukan` varchar(76)
,`Total Sewa yang Terjadi` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `p_cabangpenyewa`
-- (See below for the actual view)
--
CREATE TABLE `p_cabangpenyewa` (
`ID Sewa` varchar(20)
,`Lokasi Gerai` varchar(50)
,`Nama Penyewa` varchar(50)
,`Total Pengeluaran` varchar(76)
,`Total Transaksi` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `p_lokasisepeda`
-- (See below for the actual view)
--
CREATE TABLE `p_lokasisepeda` (
`Brand Sepeda` varchar(100)
,`Lokasi Sepeda` varchar(50)
,`Nomor Gerai` varchar(20)
,`Quantity` int
,`Warna Sepeda` varchar(25)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `p_penyewa`
-- (See below for the actual view)
--
CREATE TABLE `p_penyewa` (
`ID Penyewa` varchar(20)
,`Nama Penyewa` varchar(50)
,`Saldo Penyewa` varchar(42)
,`Total Pengeluaran` varchar(76)
,`Total Sewa yang Terjadi` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `p_penyewasepeda`
-- (See below for the actual view)
--
CREATE TABLE `p_penyewasepeda` (
`Lokasi Sewa` varchar(50)
,`Merek Sepeda` varchar(100)
,`Nama Penyewa` varchar(50)
,`Warna Sepeda` varchar(25)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `p_sepeda`
-- (See below for the actual view)
--
CREATE TABLE `p_sepeda` (
`Brand Sepeda` varchar(100)
,`Jumlah Sepeda Telah Disewa` bigint
,`QR Sepeda` varchar(20)
,`Warna Sepeda` varchar(25)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `p_transaksisewa`
-- (See below for the actual view)
--
CREATE TABLE `p_transaksisewa` (
`Brand Sepeda` varchar(100)
,`ID Penyewa` varchar(20)
,`ID Sepeda` varchar(20)
,`ID Transaksi Sewa` varchar(20)
,`Jam Akhir Sewa` time
,`Jam Awal Sewa` time
,`Lokasi Gerai` varchar(50)
,`Nama Penyewa` varchar(50)
,`Tanggal Akhir Sewa` date
,`Tanggal Awal Sewa` date
,`Total Pengeluaran` varchar(46)
);

-- --------------------------------------------------------

--
-- Table structure for table `sepeda`
--

CREATE TABLE `sepeda` (
  `id_sepeda` varchar(20) NOT NULL,
  `brand_sepeda` varchar(100) NOT NULL,
  `warna_sepeda` varchar(25) NOT NULL,
  `nomor_gerai` varchar(20) NOT NULL,
  `status_sepeda` varchar(100) NOT NULL DEFAULT 'Available',
  `quantity` int NOT NULL DEFAULT '0',
  `cabang_id` varchar(5) NOT NULL,
  `sepeda_delete` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sepeda`
--

INSERT INTO `sepeda` (`id_sepeda`, `brand_sepeda`, `warna_sepeda`, `nomor_gerai`, `status_sepeda`, `quantity`, `cabang_id`, `sepeda_delete`) VALUES
('SC001', 'Pacific', 'Biru', 'G0003', 'Available', 9, 'OLTP1', 0),
('SC002', 'Pacific', 'Kuning', 'G0004', 'Available', 8, 'OLTP1', 0),
('SC003', 'Pacific', 'Merah Maroon', 'G0005', 'Available', 7, 'OLTP1', 0),
('SD001', 'United', 'Kuning', 'F0001', 'Available', 13, 'OLTP3', 0),
('SD002', 'United', 'Merah', 'F0002', 'Available', 9, 'OLTP3', 0),
('SG001', 'GT Bike', 'Kuning', 'E0004', 'Available', 7, 'OLTP2', 0),
('SG002', 'GT Bike', 'Hitam', 'E0005', 'Available', 10, 'OLTP2', 0),
('SG003', 'GT Bike', 'Biru', 'E0001', 'Available', 5, 'OLTP2', 0),
('SK001', 'Kona', 'Hijau', 'E0002', 'Available', 4, 'OLTP2', 0),
('SK002', 'Kona', 'Hitam', 'E0003', 'Available', 7, 'OLTP2', 0),
('SK003', 'Kona', 'Merah', 'E0004', 'Available', 9, 'OLTP2', 0),
('SL001', 'Polygon', 'Hitam', 'F0003', 'Available', 10, 'OLTP3', 0),
('SL002', 'Polygon', 'Hijau', 'F0004', 'Available', 10, 'OLTP3', 0),
('SL003', 'Polygon', 'Cokelat', 'F0004', 'Available', 15, 'OLTP3', 0),
('SL004', 'Polygon ', 'Putih', 'F0005', 'Available', 13, 'OLTP3', 0),
('SM001', 'Wimcycle', 'Putih', 'F0005', 'Available', 7, 'OLTP3', 0),
('SM002', 'Wimcycle', 'Cokelat', 'F0001', 'Available', 8, 'OLTP3', 0),
('SM003', 'Wimcycle', 'Hitam', 'F0002', 'Available', 11, 'OLTP3', 0),
('SM004', 'Wimcycle', 'Biru', 'F0003', 'Available', 12, 'OLTP3', 0),
('SO001', 'Polygon', 'Hitam', 'E0005', 'Available', 15, 'OLTP2', 0),
('SP001', 'Polygon', 'Merah', 'G0001', 'Available', 7, 'OLTP1', 0),
('SP002', 'Polygon', 'Hijau', 'G0002', 'Available', 9, 'OLTP1', 0),
('SP003', 'Polygon', 'Hitam', 'G0003', 'Available', 6, 'OLTP1', 0),
('SP004', 'Polygon', 'Silver', 'G0004', 'Available', 9, 'OLTP1', 0),
('SU001', 'United', 'Merah', 'E0001', 'Available', 8, 'OLTP2', 0),
('SU002', 'United', 'Putih', 'E0002', 'Available', 9, 'OLTP2', 0),
('SU003', 'United', 'Biru', 'E0003', 'Available', 10, 'OLTP2', 0),
('SW001', 'Wimcycle', 'Jingga', 'G0005', 'Available', 11, 'OLTP1', 0),
('SW002', 'Wimcycle', 'Putih', 'G0001', 'Available', 8, 'OLTP1', 0),
('SW003', 'Wimcycle', 'Abu-abu', 'G0002', 'Available', 6, 'OLTP1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_sewa`
--

CREATE TABLE `transaksi_sewa` (
  `id_sewa` varchar(20) NOT NULL,
  `id_sepeda` varchar(20) NOT NULL,
  `id_penyewa` varchar(20) NOT NULL,
  `harga_sewa` int NOT NULL,
  `tglawal_sewa` date NOT NULL,
  `jamawal_sewa` time NOT NULL,
  `tglakhir_sewa` date NOT NULL,
  `jamakhir_sewa` time NOT NULL,
  `cabang_id` varchar(5) NOT NULL,
  `sewa_delete` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi_sewa`
--

INSERT INTO `transaksi_sewa` (`id_sewa`, `id_sepeda`, `id_penyewa`, `harga_sewa`, `tglawal_sewa`, `jamawal_sewa`, `tglakhir_sewa`, `jamakhir_sewa`, `cabang_id`, `sewa_delete`) VALUES
('SEB1', 'SC001', 'AB001', 1000, '2021-07-01', '01:00:00', '2021-07-01', '02:00:00', 'OLTP1', 0),
('SEB10', 'SC002', 'AC004', 1000, '2021-07-01', '10:00:00', '2021-07-01', '11:00:00', 'OLTP1', 0),
('SEB100', 'SC003', 'DW001', 6000, '2021-07-06', '10:00:00', '2021-07-06', '16:00:00', 'OLTP1', 0),
('SEB11', 'SC002', 'AC005', 1000, '2021-07-01', '11:00:00', '2021-07-01', '12:00:00', 'OLTP1', 0),
('SEB12', 'SC002', 'AC006', 1000, '2021-07-01', '12:00:00', '2021-07-01', '13:00:00', 'OLTP1', 0),
('SEB13', 'SC002', 'AD001', 1000, '2021-07-01', '13:00:00', '2021-07-01', '14:00:00', 'OLTP1', 0),
('SEB14', 'SC002', 'AD002', 1000, '2021-07-01', '14:00:00', '2021-07-01', '15:00:00', 'OLTP1', 0),
('SEB15', 'SC002', 'AD003', 1000, '2021-07-01', '15:00:00', '2021-07-01', '16:00:00', 'OLTP1', 0),
('SEB16', 'SC002', 'AD004', 1000, '2021-07-01', '16:00:00', '2021-07-01', '17:00:00', 'OLTP1', 0),
('SEB17', 'SC002', 'AD005', 1000, '2021-07-01', '17:00:00', '2021-07-01', '18:00:00', 'OLTP1', 0),
('SEB18', 'SC003', 'AD006', 1000, '2021-07-01', '18:00:00', '2021-07-01', '19:00:00', 'OLTP1', 0),
('SEB19', 'SC003', 'AD007', 2000, '2021-07-02', '01:00:00', '2021-07-02', '03:00:00', 'OLTP1', 0),
('SEB2', 'SC001', 'AB002', 1000, '2021-07-01', '02:00:00', '2021-07-01', '03:00:00', 'OLTP1', 0),
('SEB20', 'SC003', 'AD008', 2000, '2021-07-02', '02:00:00', '2021-07-02', '04:00:00', 'OLTP1', 0),
('SEB21', 'SC003', 'AD009', 2000, '2021-07-02', '03:00:00', '2021-07-02', '05:00:00', 'OLTP1', 0),
('SEB22', 'SC003', 'AG001', 2000, '2021-07-02', '04:00:00', '2021-07-02', '06:00:00', 'OLTP1', 0),
('SEB23', 'SC003', 'AG002', 2000, '2021-07-02', '05:00:00', '2021-07-02', '07:00:00', 'OLTP1', 0),
('SEB24', 'SC003', 'AG003', 2000, '2021-07-02', '06:00:00', '2021-07-02', '08:00:00', 'OLTP1', 0),
('SEB25', 'SP001', 'AH001', 2000, '2021-07-02', '07:00:00', '2021-07-02', '09:00:00', 'OLTP1', 0),
('SEB26', 'SP001', 'AH002', 2000, '2021-07-02', '08:00:00', '2021-07-02', '10:00:00', 'OLTP1', 0),
('SEB27', 'SP001', 'AH003', 2000, '2021-07-02', '09:00:00', '2021-07-02', '11:00:00', 'OLTP1', 0),
('SEB28', 'SP001', 'AH004', 2000, '2021-07-02', '10:00:00', '2021-07-02', '12:00:00', 'OLTP1', 0),
('SEB29', 'SP001', 'AH005', 2000, '2021-07-02', '11:00:00', '2021-07-02', '13:00:00', 'OLTP1', 0),
('SEB3', 'SC001', 'AB003', 1000, '2021-07-01', '03:00:00', '2021-07-01', '04:00:00', 'OLTP1', 0),
('SEB30', 'SP001', 'AH006', 2000, '2021-07-02', '12:00:00', '2021-07-02', '14:00:00', 'OLTP1', 0),
('SEB31', 'SP001', 'AH007', 2000, '2021-07-02', '13:00:00', '2021-07-02', '15:00:00', 'OLTP1', 0),
('SEB32', 'SP002', 'AH008', 2000, '2021-07-02', '14:00:00', '2021-07-02', '16:00:00', 'OLTP1', 0),
('SEB33', 'SP002', 'AH009', 2000, '2021-07-02', '15:00:00', '2021-07-02', '17:00:00', 'OLTP1', 0),
('SEB34', 'SP002', 'AM001', 2000, '2021-07-02', '16:00:00', '2021-07-02', '18:00:00', 'OLTP1', 0),
('SEB35', 'SP002', 'AM002', 2000, '2021-07-02', '17:00:00', '2021-07-02', '19:00:00', 'OLTP1', 0),
('SEB36', 'SP002', 'AM003', 2000, '2021-07-02', '18:00:00', '2021-07-02', '20:00:00', 'OLTP1', 0),
('SEB37', 'SP002', 'AM004', 3000, '2021-07-03', '01:00:00', '2021-07-03', '04:00:00', 'OLTP1', 0),
('SEB38', 'SP002', 'AM005', 3000, '2021-07-03', '02:00:00', '2021-07-03', '05:00:00', 'OLTP1', 0),
('SEB39', 'SP002', 'AM006', 3000, '2021-07-03', '03:00:00', '2021-07-03', '06:00:00', 'OLTP1', 0),
('SEB4', 'SC001', 'AB004', 1000, '2021-07-01', '04:00:00', '2021-07-01', '05:00:00', 'OLTP1', 0),
('SEB40', 'SP002', 'AM007', 3000, '2021-07-03', '04:00:00', '2021-07-03', '07:00:00', 'OLTP1', 0),
('SEB41', 'SP003', 'AM008', 3000, '2021-07-03', '05:00:00', '2021-07-03', '08:00:00', 'OLTP1', 0),
('SEB42', 'SP003', 'AM009', 3000, '2021-07-03', '06:00:00', '2021-07-03', '09:00:00', 'OLTP1', 0),
('SEB43', 'SP003', 'AP001', 3000, '2021-07-03', '07:00:00', '2021-07-03', '10:00:00', 'OLTP1', 0),
('SEB44', 'SP003', 'AP002', 3000, '2021-07-03', '08:00:00', '2021-07-03', '11:00:00', 'OLTP1', 0),
('SEB45', 'SP003', 'AP003', 3000, '2021-07-03', '09:00:00', '2021-07-03', '12:00:00', 'OLTP1', 0),
('SEB46', 'SP003', 'AP004', 3000, '2021-07-03', '10:00:00', '2021-07-03', '13:00:00', 'OLTP1', 0),
('SEB47', 'SP004', 'AP005', 3000, '2021-07-03', '11:00:00', '2021-07-03', '14:00:00', 'OLTP1', 0),
('SEB48', 'SP004', 'AP006', 3000, '2021-07-03', '12:00:00', '2021-07-03', '15:00:00', 'OLTP1', 0),
('SEB49', 'SP004', 'AR001', 3000, '2021-07-03', '13:00:00', '2021-07-03', '16:00:00', 'OLTP1', 0),
('SEB5', 'SC001', 'AB005', 1000, '2021-07-01', '05:00:00', '2021-07-01', '06:00:00', 'OLTP1', 0),
('SEB50', 'SP004', 'AR002', 3000, '2021-07-03', '14:00:00', '2021-07-03', '17:00:00', 'OLTP1', 0),
('SEB51', 'SP004', 'AR003', 3000, '2021-07-03', '15:00:00', '2021-07-03', '18:00:00', 'OLTP1', 0),
('SEB52', 'SP004', 'AR004', 3000, '2021-07-03', '16:00:00', '2021-07-03', '19:00:00', 'OLTP1', 0),
('SEB53', 'SP004', 'AR005', 3000, '2021-07-03', '17:00:00', '2021-07-03', '20:00:00', 'OLTP1', 0),
('SEB54', 'SP004', 'AR006', 3000, '2021-07-03', '18:00:00', '2021-07-03', '21:00:00', 'OLTP1', 0),
('SEB55', 'SP004', 'AR007', 4000, '2021-07-04', '01:00:00', '2021-07-04', '05:00:00', 'OLTP1', 0),
('SEB56', 'SW001', 'AR008', 4000, '2021-07-04', '02:00:00', '2021-07-04', '06:00:00', 'OLTP1', 0),
('SEB57', 'SW001', 'AR009', 4000, '2021-07-04', '03:00:00', '2021-07-04', '07:00:00', 'OLTP1', 0),
('SEB58', 'SW001', 'AW001', 4000, '2021-07-04', '04:00:00', '2021-07-04', '08:00:00', 'OLTP1', 0),
('SEB59', 'SW001', 'AW002', 4000, '2021-07-04', '05:00:00', '2021-07-04', '09:00:00', 'OLTP1', 0),
('SEB6', 'SC001', 'AB006', 1000, '2021-07-01', '06:00:00', '2021-07-01', '07:00:00', 'OLTP1', 0),
('SEB60', 'SW001', 'AW003', 4000, '2021-07-04', '06:00:00', '2021-07-04', '10:00:00', 'OLTP1', 0),
('SEB61', 'SW001', 'CB001', 4000, '2021-07-04', '07:00:00', '2021-07-04', '11:00:00', 'OLTP1', 0),
('SEB62', 'SW001', 'CB002', 4000, '2021-07-04', '08:00:00', '2021-07-04', '12:00:00', 'OLTP1', 0),
('SEB63', 'SW001', 'CC001', 4000, '2021-07-04', '09:00:00', '2021-07-04', '13:00:00', 'OLTP1', 0),
('SEB64', 'SW001', 'CC002', 4000, '2021-07-04', '10:00:00', '2021-07-04', '14:00:00', 'OLTP1', 0),
('SEB65', 'SW001', 'CD001', 4000, '2021-07-04', '11:00:00', '2021-07-04', '15:00:00', 'OLTP1', 0),
('SEB66', 'SW001', 'CD002', 4000, '2021-07-04', '12:00:00', '2021-07-04', '16:00:00', 'OLTP1', 0),
('SEB67', 'SW002', 'CD003', 4000, '2021-07-04', '13:00:00', '2021-07-04', '17:00:00', 'OLTP1', 0),
('SEB68', 'SW002', 'CG001', 4000, '2021-07-04', '14:00:00', '2021-07-04', '18:00:00', 'OLTP1', 0),
('SEB69', 'SW002', 'CH001', 4000, '2021-07-04', '15:00:00', '2021-07-04', '19:00:00', 'OLTP1', 0),
('SEB7', 'SC001', 'AC001', 1000, '2021-07-01', '07:00:00', '2021-07-01', '08:00:00', 'OLTP1', 0),
('SEB70', 'SW002', 'CH002', 4000, '2021-07-04', '16:00:00', '2021-07-04', '20:00:00', 'OLTP1', 0),
('SEB71', 'SW002', 'CH003', 4000, '2021-07-04', '17:00:00', '2021-07-04', '21:00:00', 'OLTP1', 0),
('SEB72', 'SW002', 'CM001', 4000, '2021-07-04', '18:00:00', '2021-07-04', '22:00:00', 'OLTP1', 0),
('SEB73', 'SW002', 'CM002', 5000, '2021-07-05', '01:00:00', '2021-07-05', '06:00:00', 'OLTP1', 0),
('SEB74', 'SW002', 'CM003', 5000, '2021-07-05', '02:00:00', '2021-07-05', '07:00:00', 'OLTP1', 0),
('SEB75', 'SW003', 'CP001', 5000, '2021-07-05', '03:00:00', '2021-07-05', '08:00:00', 'OLTP1', 0),
('SEB76', 'SW003', 'CP002', 5000, '2021-07-05', '04:00:00', '2021-07-05', '09:00:00', 'OLTP1', 0),
('SEB77', 'SW003', 'CR001', 5000, '2021-07-05', '05:00:00', '2021-07-05', '10:00:00', 'OLTP1', 0),
('SEB78', 'SW003', 'CR002', 5000, '2021-07-05', '06:00:00', '2021-07-05', '11:00:00', 'OLTP1', 0),
('SEB79', 'SW003', 'CR003', 5000, '2021-07-05', '07:00:00', '2021-07-05', '12:00:00', 'OLTP1', 0),
('SEB8', 'SC001', 'AC002', 1000, '2021-07-01', '08:00:00', '2021-07-01', '09:00:00', 'OLTP1', 0),
('SEB80', 'SW003', 'CW001', 5000, '2021-07-05', '08:00:00', '2021-07-05', '13:00:00', 'OLTP1', 0),
('SEB81', 'SC001', 'DB001', 5000, '2021-07-05', '09:00:00', '2021-07-05', '14:00:00', 'OLTP1', 0),
('SEB82', 'SC001', 'DB002', 5000, '2021-07-05', '10:00:00', '2021-07-05', '15:00:00', 'OLTP1', 0),
('SEB83', 'SC001', 'DC001', 5000, '2021-07-05', '11:00:00', '2021-07-05', '16:00:00', 'OLTP1', 0),
('SEB84', 'SC001', 'DC002', 5000, '2021-07-05', '12:00:00', '2021-07-05', '17:00:00', 'OLTP1', 0),
('SEB85', 'SC001', 'DD001', 5000, '2021-07-05', '13:00:00', '2021-07-05', '18:00:00', 'OLTP1', 0),
('SEB86', 'SC001', 'DD002', 5000, '2021-07-05', '14:00:00', '2021-07-05', '19:00:00', 'OLTP1', 0),
('SEB87', 'SC001', 'DD003', 5000, '2021-07-05', '15:00:00', '2021-07-05', '20:00:00', 'OLTP1', 0),
('SEB88', 'SC001', 'DG001', 5000, '2021-07-05', '16:00:00', '2021-07-05', '21:00:00', 'OLTP1', 0),
('SEB89', 'SC001', 'DH001', 5000, '2021-07-05', '17:00:00', '2021-07-05', '22:00:00', 'OLTP1', 0),
('SEB9', 'SC001', 'AC003', 1000, '2021-07-01', '09:00:00', '2021-07-01', '10:00:00', 'OLTP1', 0),
('SEB90', 'SC002', 'DH002', 5000, '2021-07-05', '18:00:00', '2021-07-05', '23:00:00', 'OLTP1', 0),
('SEB91', 'SC002', 'DH003', 6000, '2021-07-06', '01:00:00', '2021-07-06', '07:00:00', 'OLTP1', 0),
('SEB92', 'SC002', 'DM001', 6000, '2021-07-06', '02:00:00', '2021-07-06', '08:00:00', 'OLTP1', 0),
('SEB93', 'SC002', 'DM002', 6000, '2021-07-06', '03:00:00', '2021-07-06', '09:00:00', 'OLTP1', 0),
('SEB94', 'SC002', 'DM003', 6000, '2021-07-06', '04:00:00', '2021-07-06', '10:00:00', 'OLTP1', 0),
('SEB95', 'SC002', 'DP001', 6000, '2021-07-06', '05:00:00', '2021-07-06', '11:00:00', 'OLTP1', 0),
('SEB96', 'SC002', 'DP002', 6000, '2021-07-06', '06:00:00', '2021-07-06', '12:00:00', 'OLTP1', 0),
('SEB97', 'SC002', 'DR001', 6000, '2021-07-06', '07:00:00', '2021-07-06', '13:00:00', 'OLTP1', 0),
('SEB98', 'SC003', 'DR002', 6000, '2021-07-06', '08:00:00', '2021-07-06', '14:00:00', 'OLTP1', 0),
('SEB99', 'SC003', 'DR003', 6000, '2021-07-06', '09:00:00', '2021-07-06', '15:00:00', 'OLTP1', 0),
('SEN1', 'SC001', 'DA001', 1000, '2021-07-01', '01:00:00', '2021-07-01', '02:00:00', 'OLTP3', 0),
('SEN10', 'SC001', 'DH001', 1000, '2021-07-01', '10:00:00', '2021-07-01', '11:00:00', 'OLTP3', 0),
('SEN100', 'SM004', 'KW004', 6000, '2021-07-06', '10:00:00', '2021-07-06', '16:00:00', 'OLTP3', 0),
('SEN11', 'SC001', 'DJ001', 1000, '2021-07-01', '11:00:00', '2021-07-01', '12:00:00', 'OLTP3', 0),
('SEN12', 'SC001', 'DM001', 1000, '2021-07-01', '12:00:00', '2021-07-01', '13:00:00', 'OLTP3', 0),
('SEN13', 'SC001', 'DM002', 1000, '2021-07-01', '13:00:00', '2021-07-01', '14:00:00', 'OLTP3', 0),
('SEN14', 'SD002', 'DN001', 1000, '2021-07-01', '14:00:00', '2021-07-01', '15:00:00', 'OLTP3', 0),
('SEN15', 'SD002', 'DR001', 1000, '2021-07-01', '15:00:00', '2021-07-01', '16:00:00', 'OLTP3', 0),
('SEN16', 'SD002', 'DR002', 1000, '2021-07-01', '16:00:00', '2021-07-01', '17:00:00', 'OLTP3', 0),
('SEN17', 'SD002', 'DS001', 1000, '2021-07-01', '17:00:00', '2021-07-01', '18:00:00', 'OLTP3', 0),
('SEN18', 'SD002', 'DS002', 1000, '2021-07-01', '18:00:00', '2021-07-01', '19:00:00', 'OLTP3', 0),
('SEN19', 'SD002', 'DW001', 2000, '2021-07-02', '01:00:00', '2021-07-02', '03:00:00', 'OLTP3', 0),
('SEN2', 'SC001', 'DA002', 1000, '2021-07-01', '02:00:00', '2021-07-01', '03:00:00', 'OLTP3', 0),
('SEN20', 'SD002', 'DW002', 2000, '2021-07-02', '02:00:00', '2021-07-02', '04:00:00', 'OLTP3', 0),
('SEN21', 'SD002', 'GA001', 2000, '2021-07-02', '03:00:00', '2021-07-02', '05:00:00', 'OLTP3', 0),
('SEN22', 'SD002', 'GA002', 2000, '2021-07-02', '04:00:00', '2021-07-02', '06:00:00', 'OLTP3', 0),
('SEN23', 'SL001', 'GB001', 2000, '2021-07-02', '05:00:00', '2021-07-02', '07:00:00', 'OLTP3', 0),
('SEN24', 'SL001', 'GC001', 2000, '2021-07-02', '06:00:00', '2021-07-02', '08:00:00', 'OLTP3', 0),
('SEN25', 'SL001', 'GD001', 2000, '2021-07-02', '07:00:00', '2021-07-02', '09:00:00', 'OLTP3', 0),
('SEN26', 'SL001', 'GE001', 2000, '2021-07-02', '08:00:00', '2021-07-02', '10:00:00', 'OLTP3', 0),
('SEN27', 'SL001', 'GG001', 2000, '2021-07-02', '09:00:00', '2021-07-02', '11:00:00', 'OLTP3', 0),
('SEN28', 'SL001', 'GG002', 2000, '2021-07-02', '10:00:00', '2021-07-02', '12:00:00', 'OLTP3', 0),
('SEN29', 'SL001', 'GG003', 2000, '2021-07-02', '11:00:00', '2021-07-02', '13:00:00', 'OLTP3', 0),
('SEN3', 'SC001', 'DB001', 1000, '2021-07-01', '03:00:00', '2021-07-01', '04:00:00', 'OLTP3', 0),
('SEN30', 'SL001', 'GH001', 2000, '2021-07-02', '12:00:00', '2021-07-02', '14:00:00', 'OLTP3', 0),
('SEN31', 'SL001', 'GJ001', 2000, '2021-07-02', '13:00:00', '2021-07-02', '15:00:00', 'OLTP3', 0),
('SEN32', 'SL001', 'GM001', 2000, '2021-07-02', '14:00:00', '2021-07-02', '16:00:00', 'OLTP3', 0),
('SEN33', 'SL002', 'GM002', 2000, '2021-07-02', '15:00:00', '2021-07-02', '17:00:00', 'OLTP3', 0),
('SEN34', 'SL002', 'GN001', 2000, '2021-07-02', '16:00:00', '2021-07-02', '18:00:00', 'OLTP3', 0),
('SEN35', 'SL002', 'GR001', 2000, '2021-07-02', '17:00:00', '2021-07-02', '19:00:00', 'OLTP3', 0),
('SEN36', 'SL002', 'GR002', 2000, '2021-07-02', '18:00:00', '2021-07-02', '20:00:00', 'OLTP3', 0),
('SEN37', 'SL002', 'GS001', 3000, '2021-07-03', '01:00:00', '2021-07-03', '04:00:00', 'OLTP3', 0),
('SEN38', 'SL002', 'GS002', 3000, '2021-07-03', '02:00:00', '2021-07-03', '05:00:00', 'OLTP3', 0),
('SEN39', 'SL002', 'GW001', 3000, '2021-07-03', '03:00:00', '2021-07-03', '06:00:00', 'OLTP3', 0),
('SEN4', 'SC001', 'DC001', 1000, '2021-07-01', '04:00:00', '2021-07-01', '05:00:00', 'OLTP3', 0),
('SEN40', 'SL002', 'GW002', 3000, '2021-07-03', '04:00:00', '2021-07-03', '07:00:00', 'OLTP3', 0),
('SEN41', 'SL002', 'JA001', 3000, '2021-07-03', '05:00:00', '2021-07-03', '08:00:00', 'OLTP3', 0),
('SEN42', 'SL002', 'JA002', 3000, '2021-07-03', '06:00:00', '2021-07-03', '09:00:00', 'OLTP3', 0),
('SEN43', 'SL003', 'JB001', 3000, '2021-07-03', '07:00:00', '2021-07-03', '10:00:00', 'OLTP3', 0),
('SEN44', 'SL003', 'JC001', 3000, '2021-07-03', '08:00:00', '2021-07-03', '11:00:00', 'OLTP3', 0),
('SEN45', 'SL003', 'JD001', 3000, '2021-07-03', '09:00:00', '2021-07-03', '12:00:00', 'OLTP3', 0),
('SEN46', 'SL003', 'JE001', 3000, '2021-07-03', '10:00:00', '2021-07-03', '13:00:00', 'OLTP3', 0),
('SEN47', 'SL003', 'JG001', 3000, '2021-07-03', '11:00:00', '2021-07-03', '14:00:00', 'OLTP3', 0),
('SEN48', 'SL003', 'JG002', 3000, '2021-07-03', '12:00:00', '2021-07-03', '15:00:00', 'OLTP3', 0),
('SEN49', 'SL003', 'JG003', 3000, '2021-07-03', '13:00:00', '2021-07-03', '16:00:00', 'OLTP3', 0),
('SEN5', 'SC001', 'DD001', 1000, '2021-07-01', '05:00:00', '2021-07-01', '06:00:00', 'OLTP3', 0),
('SEN50', 'SL003', 'JH001', 3000, '2021-07-03', '14:00:00', '2021-07-03', '17:00:00', 'OLTP3', 0),
('SEN51', 'SL003', 'JJ001', 3000, '2021-07-03', '15:00:00', '2021-07-03', '18:00:00', 'OLTP3', 0),
('SEN52', 'SL003', 'JM001', 3000, '2021-07-03', '16:00:00', '2021-07-03', '19:00:00', 'OLTP3', 0),
('SEN53', 'SL003', 'JM002', 3000, '2021-07-03', '17:00:00', '2021-07-03', '20:00:00', 'OLTP3', 0),
('SEN54', 'SL003', 'JN001', 3000, '2021-07-03', '18:00:00', '2021-07-03', '21:00:00', 'OLTP3', 0),
('SEN55', 'SL003', 'JR001', 4000, '2021-07-04', '01:00:00', '2021-07-04', '05:00:00', 'OLTP3', 0),
('SEN56', 'SL003', 'JR002', 4000, '2021-07-04', '02:00:00', '2021-07-04', '06:00:00', 'OLTP3', 0),
('SEN57', 'SL003', 'JS001', 4000, '2021-07-04', '03:00:00', '2021-07-04', '07:00:00', 'OLTP3', 0),
('SEN58', 'SL004', 'JS002', 4000, '2021-07-04', '04:00:00', '2021-07-04', '08:00:00', 'OLTP3', 0),
('SEN59', 'SL004', 'JW001', 4000, '2021-07-04', '05:00:00', '2021-07-04', '09:00:00', 'OLTP3', 0),
('SEN6', 'SC001', 'DE001', 1000, '2021-07-01', '06:00:00', '2021-07-01', '07:00:00', 'OLTP3', 0),
('SEN60', 'SL004', 'JW002', 4000, '2021-07-04', '06:00:00', '2021-07-04', '10:00:00', 'OLTP3', 0),
('SEN61', 'SL004', 'KA001', 4000, '2021-07-04', '07:00:00', '2021-07-04', '11:00:00', 'OLTP3', 0),
('SEN62', 'SL004', 'KA002', 4000, '2021-07-04', '08:00:00', '2021-07-04', '12:00:00', 'OLTP3', 0),
('SEN63', 'SL004', 'KA003', 4000, '2021-07-04', '09:00:00', '2021-07-04', '13:00:00', 'OLTP3', 0),
('SEN64', 'SL004', 'KA004', 4000, '2021-07-04', '10:00:00', '2021-07-04', '14:00:00', 'OLTP3', 0),
('SEN65', 'SL004', 'KB001', 4000, '2021-07-04', '11:00:00', '2021-07-04', '15:00:00', 'OLTP3', 0),
('SEN66', 'SL004', 'KB002', 4000, '2021-07-04', '12:00:00', '2021-07-04', '16:00:00', 'OLTP3', 0),
('SEN67', 'SL004', 'KC001', 4000, '2021-07-04', '13:00:00', '2021-07-04', '17:00:00', 'OLTP3', 0),
('SEN68', 'SL004', 'KC002', 4000, '2021-07-04', '14:00:00', '2021-07-04', '18:00:00', 'OLTP3', 0),
('SEN69', 'SL004', 'KD001', 4000, '2021-07-04', '15:00:00', '2021-07-04', '19:00:00', 'OLTP3', 0),
('SEN7', 'SC001', 'DG001', 1000, '2021-07-01', '07:00:00', '2021-07-01', '08:00:00', 'OLTP3', 0),
('SEN70', 'SL004', 'KD002', 4000, '2021-07-04', '16:00:00', '2021-07-04', '20:00:00', 'OLTP3', 0),
('SEN71', 'SM001', 'KE001', 4000, '2021-07-04', '17:00:00', '2021-07-04', '21:00:00', 'OLTP3', 0),
('SEN72', 'SM001', 'KE002', 4000, '2021-07-04', '18:00:00', '2021-07-04', '22:00:00', 'OLTP3', 0),
('SEN73', 'SM001', 'KG001', 5000, '2021-07-05', '01:00:00', '2021-07-05', '06:00:00', 'OLTP3', 0),
('SEN74', 'SM001', 'KG002', 5000, '2021-07-05', '02:00:00', '2021-07-05', '07:00:00', 'OLTP3', 0),
('SEN75', 'SM001', 'KG003', 5000, '2021-07-05', '03:00:00', '2021-07-05', '08:00:00', 'OLTP3', 0),
('SEN76', 'SM001', 'KG004', 5000, '2021-07-05', '04:00:00', '2021-07-05', '09:00:00', 'OLTP3', 0),
('SEN77', 'SM001', 'KG005', 5000, '2021-07-05', '05:00:00', '2021-07-05', '10:00:00', 'OLTP3', 0),
('SEN78', 'SM002', 'KG006', 5000, '2021-07-05', '06:00:00', '2021-07-05', '11:00:00', 'OLTP3', 0),
('SEN79', 'SM002', 'KH001', 5000, '2021-07-05', '07:00:00', '2021-07-05', '12:00:00', 'OLTP3', 0),
('SEN8', 'SC001', 'DG002', 1000, '2021-07-01', '08:00:00', '2021-07-01', '09:00:00', 'OLTP3', 0),
('SEN80', 'SM002', 'KH002', 5000, '2021-07-05', '08:00:00', '2021-07-05', '13:00:00', 'OLTP3', 0),
('SEN81', 'SM002', 'KJ001', 5000, '2021-07-05', '09:00:00', '2021-07-05', '14:00:00', 'OLTP3', 0),
('SEN82', 'SM002', 'KJ002', 5000, '2021-07-05', '10:00:00', '2021-07-05', '15:00:00', 'OLTP3', 0),
('SEN83', 'SM002', 'KM001', 5000, '2021-07-05', '11:00:00', '2021-07-05', '16:00:00', 'OLTP3', 0),
('SEN84', 'SM002', 'KM002', 5000, '2021-07-05', '12:00:00', '2021-07-05', '17:00:00', 'OLTP3', 0),
('SEN85', 'SM002', 'KM003', 5000, '2021-07-05', '13:00:00', '2021-07-05', '18:00:00', 'OLTP3', 0),
('SEN86', 'SM003', 'KM004', 5000, '2021-07-05', '14:00:00', '2021-07-05', '19:00:00', 'OLTP3', 0),
('SEN87', 'SM003', 'KN001', 5000, '2021-07-05', '15:00:00', '2021-07-05', '20:00:00', 'OLTP3', 0),
('SEN88', 'SM003', 'KN002', 5000, '2021-07-05', '16:00:00', '2021-07-05', '21:00:00', 'OLTP3', 0),
('SEN89', 'SM003', 'KR001', 5000, '2021-07-05', '17:00:00', '2021-07-05', '22:00:00', 'OLTP3', 0),
('SEN9', 'SC001', 'DG003', 1000, '2021-07-01', '09:00:00', '2021-07-01', '10:00:00', 'OLTP3', 0),
('SEN90', 'SM003', 'KR002', 5000, '2021-07-05', '18:00:00', '2021-07-05', '23:00:00', 'OLTP3', 0),
('SEN91', 'SM003', 'KR003', 6000, '2021-07-06', '01:00:00', '2021-07-06', '07:00:00', 'OLTP3', 0),
('SEN92', 'SM003', 'KR004', 6000, '2021-07-06', '02:00:00', '2021-07-06', '08:00:00', 'OLTP3', 0),
('SEN93', 'SM003', 'KS001', 6000, '2021-07-06', '03:00:00', '2021-07-06', '09:00:00', 'OLTP3', 0),
('SEN94', 'SM003', 'KS002', 6000, '2021-07-06', '04:00:00', '2021-07-06', '10:00:00', 'OLTP3', 0),
('SEN95', 'SM003', 'KS003', 6000, '2021-07-06', '05:00:00', '2021-07-06', '11:00:00', 'OLTP3', 0),
('SEN96', 'SM003', 'KS004', 6000, '2021-07-06', '06:00:00', '2021-07-06', '12:00:00', 'OLTP3', 0),
('SEN97', 'SM004', 'KW001', 6000, '2021-07-06', '07:00:00', '2021-07-06', '13:00:00', 'OLTP3', 0),
('SEN98', 'SM004', 'KW002', 6000, '2021-07-06', '08:00:00', '2021-07-06', '14:00:00', 'OLTP3', 0),
('SEN99', 'SM004', 'KW003', 6000, '2021-07-06', '09:00:00', '2021-07-06', '15:00:00', 'OLTP3', 0),
('SEW1', 'SC001', 'EA001', 1000, '2021-07-01', '01:00:00', '2021-07-01', '02:00:00', 'OLTP2', 0),
('SEW10', 'SG002', 'EE002', 1000, '2021-07-01', '10:00:00', '2021-07-01', '11:00:00', 'OLTP2', 0),
('SEW100', 'SG002', 'YW001', 6000, '2021-07-06', '10:00:00', '2021-07-06', '16:00:00', 'OLTP2', 0),
('SEW11', 'SG002', 'EF001', 1000, '2021-07-01', '11:00:00', '2021-07-01', '12:00:00', 'OLTP2', 0),
('SEW12', 'SG002', 'EG001', 1000, '2021-07-01', '12:00:00', '2021-07-01', '13:00:00', 'OLTP2', 0),
('SEW13', 'SG002', 'EH001', 1000, '2021-07-01', '13:00:00', '2021-07-01', '14:00:00', 'OLTP2', 0),
('SEW14', 'SG002', 'EM001', 1000, '2021-07-01', '14:00:00', '2021-07-01', '15:00:00', 'OLTP2', 0),
('SEW15', 'SG002', 'EM002', 1000, '2021-07-01', '15:00:00', '2021-07-01', '16:00:00', 'OLTP2', 0),
('SEW16', 'SG002', 'EM003', 1000, '2021-07-01', '16:00:00', '2021-07-01', '17:00:00', 'OLTP2', 0),
('SEW17', 'SG002', 'ES001', 1000, '2021-07-01', '17:00:00', '2021-07-01', '18:00:00', 'OLTP2', 0),
('SEW18', 'SG003', 'ES002', 1000, '2021-07-01', '18:00:00', '2021-07-01', '19:00:00', 'OLTP2', 0),
('SEW19', 'SG003', 'ET001', 2000, '2021-07-02', '01:00:00', '2021-07-02', '03:00:00', 'OLTP2', 0),
('SEW2', 'SC001', 'EA002', 1000, '2021-07-01', '02:00:00', '2021-07-01', '03:00:00', 'OLTP2', 0),
('SEW20', 'SG003', 'EW001', 2000, '2021-07-02', '02:00:00', '2021-07-02', '04:00:00', 'OLTP2', 0),
('SEW21', 'SG003', 'JA001', 2000, '2021-07-02', '03:00:00', '2021-07-02', '05:00:00', 'OLTP2', 0),
('SEW22', 'SG003', 'JA002', 2000, '2021-07-02', '04:00:00', '2021-07-02', '06:00:00', 'OLTP2', 0),
('SEW23', 'SK001', 'JA003', 2000, '2021-07-02', '05:00:00', '2021-07-02', '07:00:00', 'OLTP2', 0),
('SEW24', 'SK001', 'JA004', 2000, '2021-07-02', '06:00:00', '2021-07-02', '08:00:00', 'OLTP2', 0),
('SEW25', 'SK001', 'JA005', 2000, '2021-07-02', '07:00:00', '2021-07-02', '09:00:00', 'OLTP2', 0),
('SEW26', 'SK001', 'JA006', 2000, '2021-07-02', '08:00:00', '2021-07-02', '10:00:00', 'OLTP2', 0),
('SEW27', 'SK002', 'JB001', 2000, '2021-07-02', '09:00:00', '2021-07-02', '11:00:00', 'OLTP2', 0),
('SEW28', 'SK002', 'JB002', 2000, '2021-07-02', '10:00:00', '2021-07-02', '12:00:00', 'OLTP2', 0),
('SEW29', 'SK002', 'JB003', 2000, '2021-07-02', '11:00:00', '2021-07-02', '13:00:00', 'OLTP2', 0),
('SEW3', 'SC001', 'EA003', 1000, '2021-07-01', '03:00:00', '2021-07-01', '04:00:00', 'OLTP2', 0),
('SEW30', 'SK002', 'JB004', 2000, '2021-07-02', '12:00:00', '2021-07-02', '14:00:00', 'OLTP2', 0),
('SEW31', 'SK002', 'JB005', 2000, '2021-07-02', '13:00:00', '2021-07-02', '15:00:00', 'OLTP2', 0),
('SEW32', 'SK002', 'JB006', 2000, '2021-07-02', '14:00:00', '2021-07-02', '16:00:00', 'OLTP2', 0),
('SEW33', 'SK002', 'JC001', 2000, '2021-07-02', '15:00:00', '2021-07-02', '17:00:00', 'OLTP2', 0),
('SEW34', 'SK003', 'JC002', 2000, '2021-07-02', '16:00:00', '2021-07-02', '18:00:00', 'OLTP2', 0),
('SEW35', 'SK003', 'JD001', 2000, '2021-07-02', '17:00:00', '2021-07-02', '19:00:00', 'OLTP2', 0),
('SEW36', 'SK003', 'JD002', 2000, '2021-07-02', '18:00:00', '2021-07-02', '20:00:00', 'OLTP2', 0),
('SEW37', 'SK003', 'JE001', 3000, '2021-07-03', '01:00:00', '2021-07-03', '04:00:00', 'OLTP2', 0),
('SEW38', 'SK003', 'JE002', 3000, '2021-07-03', '02:00:00', '2021-07-03', '05:00:00', 'OLTP2', 0),
('SEW39', 'SK003', 'JE003', 3000, '2021-07-03', '03:00:00', '2021-07-03', '06:00:00', 'OLTP2', 0),
('SEW4', 'SC001', 'EB001', 1000, '2021-07-01', '04:00:00', '2021-07-01', '05:00:00', 'OLTP2', 0),
('SEW40', 'SK003', 'JE004', 3000, '2021-07-03', '04:00:00', '2021-07-03', '07:00:00', 'OLTP2', 0),
('SEW41', 'SK003', 'JF001', 3000, '2021-07-03', '05:00:00', '2021-07-03', '08:00:00', 'OLTP2', 0),
('SEW42', 'SK003', 'JF002', 3000, '2021-07-03', '06:00:00', '2021-07-03', '09:00:00', 'OLTP2', 0),
('SEW43', 'SO001', 'JG001', 3000, '2021-07-03', '07:00:00', '2021-07-03', '10:00:00', 'OLTP2', 0),
('SEW44', 'SO001', 'JG002', 3000, '2021-07-03', '08:00:00', '2021-07-03', '11:00:00', 'OLTP2', 0),
('SEW45', 'SO001', 'JH001', 3000, '2021-07-03', '09:00:00', '2021-07-03', '12:00:00', 'OLTP2', 0),
('SEW46', 'SO001', 'JH002', 3000, '2021-07-03', '10:00:00', '2021-07-03', '13:00:00', 'OLTP2', 0),
('SEW47', 'SO001', 'JM001', 3000, '2021-07-03', '11:00:00', '2021-07-03', '14:00:00', 'OLTP2', 0),
('SEW48', 'SO001', 'JM002', 3000, '2021-07-03', '12:00:00', '2021-07-03', '15:00:00', 'OLTP2', 0),
('SEW49', 'SO001', 'JM003', 3000, '2021-07-03', '13:00:00', '2021-07-03', '16:00:00', 'OLTP2', 0),
('SEW5', 'SC001', 'EB002', 1000, '2021-07-01', '05:00:00', '2021-07-01', '06:00:00', 'OLTP2', 0),
('SEW50', 'SO001', 'JM004', 3000, '2021-07-03', '14:00:00', '2021-07-03', '17:00:00', 'OLTP2', 0),
('SEW51', 'SO001', 'JM005', 3000, '2021-07-03', '15:00:00', '2021-07-03', '18:00:00', 'OLTP2', 0),
('SEW52', 'SO001', 'JM006', 3000, '2021-07-03', '16:00:00', '2021-07-03', '19:00:00', 'OLTP2', 0),
('SEW53', 'SO001', 'JS001', 3000, '2021-07-03', '17:00:00', '2021-07-03', '20:00:00', 'OLTP2', 0),
('SEW54', 'SO001', 'JS002', 3000, '2021-07-03', '18:00:00', '2021-07-03', '21:00:00', 'OLTP2', 0),
('SEW55', 'SO001', 'JS003', 4000, '2021-07-04', '01:00:00', '2021-07-04', '05:00:00', 'OLTP2', 0),
('SEW56', 'SO001', 'JS004', 4000, '2021-07-04', '02:00:00', '2021-07-04', '06:00:00', 'OLTP2', 0),
('SEW57', 'SO001', 'JT001', 4000, '2021-07-04', '03:00:00', '2021-07-04', '07:00:00', 'OLTP2', 0),
('SEW58', 'SU001', 'JT002', 4000, '2021-07-04', '04:00:00', '2021-07-04', '08:00:00', 'OLTP2', 0),
('SEW59', 'SU001', 'JW001', 4000, '2021-07-04', '05:00:00', '2021-07-04', '09:00:00', 'OLTP2', 0),
('SEW6', 'SC001', 'EB003', 1000, '2021-07-01', '06:00:00', '2021-07-01', '07:00:00', 'OLTP2', 0),
('SEW60', 'SU001', 'JW002', 4000, '2021-07-04', '06:00:00', '2021-07-04', '10:00:00', 'OLTP2', 0),
('SEW61', 'SU001', 'QA001', 4000, '2021-07-04', '07:00:00', '2021-07-04', '11:00:00', 'OLTP2', 0),
('SEW62', 'SU001', 'QA002', 4000, '2021-07-04', '08:00:00', '2021-07-04', '12:00:00', 'OLTP2', 0),
('SEW63', 'SU001', 'QA003', 4000, '2021-07-04', '09:00:00', '2021-07-04', '13:00:00', 'OLTP2', 0),
('SEW64', 'SU001', 'QB001', 4000, '2021-07-04', '10:00:00', '2021-07-04', '14:00:00', 'OLTP2', 0),
('SEW65', 'SU001', 'QB002', 4000, '2021-07-04', '11:00:00', '2021-07-04', '15:00:00', 'OLTP2', 0),
('SEW66', 'SU002', 'QB003', 4000, '2021-07-04', '12:00:00', '2021-07-04', '16:00:00', 'OLTP2', 0),
('SEW67', 'SU002', 'QC001', 4000, '2021-07-04', '13:00:00', '2021-07-04', '17:00:00', 'OLTP2', 0),
('SEW68', 'SU002', 'QD001', 4000, '2021-07-04', '14:00:00', '2021-07-04', '18:00:00', 'OLTP2', 0),
('SEW69', 'SU002', 'QE001', 4000, '2021-07-04', '15:00:00', '2021-07-04', '19:00:00', 'OLTP2', 0),
('SEW7', 'SC001', 'EC001', 1000, '2021-07-01', '07:00:00', '2021-07-01', '08:00:00', 'OLTP2', 0),
('SEW70', 'SU002', 'QE002', 4000, '2021-07-04', '16:00:00', '2021-07-04', '20:00:00', 'OLTP2', 0),
('SEW71', 'SU002', 'QF001', 4000, '2021-07-04', '17:00:00', '2021-07-04', '21:00:00', 'OLTP2', 0),
('SEW72', 'SU002', 'QG001', 4000, '2021-07-04', '18:00:00', '2021-07-04', '22:00:00', 'OLTP2', 0),
('SEW73', 'SU002', 'QH001', 5000, '2021-07-05', '01:00:00', '2021-07-05', '06:00:00', 'OLTP2', 0),
('SEW74', 'SU002', 'QM001', 5000, '2021-07-05', '02:00:00', '2021-07-05', '07:00:00', 'OLTP2', 0),
('SEW75', 'SU003', 'QM002', 5000, '2021-07-05', '03:00:00', '2021-07-05', '08:00:00', 'OLTP2', 0),
('SEW76', 'SU003', 'QM003', 5000, '2021-07-05', '04:00:00', '2021-07-05', '09:00:00', 'OLTP2', 0),
('SEW77', 'SU003', 'QS001', 5000, '2021-07-05', '05:00:00', '2021-07-05', '10:00:00', 'OLTP2', 0),
('SEW78', 'SU003', 'QS002', 5000, '2021-07-05', '06:00:00', '2021-07-05', '11:00:00', 'OLTP2', 0),
('SEW79', 'SU003', 'QT001', 5000, '2021-07-05', '07:00:00', '2021-07-05', '12:00:00', 'OLTP2', 0),
('SEW8', 'SC001', 'ED001', 1000, '2021-07-01', '08:00:00', '2021-07-01', '09:00:00', 'OLTP2', 0),
('SEW80', 'SU003', 'QW001', 5000, '2021-07-05', '08:00:00', '2021-07-05', '13:00:00', 'OLTP2', 0),
('SEW81', 'SU003', 'YA001', 5000, '2021-07-05', '09:00:00', '2021-07-05', '14:00:00', 'OLTP2', 0),
('SEW82', 'SU003', 'YA002', 5000, '2021-07-05', '10:00:00', '2021-07-05', '15:00:00', 'OLTP2', 0),
('SEW83', 'SU003', 'YA003', 5000, '2021-07-05', '11:00:00', '2021-07-05', '16:00:00', 'OLTP2', 0),
('SEW84', 'SU003', 'YB001', 5000, '2021-07-05', '12:00:00', '2021-07-05', '17:00:00', 'OLTP2', 0),
('SEW85', 'SG001', 'YB002', 5000, '2021-07-05', '13:00:00', '2021-07-05', '18:00:00', 'OLTP2', 0),
('SEW86', 'SG001', 'YB003', 5000, '2021-07-05', '14:00:00', '2021-07-05', '19:00:00', 'OLTP2', 0),
('SEW87', 'SG001', 'YC001', 5000, '2021-07-05', '15:00:00', '2021-07-05', '20:00:00', 'OLTP2', 0),
('SEW88', 'SG001', 'YD001', 5000, '2021-07-05', '16:00:00', '2021-07-05', '21:00:00', 'OLTP2', 0),
('SEW89', 'SG001', 'YE001', 5000, '2021-07-05', '17:00:00', '2021-07-05', '22:00:00', 'OLTP2', 0),
('SEW9', 'SC001', 'EE001', 1000, '2021-07-01', '09:00:00', '2021-07-01', '10:00:00', 'OLTP2', 0),
('SEW90', 'SG001', 'YE002', 5000, '2021-07-05', '18:00:00', '2021-07-05', '23:00:00', 'OLTP2', 0),
('SEW91', 'SG001', 'YF001', 6000, '2021-07-06', '01:00:00', '2021-07-06', '07:00:00', 'OLTP2', 0),
('SEW92', 'SG001', 'YG001', 6000, '2021-07-06', '02:00:00', '2021-07-06', '08:00:00', 'OLTP2', 0),
('SEW93', 'SG001', 'YH001', 6000, '2021-07-06', '03:00:00', '2021-07-06', '09:00:00', 'OLTP2', 0),
('SEW94', 'SG001', 'YM001', 6000, '2021-07-06', '04:00:00', '2021-07-06', '10:00:00', 'OLTP2', 0),
('SEW95', 'SG001', 'YM002', 6000, '2021-07-06', '05:00:00', '2021-07-06', '11:00:00', 'OLTP2', 0),
('SEW96', 'SG001', 'YM003', 6000, '2021-07-06', '06:00:00', '2021-07-06', '12:00:00', 'OLTP2', 0),
('SEW97', 'SG001', 'YS001', 6000, '2021-07-06', '07:00:00', '2021-07-06', '13:00:00', 'OLTP2', 0),
('SEW98', 'SG001', 'YS002', 6000, '2021-07-06', '08:00:00', '2021-07-06', '14:00:00', 'OLTP2', 0),
('SEW99', 'SG002', 'YT001', 6000, '2021-07-06', '09:00:00', '2021-07-06', '15:00:00', 'OLTP2', 0);

-- --------------------------------------------------------

--
-- Structure for view `p_cabang`
--
DROP TABLE IF EXISTS `p_cabang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`student`@`%` SQL SECURITY DEFINER VIEW `p_cabang`  AS  select `c`.`nama_cabang` AS `Lokasi Gerai`,count(`ts`.`id_sewa`) AS `Total Sewa yang Terjadi`,format(sum(`ts`.`harga_sewa`),0) AS `Total Pemasukan` from (`cabang` `c` left join `transaksi_sewa` `ts` on((`c`.`cabang_id` = `ts`.`cabang_id`))) group by `c`.`nama_cabang` ;

-- --------------------------------------------------------

--
-- Structure for view `p_cabangpenyewa`
--
DROP TABLE IF EXISTS `p_cabangpenyewa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`student`@`%` SQL SECURITY DEFINER VIEW `p_cabangpenyewa`  AS  select `c`.`nama_cabang` AS `Lokasi Gerai`,`p`.`nama_penyewa` AS `Nama Penyewa`,`ts`.`id_sewa` AS `ID Sewa`,ifnull(format(sum(`ts`.`harga_sewa`),0),0) AS `Total Pengeluaran`,ifnull(count(`ts`.`id_sewa`),0) AS `Total Transaksi` from ((`penyewa` `p` join `cabang` `c`) join `transaksi_sewa` `ts`) where ((`p`.`id_penyewa` = `ts`.`id_penyewa`) and (`c`.`cabang_id` = `ts`.`cabang_id`)) group by `ID Sewa` ;

-- --------------------------------------------------------

--
-- Structure for view `p_lokasisepeda`
--
DROP TABLE IF EXISTS `p_lokasisepeda`;

CREATE ALGORITHM=UNDEFINED DEFINER=`student`@`%` SQL SECURITY DEFINER VIEW `p_lokasisepeda`  AS  select `c`.`nama_cabang` AS `Lokasi Sepeda`,`s`.`brand_sepeda` AS `Brand Sepeda`,`s`.`warna_sepeda` AS `Warna Sepeda`,`s`.`nomor_gerai` AS `Nomor Gerai`,`s`.`quantity` AS `Quantity` from (`sepeda` `s` left join `cabang` `c` on((`s`.`cabang_id` = `c`.`cabang_id`))) order by `s`.`brand_sepeda` ;

-- --------------------------------------------------------

--
-- Structure for view `p_penyewa`
--
DROP TABLE IF EXISTS `p_penyewa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`student`@`%` SQL SECURITY DEFINER VIEW `p_penyewa`  AS  select `p`.`id_penyewa` AS `ID Penyewa`,`p`.`nama_penyewa` AS `Nama Penyewa`,format(`p`.`saldo_penyewa`,0) AS `Saldo Penyewa`,ifnull(format(sum(`ts`.`harga_sewa`),0),0) AS `Total Pengeluaran`,count(`ts`.`id_sewa`) AS `Total Sewa yang Terjadi` from (`penyewa` `p` left join `transaksi_sewa` `ts` on((`ts`.`id_penyewa` = `p`.`id_penyewa`))) group by `p`.`id_penyewa` ;

-- --------------------------------------------------------

--
-- Structure for view `p_penyewasepeda`
--
DROP TABLE IF EXISTS `p_penyewasepeda`;

CREATE ALGORITHM=UNDEFINED DEFINER=`student`@`%` SQL SECURITY DEFINER VIEW `p_penyewasepeda`  AS  select `p`.`nama_penyewa` AS `Nama Penyewa`,`s`.`brand_sepeda` AS `Merek Sepeda`,`s`.`warna_sepeda` AS `Warna Sepeda`,`c`.`nama_cabang` AS `Lokasi Sewa` from (((`penyewa` `p` join `transaksi_sewa` `t`) join `sepeda` `s`) join `cabang` `c`) where ((`t`.`id_penyewa` = `p`.`id_penyewa`) and (`s`.`id_sepeda` = `t`.`id_sepeda`) and (`c`.`cabang_id` = `t`.`cabang_id`)) order by `p`.`nama_penyewa` ;

-- --------------------------------------------------------

--
-- Structure for view `p_sepeda`
--
DROP TABLE IF EXISTS `p_sepeda`;

CREATE ALGORITHM=UNDEFINED DEFINER=`student`@`%` SQL SECURITY DEFINER VIEW `p_sepeda`  AS  select `s`.`id_sepeda` AS `QR Sepeda`,`s`.`brand_sepeda` AS `Brand Sepeda`,`s`.`warna_sepeda` AS `Warna Sepeda`,count(`ts`.`id_sepeda`) AS `Jumlah Sepeda Telah Disewa` from (`sepeda` `s` left join `transaksi_sewa` `ts` on((`ts`.`id_sepeda` = `s`.`id_sepeda`))) group by `s`.`id_sepeda` ;

-- --------------------------------------------------------

--
-- Structure for view `p_transaksisewa`
--
DROP TABLE IF EXISTS `p_transaksisewa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`student`@`%` SQL SECURITY DEFINER VIEW `p_transaksisewa`  AS  select `ts`.`id_sewa` AS `ID Transaksi Sewa`,`ts`.`id_sepeda` AS `ID Sepeda`,`s`.`brand_sepeda` AS `Brand Sepeda`,`ts`.`id_penyewa` AS `ID Penyewa`,`p`.`nama_penyewa` AS `Nama Penyewa`,format(`ts`.`harga_sewa`,0) AS `Total Pengeluaran`,`ts`.`tglawal_sewa` AS `Tanggal Awal Sewa`,`ts`.`jamawal_sewa` AS `Jam Awal Sewa`,`ts`.`tglakhir_sewa` AS `Tanggal Akhir Sewa`,`ts`.`jamakhir_sewa` AS `Jam Akhir Sewa`,`c`.`nama_cabang` AS `Lokasi Gerai` from (((`penyewa` `p` join `transaksi_sewa` `ts`) join `sepeda` `s`) join `cabang` `c`) where ((`ts`.`id_penyewa` = `p`.`id_penyewa`) and (`ts`.`id_sepeda` = `s`.`id_sepeda`) and (`ts`.`cabang_id` = `c`.`cabang_id`)) group by `ID Transaksi Sewa` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`cabang_id`);

--
-- Indexes for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`id_penyewa`),
  ADD KEY `cabang_id` (`cabang_id`);

--
-- Indexes for table `sepeda`
--
ALTER TABLE `sepeda`
  ADD PRIMARY KEY (`id_sepeda`),
  ADD KEY `cabang_id` (`cabang_id`);

--
-- Indexes for table `transaksi_sewa`
--
ALTER TABLE `transaksi_sewa`
  ADD PRIMARY KEY (`id_sewa`),
  ADD KEY `cabang_id` (`cabang_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD CONSTRAINT `penyewa_ibfk_1` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`cabang_id`);

--
-- Constraints for table `sepeda`
--
ALTER TABLE `sepeda`
  ADD CONSTRAINT `sepeda_ibfk_1` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`cabang_id`);

--
-- Constraints for table `transaksi_sewa`
--
ALTER TABLE `transaksi_sewa`
  ADD CONSTRAINT `transaksi_sewa_ibfk_1` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`cabang_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
