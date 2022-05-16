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
-- Database: `DW_AGUS_OLTP1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`student`@`%` PROCEDURE `NewPenyewa` (IN `Nama` VARCHAR(50), IN `Username` VARCHAR(25), IN `Alamat` VARCHAR(200), IN `Phone` VARCHAR(15), IN `Email` VARCHAR(200))  NO SQL
insert into `penyewa`(`NAMA_PENYEWA`, `USERNAME_PENYEWA`, `ALAMAT_PENYEWA`, `TELP_PENYEWA`, `EMAIL_ADDRESS`)
values (Nama, Username, Alamat, Phone, Email);$$

CREATE DEFINER=`student`@`%` PROCEDURE `pIDGerai` (IN `NAMA_DGERAI` VARCHAR(50), IN `NAMA_BGerai` VARCHAR(50))  BEGIN
	DECLARE ID VARCHAR(50);
    
    SET ID = concat(substring(NAMA_DGERAI,1,1),substring(NAMA_BGerai,1,1)); 
    
    SELECT concat(ID, LPAD(IFNULL(substring(max(nomor_gerai),3,3),0) + 1, 3, '0')) as ID_BARU
    FROM gerai_sepeda
    WHERE substring(nomor_gerai,1,1) = ID;
END$$

CREATE DEFINER=`student`@`%` PROCEDURE `pIDPenyewa` (IN `NAMA_D` VARCHAR(50), IN `NAMA_B` VARCHAR(50))  BEGIN
	DECLARE ID VARCHAR(50);
    
	SET ID = concat(substring(NAMA_D,1,1),substring(NAMA_B,1,1)); 
    
    SELECT concat(ID, LPAD(IFNULL(substring(max(id_penyewa),3,3),0) + 1, 3, '0')) as ID_BARU
    FROM penyewa
    WHERE substring(id_penyewa,1,2) = ID;
END$$

--
-- Functions
--
CREATE DEFINER=`student`@`%` FUNCTION `fGenIDsewa` (`paridpenyewa` VARCHAR(5)) RETURNS VARCHAR(17) CHARSET utf8mb4 READS SQL DATA
BEGIN
	DECLARE temp INT;
    DECLARE idpenyewa VARCHAR(5);
    DECLARE tempID VARCHAR(17);
    
	SET tempID = CONCAT('S', paridpenyewa, '/', DATE_FORMAT(NOW(), "%d%m%Y"), '/');
    
    SELECT IFNULL(SUBSTR(MAX(id_sewa), 17, 1), 0) + 1 INTO temp 
    FROM transaksi_sewa ts 
    WHERE SUBSTR(id_sewa,1,16) = tempID;
    
    SET tempID = CONCAT(tempID, temp);
    
    RETURN tempID;
    
END$$

CREATE DEFINER=`student`@`%` FUNCTION `fGenIDtopup` (`paridpenyewa` VARCHAR(5)) RETURNS VARCHAR(20) CHARSET utf8mb4 READS SQL DATA
BEGIN
	DECLARE temp INT;
    DECLARE idpenyewa VARCHAR(5);
    DECLARE tempID VARCHAR(20);
    
	SET tempID = CONCAT('TU', paridpenyewa, '/', DATE_FORMAT(NOW(), "%d%m%Y"), '/');
    
    SELECT IFNULL(SUBSTR(MAX(id_topup), 18, 3), 0) + 1 INTO temp
    FROM transaksi_topup
    WHERE substring(id_topup,1,17) = tempID;
    
    SET tempID = CONCAT(tempID, LPAD(temp, 3, '0'));
    
    RETURN tempID;
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gerai_sepeda`
--

CREATE TABLE `gerai_sepeda` (
  `nomor_gerai` varchar(20) NOT NULL,
  `nama_gerai` varchar(50) NOT NULL,
  `alamat_gerai` varchar(200) NOT NULL,
  `telp_gerai` varchar(15) NOT NULL,
  `gerai_delete` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gerai_sepeda`
--

INSERT INTO `gerai_sepeda` (`nomor_gerai`, `nama_gerai`, `alamat_gerai`, `telp_gerai`, `gerai_delete`) VALUES
('G0001', 'Chopper Bike', 'Jalan Supratman 5', '081257327652', 0),
('G0002', 'Stone Bike', 'Jalan Pattimura 10', '0812468356219', 0),
('G0003', 'Iron Bike', 'Jalan Nangka Utara 15', '0812849273512', 0),
('G0004', 'Gold Bike', 'Jalan Nangka Selatan 20', '081242652342', 0),
('G0005', 'Diamond Bike', 'Jalan Pantangan 25', '0812394823425', 0);

--
-- Triggers `gerai_sepeda`
--
DELIMITER $$
CREATE TRIGGER `new_gerai` BEFORE INSERT ON `gerai_sepeda` FOR EACH ROW BEGIN
	Declare firstname varchar(200);
    Declare lastname varchar(200);
    
    set firstname = substring_index(new.nama_gerai,' ',1);
    set lastname = substring_index(new.nama_gerai,' ',-1);
    set firstname = concat(upper(substring(firstname,1,1)), lower(substring(firstname,2,length(firstname))));
    set lastname = concat(upper(substring(lastname,1,1)),lower(substring(lastname,2,length(lastname))));


set new.nama_gerai = concat(firstname,' ',lastname);

END
$$
DELIMITER ;

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
  `penyewa_delete` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `penyewa`
--

INSERT INTO `penyewa` (`id_penyewa`, `nama_penyewa`, `username_penyewa`, `alamat_penyewa`, `telp_penyewa`, `saldo_penyewa`, `email_address`, `penyewa_delete`) VALUES
('AB001', 'Arien Bruce', 'ArienBruce', 'Christie Way2', '081332554002', '2000', 'ArienBruce@gmail.com', 0),
('AB002', 'Arien Brooks', 'ArienBrooks', 'Pinewood Drive15', '081332554015', '15000', 'ArienBrooks@gmail.com', 0),
('AB003', 'Ayline Bruce', 'AylineBruce', 'Christie Way22', '081332554022', '22000', 'AylineBruce@gmail.com', 0),
('AB004', 'Ayline Brooks', 'AylineBrooks', 'Pinewood Drive35', '081332554035', '35000', 'AylineBrooks@gmail.com', 0),
('AB005', 'Andraya Bruce', 'AndrayaBruce', 'Christie Way62', '081332554062', '62000', 'AndrayaBruce@gmail.com', 0),
('AB006', 'Andraya Brooks', 'AndrayaBrooks', 'Pinewood Drive75', '081332554075', '75000', 'AndrayaBrooks@gmail.com', 0),
('AC001', 'Arien Clay', 'ArienClay', 'Hidden Valley Road12', '081332554012', '12000', 'ArienClay@gmail.com', 0),
('AC002', 'Arien Case', 'ArienCase', 'Traders Alley20', '081332554020', '20000', 'ArienCase@gmail.com', 0),
('AC003', 'Ayline Clay', 'AylineClay', 'Hidden Valley Road32', '081332554032', '32000', 'AylineClay@gmail.com', 0),
('AC004', 'Ayline Case', 'AylineCase', 'Traders Alley40', '081332554040', '40000', 'AylineCase@gmail.com', 0),
('AC005', 'Andraya Clay', 'AndrayaClay', 'Hidden Valley Road72', '081332554072', '72000', 'AndrayaClay@gmail.com', 0),
('AC006', 'Andraya Case', 'AndrayaCase', 'Traders Alley80', '081332554080', '80000', 'AndrayaCase@gmail.com', 0),
('AD001', 'Arien Dickerson', 'ArienDickerson', 'Valley Lane7', '081332554007', '7000', 'ArienDickerson@gmail.com', 0),
('AD002', 'Arien Daugherty', 'ArienDaugherty', 'University Hill Road10', '081332554010', '10000', 'ArienDaugherty@gmail.com', 0),
('AD003', 'Arien Deleon', 'ArienDeleon', 'Simpson Avenue16', '081332554016', '16000', 'ArienDeleon@gmail.com', 0),
('AD004', 'Ayline Dickerson', 'AylineDickerson', 'Valley Lane27', '081332554027', '27000', 'AylineDickerson@gmail.com', 0),
('AD005', 'Ayline Daugherty', 'AylineDaugherty', 'University Hill Road30', '081332554030', '30000', 'AylineDaugherty@gmail.com', 0),
('AD006', 'Ayline Deleon', 'AylineDeleon', 'Simpson Avenue36', '081332554036', '36000', 'AylineDeleon@gmail.com', 0),
('AD007', 'Andraya Dickerson', 'AndrayaDickerson', 'Valley Lane67', '081332554067', '67000', 'AndrayaDickerson@gmail.com', 0),
('AD008', 'Andraya Daugherty', 'AndrayaDaugherty', 'University Hill Road70', '081332554070', '70000', 'AndrayaDaugherty@gmail.com', 0),
('AD009', 'Andraya Deleon', 'AndrayaDeleon', 'Simpson Avenue76', '081332554076', '76000', 'AndrayaDeleon@gmail.com', 0),
('AG001', 'Arien Guerrero', 'ArienGuerrero', 'Locust Court3', '081332554003', '3000', 'ArienGuerrero@gmail.com', 0),
('AG002', 'Ayline Guerrero', 'AylineGuerrero', 'Locust Court23', '081332554023', '23000', 'AylineGuerrero@gmail.com', 0),
('AG003', 'Andraya Guerrero', 'AndrayaGuerrero', 'Locust Court63', '081332554063', '63000', 'AndrayaGuerrero@gmail.com', 0),
('AH001', 'Arien Holt', 'ArienHolt', 'Keyser Ridge Road13', '081332554013', '13000', 'ArienHolt@gmail.com', 0),
('AH002', 'Arien Horne', 'ArienHorne', 'Calico Drive17', '081332554017', '17000', 'ArienHorne@gmail.com', 0),
('AH003', 'Arien Haley', 'ArienHaley', 'Renwick Drive19', '081332554019', '19000', 'ArienHaley@gmail.com', 0),
('AH004', 'Ayline Holt', 'AylineHolt', 'Keyser Ridge Road33', '081332554033', '33000', 'AylineHolt@gmail.com', 0),
('AH005', 'Ayline Horne', 'AylineHorne', 'Calico Drive37', '081332554037', '37000', 'AylineHorne@gmail.com', 0),
('AH006', 'Ayline Haley', 'AylineHaley', 'Renwick Drive39', '081332554039', '39000', 'AylineHaley@gmail.com', 0),
('AH007', 'Andraya Holt', 'AndrayaHolt', 'Keyser Ridge Road73', '081332554073', '73000', 'AndrayaHolt@gmail.com', 0),
('AH008', 'Andraya Horne', 'AndrayaHorne', 'Calico Drive77', '081332554077', '77000', 'AndrayaHorne@gmail.com', 0),
('AH009', 'Andraya Haley', 'AndrayaHaley', 'Renwick Drive79', '081332554079', '79000', 'AndrayaHaley@gmail.com', 0),
('AM001', 'Arien Mooney', 'ArienMooney', 'Pyramid Valley Road6', '081332554006', '6000', 'ArienMooney@gmail.com', 0),
('AM002', 'Arien Mcmillan', 'ArienMcmillan', 'Emily Drive11', '081332554011', '11000', 'ArienMcmillan@gmail.com', 0),
('AM003', 'Arien Massey', 'ArienMassey', 'Libby Street18', '081332554018', '18000', 'ArienMassey@gmail.com', 0),
('AM004', 'Ayline Mooney', 'AylineMooney', 'Pyramid Valley Road26', '081332554026', '26000', 'AylineMooney@gmail.com', 0),
('AM005', 'Ayline Mcmillan', 'AylineMcmillan', 'Emily Drive31', '081332554031', '31000', 'AylineMcmillan@gmail.com', 0),
('AM006', 'Ayline Massey', 'AylineMassey', 'Libby Street38', '081332554038', '38000', 'AylineMassey@gmail.com', 0),
('AM007', 'Andraya Mooney', 'AndrayaMooney', 'Pyramid Valley Road66', '081332554066', '66000', 'AndrayaMooney@gmail.com', 0),
('AM008', 'Andraya Mcmillan', 'AndrayaMcmillan', 'Emily Drive71', '081332554071', '71000', 'AndrayaMcmillan@gmail.com', 0),
('AM009', 'Andraya Massey', 'AndrayaMassey', 'Libby Street78', '081332554078', '78000', 'AndrayaMassey@gmail.com', 0),
('AP001', 'Arien Porter', 'ArienPorter', 'Gambler Lane4', '081332554004', '4000', 'ArienPorter@gmail.com', 0),
('AP002', 'Arien Phelps', 'ArienPhelps', 'Hershell Hollow Road9', '081332554009', '9000', 'ArienPhelps@gmail.com', 0),
('AP003', 'Ayline Porter', 'AylinePorter', 'Gambler Lane24', '081332554024', '24000', 'AylinePorter@gmail.com', 0),
('AP004', 'Ayline Phelps', 'AylinePhelps', 'Hershell Hollow Road29', '081332554029', '29000', 'AylinePhelps@gmail.com', 0),
('AP005', 'Andraya Porter', 'AndrayaPorter', 'Gambler Lane64', '081332554064', '64000', 'AndrayaPorter@gmail.com', 0),
('AP006', 'Andraya Phelps', 'AndrayaPhelps', 'Hershell Hollow Road69', '081332554069', '69000', 'AndrayaPhelps@gmail.com', 0),
('AR001', 'Arien Riggs', 'ArienRiggs', 'Dane Street1', '081332554001', '1000', 'ArienRiggs@gmail.com', 0),
('AR002', 'Arien Roberts', 'ArienRoberts', 'Monroe Avenue5', '081332554005', '5000', 'ArienRoberts@gmail.com', 0),
('AR003', 'Arien Rhodes', 'ArienRhodes', 'Lawman Avenue14', '081332554014', '14000', 'ArienRhodes@gmail.com', 0),
('AR004', 'Ayline Riggs', 'AylineRiggs', 'Dane Street21', '081332554021', '21000', 'AylineRiggs@gmail.com', 0),
('AR005', 'Ayline Roberts', 'AylineRoberts', 'Monroe Avenue25', '081332554025', '25000', 'AylineRoberts@gmail.com', 0),
('AR006', 'Ayline Rhodes', 'AylineRhodes', 'Lawman Avenue34', '081332554034', '34000', 'AylineRhodes@gmail.com', 0),
('AR007', 'Andraya Riggs', 'AndrayaRiggs', 'Dane Street61', '081332554061', '61000', 'AndrayaRiggs@gmail.com', 0),
('AR008', 'Andraya Roberts', 'AndrayaRoberts', 'Monroe Avenue65', '081332554065', '65000', 'AndrayaRoberts@gmail.com', 0),
('AR009', 'Andraya Rhodes', 'AndrayaRhodes', 'Lawman Avenue74', '081332554074', '74000', 'AndrayaRhodes@gmail.com', 0),
('AW001', 'Arien Willis', 'ArienWillis', 'Bryan Avenue8', '081332554008', '8000', 'ArienWillis@gmail.com', 0),
('AW002', 'Ayline Willis', 'AylineWillis', 'Bryan Avenue28', '081332554028', '28000', 'AylineWillis@gmail.com', 0),
('AW003', 'Andraya Willis', 'AndrayaWillis', 'Bryan Avenue68', '081332554068', '68000', 'AndrayaWillis@gmail.com', 0),
('CB001', 'Cyncere Bruce', 'CyncereBruce', 'Christie Way82', '081332554082', '82000', 'CyncereBruce@gmail.com', 0),
('CB002', 'Cyncere Brooks', 'CyncereBrooks', 'Pinewood Drive95', '081332554095', '95000', 'CyncereBrooks@gmail.com', 0),
('CC001', 'Cyncere Clay', 'CyncereClay', 'Hidden Valley Road92', '081332554092', '92000', 'CyncereClay@gmail.com', 0),
('CC002', 'Cyncere Case', 'CyncereCase', 'Traders Alley100', '081332554100', '100000', 'CyncereCase@gmail.com', 0),
('CD001', 'Cyncere Dickerson', 'CyncereDickerson', 'Valley Lane87', '081332554087', '87000', 'CyncereDickerson@gmail.com', 0),
('CD002', 'Cyncere Daugherty', 'CyncereDaugherty', 'University Hill Road90', '081332554090', '90000', 'CyncereDaugherty@gmail.com', 0),
('CD003', 'Cyncere Deleon', 'CyncereDeleon', 'Simpson Avenue96', '081332554096', '96000', 'CyncereDeleon@gmail.com', 0),
('CG001', 'Cyncere Guerrero', 'CyncereGuerrero', 'Locust Court83', '081332554083', '83000', 'CyncereGuerrero@gmail.com', 0),
('CH001', 'Cyncere Holt', 'CyncereHolt', 'Keyser Ridge Road93', '081332554093', '93000', 'CyncereHolt@gmail.com', 0),
('CH002', 'Cyncere Horne', 'CyncereHorne', 'Calico Drive97', '081332554097', '97000', 'CyncereHorne@gmail.com', 0),
('CH003', 'Cyncere Haley', 'CyncereHaley', 'Renwick Drive99', '081332554099', '99000', 'CyncereHaley@gmail.com', 0),
('CM001', 'Cyncere Mooney', 'CyncereMooney', 'Pyramid Valley Road86', '081332554086', '86000', 'CyncereMooney@gmail.com', 0),
('CM002', 'Cyncere Mcmillan', 'CyncereMcmillan', 'Emily Drive91', '081332554091', '91000', 'CyncereMcmillan@gmail.com', 0),
('CM003', 'Cyncere Massey', 'CyncereMassey', 'Libby Street98', '081332554098', '98000', 'CyncereMassey@gmail.com', 0),
('CP001', 'Cyncere Porter', 'CyncerePorter', 'Gambler Lane84', '081332554084', '84000', 'CyncerePorter@gmail.com', 0),
('CP002', 'Cyncere Phelps', 'CyncerePhelps', 'Hershell Hollow Road89', '081332554089', '89000', 'CyncerePhelps@gmail.com', 0),
('CR001', 'Cyncere Riggs', 'CyncereRiggs', 'Dane Street81', '081332554081', '81000', 'CyncereRiggs@gmail.com', 0),
('CR002', 'Cyncere Roberts', 'CyncereRoberts', 'Monroe Avenue85', '081332554085', '85000', 'CyncereRoberts@gmail.com', 0),
('CR003', 'Cyncere Rhodes', 'CyncereRhodes', 'Lawman Avenue94', '081332554094', '94000', 'CyncereRhodes@gmail.com', 0),
('CW001', 'Cyncere Willis', 'CyncereWillis', 'Bryan Avenue88', '081332554088', '88000', 'CyncereWillis@gmail.com', 0),
('DB001', 'Devendra Bruce', 'DevendraBruce', 'Christie Way42', '081332554042', '42000', 'DevendraBruce@gmail.com', 0),
('DB002', 'Devendra Brooks', 'DevendraBrooks', 'Pinewood Drive55', '081332554055', '55000', 'DevendraBrooks@gmail.com', 0),
('DC001', 'Devendra Clay', 'DevendraClay', 'Hidden Valley Road52', '081332554052', '52000', 'DevendraClay@gmail.com', 0),
('DC002', 'Devendra Case', 'DevendraCase', 'Traders Alley60', '081332554060', '60000', 'DevendraCase@gmail.com', 0),
('DD001', 'Devendra Dickerson', 'DevendraDickerson', 'Valley Lane47', '081332554047', '47000', 'DevendraDickerson@gmail.com', 0),
('DD002', 'Devendra Daugherty', 'DevendraDaugherty', 'University Hill Road50', '081332554050', '50000', 'DevendraDaugherty@gmail.com', 0),
('DD003', 'Devendra Deleon', 'DevendraDeleon', 'Simpson Avenue56', '081332554056', '56000', 'DevendraDeleon@gmail.com', 0),
('DG001', 'Devendra Guerrero', 'DevendraGuerrero', 'Locust Court43', '081332554043', '43000', 'DevendraGuerrero@gmail.com', 0),
('DH001', 'Devendra Holt', 'DevendraHolt', 'Keyser Ridge Road53', '081332554053', '53000', 'DevendraHolt@gmail.com', 0),
('DH002', 'Devendra Horne', 'DevendraHorne', 'Calico Drive57', '081332554057', '57000', 'DevendraHorne@gmail.com', 0),
('DH003', 'Devendra Haley', 'DevendraHaley', 'Renwick Drive59', '081332554059', '59000', 'DevendraHaley@gmail.com', 0),
('DM001', 'Devendra Mooney', 'DevendraMooney', 'Pyramid Valley Road46', '081332554046', '46000', 'DevendraMooney@gmail.com', 0),
('DM002', 'Devendra Mcmillan', 'DevendraMcmillan', 'Emily Drive51', '081332554051', '51000', 'DevendraMcmillan@gmail.com', 0),
('DM003', 'Devendra Massey', 'DevendraMassey', 'Libby Street58', '081332554058', '58000', 'DevendraMassey@gmail.com', 0),
('DP001', 'Devendra Porter', 'DevendraPorter', 'Gambler Lane44', '081332554044', '44000', 'DevendraPorter@gmail.com', 0),
('DP002', 'Devendra Phelps', 'DevendraPhelps', 'Hershell Hollow Road49', '081332554049', '49000', 'DevendraPhelps@gmail.com', 0),
('DR001', 'Devendra Riggs', 'DevendraRiggs', 'Dane Street41', '081332554041', '41000', 'DevendraRiggs@gmail.com', 0),
('DR002', 'Devendra Roberts', 'DevendraRoberts', 'Monroe Avenue45', '081332554045', '45000', 'DevendraRoberts@gmail.com', 0),
('DR003', 'Devendra Rhodes', 'DevendraRhodes', 'Lawman Avenue54', '081332554054', '54000', 'DevendraRhodes@gmail.com', 0),
('DW001', 'Devendra Willis', 'DevendraWillis', 'Bryan Avenue48', '081332554048', '48000', 'DevendraWillis@gmail.com', 0);

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
-- Table structure for table `sepeda`
--

CREATE TABLE `sepeda` (
  `id_sepeda` varchar(20) NOT NULL,
  `brand_sepeda` varchar(100) NOT NULL,
  `warna_sepeda` varchar(25) NOT NULL,
  `nomor_gerai` varchar(20) NOT NULL,
  `status_sepeda` varchar(100) NOT NULL DEFAULT 'Available',
  `quantity` int NOT NULL DEFAULT '0',
  `sepeda_delete` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sepeda`
--

INSERT INTO `sepeda` (`id_sepeda`, `brand_sepeda`, `warna_sepeda`, `nomor_gerai`, `status_sepeda`, `quantity`, `sepeda_delete`) VALUES
('SC001', 'Pacific', 'Biru', 'G0003', 'Available', 9, 0),
('SC002', 'Pacific', 'Kuning', 'G0004', 'Available', 8, 0),
('SC003', 'Pacific', 'Merah Maroon', 'G0005', 'Available', 7, 0),
('SP001', 'Polygon', 'Merah', 'G0001', 'Available', 7, 0),
('SP002', 'Polygon', 'Hijau', 'G0002', 'Available', 9, 0),
('SP003', 'Polygon', 'Hitam', 'G0003', 'Available', 6, 0),
('SP004', 'Polygon', 'Silver', 'G0004', 'Available', 9, 0),
('SW001', 'Wimcycle', 'Jingga', 'G0005', 'Available', 11, 0),
('SW002', 'Wimcycle', 'Putih', 'G0001', 'Available', 8, 0),
('SW003', 'Wimcycle', 'Abu-abu', 'G0002', 'Available', 6, 0);

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
  `sewa_delete` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi_sewa`
--

INSERT INTO `transaksi_sewa` (`id_sewa`, `id_sepeda`, `id_penyewa`, `harga_sewa`, `tglawal_sewa`, `jamawal_sewa`, `tglakhir_sewa`, `jamakhir_sewa`, `sewa_delete`) VALUES
('SEB1', 'SC001', 'AB001', 1000, '2021-07-01', '01:00:00', '2021-07-01', '02:00:00', 0),
('SEB10', 'SC002', 'AC004', 1000, '2021-07-01', '10:00:00', '2021-07-01', '11:00:00', 0),
('SEB100', 'SC003', 'DW001', 6000, '2021-07-06', '10:00:00', '2021-07-06', '16:00:00', 0),
('SEB11', 'SC002', 'AC005', 1000, '2021-07-01', '11:00:00', '2021-07-01', '12:00:00', 0),
('SEB12', 'SC002', 'AC006', 1000, '2021-07-01', '12:00:00', '2021-07-01', '13:00:00', 0),
('SEB13', 'SC002', 'AD001', 1000, '2021-07-01', '13:00:00', '2021-07-01', '14:00:00', 0),
('SEB14', 'SC002', 'AD002', 1000, '2021-07-01', '14:00:00', '2021-07-01', '15:00:00', 0),
('SEB15', 'SC002', 'AD003', 1000, '2021-07-01', '15:00:00', '2021-07-01', '16:00:00', 0),
('SEB16', 'SC002', 'AD004', 1000, '2021-07-01', '16:00:00', '2021-07-01', '17:00:00', 0),
('SEB17', 'SC002', 'AD005', 1000, '2021-07-01', '17:00:00', '2021-07-01', '18:00:00', 0),
('SEB18', 'SC003', 'AD006', 1000, '2021-07-01', '18:00:00', '2021-07-01', '19:00:00', 0),
('SEB19', 'SC003', 'AD007', 2000, '2021-07-02', '01:00:00', '2021-07-02', '03:00:00', 0),
('SEB2', 'SC001', 'AB002', 1000, '2021-07-01', '02:00:00', '2021-07-01', '03:00:00', 0),
('SEB20', 'SC003', 'AD008', 2000, '2021-07-02', '02:00:00', '2021-07-02', '04:00:00', 0),
('SEB21', 'SC003', 'AD009', 2000, '2021-07-02', '03:00:00', '2021-07-02', '05:00:00', 0),
('SEB22', 'SC003', 'AG001', 2000, '2021-07-02', '04:00:00', '2021-07-02', '06:00:00', 0),
('SEB23', 'SC003', 'AG002', 2000, '2021-07-02', '05:00:00', '2021-07-02', '07:00:00', 0),
('SEB24', 'SC003', 'AG003', 2000, '2021-07-02', '06:00:00', '2021-07-02', '08:00:00', 0),
('SEB25', 'SP001', 'AH001', 2000, '2021-07-02', '07:00:00', '2021-07-02', '09:00:00', 0),
('SEB26', 'SP001', 'AH002', 2000, '2021-07-02', '08:00:00', '2021-07-02', '10:00:00', 0),
('SEB27', 'SP001', 'AH003', 2000, '2021-07-02', '09:00:00', '2021-07-02', '11:00:00', 0),
('SEB28', 'SP001', 'AH004', 2000, '2021-07-02', '10:00:00', '2021-07-02', '12:00:00', 0),
('SEB29', 'SP001', 'AH005', 2000, '2021-07-02', '11:00:00', '2021-07-02', '13:00:00', 0),
('SEB3', 'SC001', 'AB003', 1000, '2021-07-01', '03:00:00', '2021-07-01', '04:00:00', 0),
('SEB30', 'SP001', 'AH006', 2000, '2021-07-02', '12:00:00', '2021-07-02', '14:00:00', 0),
('SEB31', 'SP001', 'AH007', 2000, '2021-07-02', '13:00:00', '2021-07-02', '15:00:00', 0),
('SEB32', 'SP002', 'AH008', 2000, '2021-07-02', '14:00:00', '2021-07-02', '16:00:00', 0),
('SEB33', 'SP002', 'AH009', 2000, '2021-07-02', '15:00:00', '2021-07-02', '17:00:00', 0),
('SEB34', 'SP002', 'AM001', 2000, '2021-07-02', '16:00:00', '2021-07-02', '18:00:00', 0),
('SEB35', 'SP002', 'AM002', 2000, '2021-07-02', '17:00:00', '2021-07-02', '19:00:00', 0),
('SEB36', 'SP002', 'AM003', 2000, '2021-07-02', '18:00:00', '2021-07-02', '20:00:00', 0),
('SEB37', 'SP002', 'AM004', 3000, '2021-07-03', '01:00:00', '2021-07-03', '04:00:00', 0),
('SEB38', 'SP002', 'AM005', 3000, '2021-07-03', '02:00:00', '2021-07-03', '05:00:00', 0),
('SEB39', 'SP002', 'AM006', 3000, '2021-07-03', '03:00:00', '2021-07-03', '06:00:00', 0),
('SEB4', 'SC001', 'AB004', 1000, '2021-07-01', '04:00:00', '2021-07-01', '05:00:00', 0),
('SEB40', 'SP002', 'AM007', 3000, '2021-07-03', '04:00:00', '2021-07-03', '07:00:00', 0),
('SEB41', 'SP003', 'AM008', 3000, '2021-07-03', '05:00:00', '2021-07-03', '08:00:00', 0),
('SEB42', 'SP003', 'AM009', 3000, '2021-07-03', '06:00:00', '2021-07-03', '09:00:00', 0),
('SEB43', 'SP003', 'AP001', 3000, '2021-07-03', '07:00:00', '2021-07-03', '10:00:00', 0),
('SEB44', 'SP003', 'AP002', 3000, '2021-07-03', '08:00:00', '2021-07-03', '11:00:00', 0),
('SEB45', 'SP003', 'AP003', 3000, '2021-07-03', '09:00:00', '2021-07-03', '12:00:00', 0),
('SEB46', 'SP003', 'AP004', 3000, '2021-07-03', '10:00:00', '2021-07-03', '13:00:00', 0),
('SEB47', 'SP004', 'AP005', 3000, '2021-07-03', '11:00:00', '2021-07-03', '14:00:00', 0),
('SEB48', 'SP004', 'AP006', 3000, '2021-07-03', '12:00:00', '2021-07-03', '15:00:00', 0),
('SEB49', 'SP004', 'AR001', 3000, '2021-07-03', '13:00:00', '2021-07-03', '16:00:00', 0),
('SEB5', 'SC001', 'AB005', 1000, '2021-07-01', '05:00:00', '2021-07-01', '06:00:00', 0),
('SEB50', 'SP004', 'AR002', 3000, '2021-07-03', '14:00:00', '2021-07-03', '17:00:00', 0),
('SEB51', 'SP004', 'AR003', 3000, '2021-07-03', '15:00:00', '2021-07-03', '18:00:00', 0),
('SEB52', 'SP004', 'AR004', 3000, '2021-07-03', '16:00:00', '2021-07-03', '19:00:00', 0),
('SEB53', 'SP004', 'AR005', 3000, '2021-07-03', '17:00:00', '2021-07-03', '20:00:00', 0),
('SEB54', 'SP004', 'AR006', 3000, '2021-07-03', '18:00:00', '2021-07-03', '21:00:00', 0),
('SEB55', 'SP004', 'AR007', 4000, '2021-07-04', '01:00:00', '2021-07-04', '05:00:00', 0),
('SEB56', 'SW001', 'AR008', 4000, '2021-07-04', '02:00:00', '2021-07-04', '06:00:00', 0),
('SEB57', 'SW001', 'AR009', 4000, '2021-07-04', '03:00:00', '2021-07-04', '07:00:00', 0),
('SEB58', 'SW001', 'AW001', 4000, '2021-07-04', '04:00:00', '2021-07-04', '08:00:00', 0),
('SEB59', 'SW001', 'AW002', 4000, '2021-07-04', '05:00:00', '2021-07-04', '09:00:00', 0),
('SEB6', 'SC001', 'AB006', 1000, '2021-07-01', '06:00:00', '2021-07-01', '07:00:00', 0),
('SEB60', 'SW001', 'AW003', 4000, '2021-07-04', '06:00:00', '2021-07-04', '10:00:00', 0),
('SEB61', 'SW001', 'CB001', 4000, '2021-07-04', '07:00:00', '2021-07-04', '11:00:00', 0),
('SEB62', 'SW001', 'CB002', 4000, '2021-07-04', '08:00:00', '2021-07-04', '12:00:00', 0),
('SEB63', 'SW001', 'CC001', 4000, '2021-07-04', '09:00:00', '2021-07-04', '13:00:00', 0),
('SEB64', 'SW001', 'CC002', 4000, '2021-07-04', '10:00:00', '2021-07-04', '14:00:00', 0),
('SEB65', 'SW001', 'CD001', 4000, '2021-07-04', '11:00:00', '2021-07-04', '15:00:00', 0),
('SEB66', 'SW001', 'CD002', 4000, '2021-07-04', '12:00:00', '2021-07-04', '16:00:00', 0),
('SEB67', 'SW002', 'CD003', 4000, '2021-07-04', '13:00:00', '2021-07-04', '17:00:00', 0),
('SEB68', 'SW002', 'CG001', 4000, '2021-07-04', '14:00:00', '2021-07-04', '18:00:00', 0),
('SEB69', 'SW002', 'CH001', 4000, '2021-07-04', '15:00:00', '2021-07-04', '19:00:00', 0),
('SEB7', 'SC001', 'AC001', 1000, '2021-07-01', '07:00:00', '2021-07-01', '08:00:00', 0),
('SEB70', 'SW002', 'CH002', 4000, '2021-07-04', '16:00:00', '2021-07-04', '20:00:00', 0),
('SEB71', 'SW002', 'CH003', 4000, '2021-07-04', '17:00:00', '2021-07-04', '21:00:00', 0),
('SEB72', 'SW002', 'CM001', 4000, '2021-07-04', '18:00:00', '2021-07-04', '22:00:00', 0),
('SEB73', 'SW002', 'CM002', 5000, '2021-07-05', '01:00:00', '2021-07-05', '06:00:00', 0),
('SEB74', 'SW002', 'CM003', 5000, '2021-07-05', '02:00:00', '2021-07-05', '07:00:00', 0),
('SEB75', 'SW003', 'CP001', 5000, '2021-07-05', '03:00:00', '2021-07-05', '08:00:00', 0),
('SEB76', 'SW003', 'CP002', 5000, '2021-07-05', '04:00:00', '2021-07-05', '09:00:00', 0),
('SEB77', 'SW003', 'CR001', 5000, '2021-07-05', '05:00:00', '2021-07-05', '10:00:00', 0),
('SEB78', 'SW003', 'CR002', 5000, '2021-07-05', '06:00:00', '2021-07-05', '11:00:00', 0),
('SEB79', 'SW003', 'CR003', 5000, '2021-07-05', '07:00:00', '2021-07-05', '12:00:00', 0),
('SEB8', 'SC001', 'AC002', 1000, '2021-07-01', '08:00:00', '2021-07-01', '09:00:00', 0),
('SEB80', 'SW003', 'CW001', 5000, '2021-07-05', '08:00:00', '2021-07-05', '13:00:00', 0),
('SEB81', 'SC001', 'DB001', 5000, '2021-07-05', '09:00:00', '2021-07-05', '14:00:00', 0),
('SEB82', 'SC001', 'DB002', 5000, '2021-07-05', '10:00:00', '2021-07-05', '15:00:00', 0),
('SEB83', 'SC001', 'DC001', 5000, '2021-07-05', '11:00:00', '2021-07-05', '16:00:00', 0),
('SEB84', 'SC001', 'DC002', 5000, '2021-07-05', '12:00:00', '2021-07-05', '17:00:00', 0),
('SEB85', 'SC001', 'DD001', 5000, '2021-07-05', '13:00:00', '2021-07-05', '18:00:00', 0),
('SEB86', 'SC001', 'DD002', 5000, '2021-07-05', '14:00:00', '2021-07-05', '19:00:00', 0),
('SEB87', 'SC001', 'DD003', 5000, '2021-07-05', '15:00:00', '2021-07-05', '20:00:00', 0),
('SEB88', 'SC001', 'DG001', 5000, '2021-07-05', '16:00:00', '2021-07-05', '21:00:00', 0),
('SEB89', 'SC001', 'DH001', 5000, '2021-07-05', '17:00:00', '2021-07-05', '22:00:00', 0),
('SEB9', 'SC001', 'AC003', 1000, '2021-07-01', '09:00:00', '2021-07-01', '10:00:00', 0),
('SEB90', 'SC002', 'DH002', 5000, '2021-07-05', '18:00:00', '2021-07-05', '23:00:00', 0),
('SEB91', 'SC002', 'DH003', 6000, '2021-07-06', '01:00:00', '2021-07-06', '07:00:00', 0),
('SEB92', 'SC002', 'DM001', 6000, '2021-07-06', '02:00:00', '2021-07-06', '08:00:00', 0),
('SEB93', 'SC002', 'DM002', 6000, '2021-07-06', '03:00:00', '2021-07-06', '09:00:00', 0),
('SEB94', 'SC002', 'DM003', 6000, '2021-07-06', '04:00:00', '2021-07-06', '10:00:00', 0),
('SEB95', 'SC002', 'DP001', 6000, '2021-07-06', '05:00:00', '2021-07-06', '11:00:00', 0),
('SEB96', 'SC002', 'DP002', 6000, '2021-07-06', '06:00:00', '2021-07-06', '12:00:00', 0),
('SEB97', 'SC002', 'DR001', 6000, '2021-07-06', '07:00:00', '2021-07-06', '13:00:00', 0),
('SEB98', 'SC003', 'DR002', 6000, '2021-07-06', '08:00:00', '2021-07-06', '14:00:00', 0),
('SEB99', 'SC003', 'DR003', 6000, '2021-07-06', '09:00:00', '2021-07-06', '15:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_topup`
--

CREATE TABLE `transaksi_topup` (
  `id_topup` varchar(20) NOT NULL,
  `id_penyewa` varchar(20) NOT NULL,
  `total_topup` int UNSIGNED NOT NULL,
  `tanggal_topup` datetime NOT NULL,
  `topup_delete` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi_topup`
--

INSERT INTO `transaksi_topup` (`id_topup`, `id_penyewa`, `total_topup`, `tanggal_topup`, `topup_delete`) VALUES
('TU1', 'AB001', 10000, '2021-07-01 00:00:00', 0),
('TU10', 'AC004', 10000, '2021-07-01 00:00:00', 0),
('TU100', 'DW001', 50000, '2021-07-05 00:00:00', 0),
('TU11', 'AC005', 20000, '2021-07-02 00:00:00', 0),
('TU12', 'AC006', 20000, '2021-07-02 00:00:00', 0),
('TU13', 'AD001', 20000, '2021-07-02 00:00:00', 0),
('TU14', 'AD002', 20000, '2021-07-02 00:00:00', 0),
('TU15', 'AD003', 20000, '2021-07-02 00:00:00', 0),
('TU16', 'AD004', 20000, '2021-07-02 00:00:00', 0),
('TU17', 'AD005', 20000, '2021-07-02 00:00:00', 0),
('TU18', 'AD006', 20000, '2021-07-02 00:00:00', 0),
('TU19', 'AD007', 20000, '2021-07-02 00:00:00', 0),
('TU2', 'AB002', 10000, '2021-07-01 00:00:00', 0),
('TU20', 'AD008', 20000, '2021-07-02 00:00:00', 0),
('TU21', 'AD009', 30000, '2021-07-03 00:00:00', 0),
('TU22', 'AG001', 30000, '2021-07-03 00:00:00', 0),
('TU23', 'AG002', 30000, '2021-07-03 00:00:00', 0),
('TU24', 'AG003', 30000, '2021-07-03 00:00:00', 0),
('TU25', 'AH001', 30000, '2021-07-03 00:00:00', 0),
('TU26', 'AH002', 30000, '2021-07-03 00:00:00', 0),
('TU27', 'AH003', 30000, '2021-07-03 00:00:00', 0),
('TU28', 'AH004', 30000, '2021-07-03 00:00:00', 0),
('TU29', 'AH005', 30000, '2021-07-03 00:00:00', 0),
('TU3', 'AB003', 10000, '2021-07-01 00:00:00', 0),
('TU30', 'AH006', 30000, '2021-07-03 00:00:00', 0),
('TU31', 'AH007', 30000, '2021-07-03 00:00:00', 0),
('TU32', 'AH008', 30000, '2021-07-03 00:00:00', 0),
('TU33', 'AH009', 30000, '2021-07-03 00:00:00', 0),
('TU34', 'AM001', 30000, '2021-07-03 00:00:00', 0),
('TU35', 'AM002', 30000, '2021-07-03 00:00:00', 0),
('TU36', 'AM003', 30000, '2021-07-03 00:00:00', 0),
('TU37', 'AM004', 30000, '2021-07-03 00:00:00', 0),
('TU38', 'AM005', 30000, '2021-07-03 00:00:00', 0),
('TU39', 'AM006', 30000, '2021-07-03 00:00:00', 0),
('TU4', 'AB004', 10000, '2021-07-01 00:00:00', 0),
('TU40', 'AM007', 30000, '2021-07-03 00:00:00', 0),
('TU41', 'AM008', 30000, '2021-07-03 00:00:00', 0),
('TU42', 'AM009', 30000, '2021-07-03 00:00:00', 0),
('TU43', 'AP001', 30000, '2021-07-03 00:00:00', 0),
('TU44', 'AP002', 30000, '2021-07-03 00:00:00', 0),
('TU45', 'AP003', 30000, '2021-07-03 00:00:00', 0),
('TU46', 'AP004', 30000, '2021-07-03 00:00:00', 0),
('TU47', 'AP005', 30000, '2021-07-03 00:00:00', 0),
('TU48', 'AP006', 30000, '2021-07-03 00:00:00', 0),
('TU49', 'AR001', 30000, '2021-07-03 00:00:00', 0),
('TU5', 'AB005', 10000, '2021-07-01 00:00:00', 0),
('TU50', 'AR002', 30000, '2021-07-03 00:00:00', 0),
('TU51', 'AR003', 40000, '2021-07-04 00:00:00', 0),
('TU52', 'AR004', 40000, '2021-07-04 00:00:00', 0),
('TU53', 'AR005', 40000, '2021-07-04 00:00:00', 0),
('TU54', 'AR006', 40000, '2021-07-04 00:00:00', 0),
('TU55', 'AR007', 40000, '2021-07-04 00:00:00', 0),
('TU56', 'AR008', 40000, '2021-07-04 00:00:00', 0),
('TU57', 'AR009', 40000, '2021-07-04 00:00:00', 0),
('TU58', 'AW001', 40000, '2021-07-04 00:00:00', 0),
('TU59', 'AW002', 40000, '2021-07-04 00:00:00', 0),
('TU6', 'AB006', 10000, '2021-07-01 00:00:00', 0),
('TU60', 'AW003', 40000, '2021-07-04 00:00:00', 0),
('TU61', 'CB001', 40000, '2021-07-04 00:00:00', 0),
('TU62', 'CB002', 40000, '2021-07-04 00:00:00', 0),
('TU63', 'CC001', 40000, '2021-07-04 00:00:00', 0),
('TU64', 'CC002', 40000, '2021-07-04 00:00:00', 0),
('TU65', 'CD001', 40000, '2021-07-04 00:00:00', 0),
('TU66', 'CD002', 40000, '2021-07-04 00:00:00', 0),
('TU67', 'CD003', 40000, '2021-07-04 00:00:00', 0),
('TU68', 'CG001', 40000, '2021-07-04 00:00:00', 0),
('TU69', 'CH001', 40000, '2021-07-04 00:00:00', 0),
('TU7', 'AC001', 10000, '2021-07-01 00:00:00', 0),
('TU70', 'CH002', 40000, '2021-07-04 00:00:00', 0),
('TU71', 'CH003', 50000, '2021-07-05 00:00:00', 0),
('TU72', 'CM001', 50000, '2021-07-05 00:00:00', 0),
('TU73', 'CM002', 50000, '2021-07-05 00:00:00', 0),
('TU74', 'CM003', 50000, '2021-07-05 00:00:00', 0),
('TU75', 'CP001', 50000, '2021-07-05 00:00:00', 0),
('TU76', 'CP002', 50000, '2021-07-05 00:00:00', 0),
('TU77', 'CR001', 50000, '2021-07-05 00:00:00', 0),
('TU78', 'CR002', 50000, '2021-07-05 00:00:00', 0),
('TU79', 'CR003', 50000, '2021-07-05 00:00:00', 0),
('TU8', 'AC002', 10000, '2021-07-01 00:00:00', 0),
('TU80', 'CW001', 50000, '2021-07-05 00:00:00', 0),
('TU81', 'DB001', 50000, '2021-07-05 00:00:00', 0),
('TU82', 'DB002', 50000, '2021-07-05 00:00:00', 0),
('TU83', 'DC001', 50000, '2021-07-05 00:00:00', 0),
('TU84', 'DC002', 50000, '2021-07-05 00:00:00', 0),
('TU85', 'DD001', 50000, '2021-07-05 00:00:00', 0),
('TU86', 'DD002', 50000, '2021-07-05 00:00:00', 0),
('TU87', 'DD003', 50000, '2021-07-05 00:00:00', 0),
('TU88', 'DG001', 50000, '2021-07-05 00:00:00', 0),
('TU89', 'DH001', 50000, '2021-07-05 00:00:00', 0),
('TU9', 'AC003', 10000, '2021-07-01 00:00:00', 0),
('TU90', 'DH002', 50000, '2021-07-05 00:00:00', 0),
('TU91', 'DH003', 50000, '2021-07-05 00:00:00', 0),
('TU92', 'DM001', 50000, '2021-07-05 00:00:00', 0),
('TU93', 'DM002', 50000, '2021-07-05 00:00:00', 0),
('TU94', 'DM003', 50000, '2021-07-05 00:00:00', 0),
('TU95', 'DP001', 50000, '2021-07-05 00:00:00', 0),
('TU96', 'DP002', 50000, '2021-07-05 00:00:00', 0),
('TU97', 'DR001', 50000, '2021-07-05 00:00:00', 0),
('TU98', 'DR002', 50000, '2021-07-05 00:00:00', 0),
('TU99', 'DR003', 50000, '2021-07-05 00:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gerai_sepeda`
--
ALTER TABLE `gerai_sepeda`
  ADD PRIMARY KEY (`nomor_gerai`);

--
-- Indexes for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`id_penyewa`);

--
-- Indexes for table `sepeda`
--
ALTER TABLE `sepeda`
  ADD PRIMARY KEY (`id_sepeda`);

--
-- Indexes for table `transaksi_sewa`
--
ALTER TABLE `transaksi_sewa`
  ADD PRIMARY KEY (`id_sewa`);

--
-- Indexes for table `transaksi_topup`
--
ALTER TABLE `transaksi_topup`
  ADD PRIMARY KEY (`id_topup`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
