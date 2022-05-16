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
-- Database: `DW_AGUS_OLTP3`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`student`@`%` PROCEDURE `NewPenyewa` (IN `Nama` VARCHAR(50), IN `Username` VARCHAR(25), IN `Alamat` VARCHAR(200), IN `Phone` VARCHAR(15), IN `Email` VARCHAR(200))  NO SQL
insert into `penyewa`(`NAMA_PENYEWA`, `USERNAME_PENYEWA`, `ALAMAT_PENYEWA`, `TELP_PENYEWA`, `EMAIL_ADDRESS`)
values (Nama, Username, Alamat, Phone, Email)$$

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
('F0001', 'Bronze Bike', 'Jalan Jambi no 5', '0812453936482', 0),
('F0002', 'Ender Bike', 'Jalan Kupang 10', '0812428734t723', 0),
('F0003', 'Redstone Bike', 'Jalan Tiamat 15', '0819028349354', 0),
('F0004', 'Cobble Bike', 'Jalan Shinobu 20', '0812429352365', 0),
('F0005', 'Bedrock Bike', 'Jalan Fallin 25', '0814936082435', 0);

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
('DA001', 'Daniel Andrews', 'DanielAndrews', 'Jenna Lane28', '085745665428', '28000', 'DanielAndrews@gmail.com', 0),
('DA002', 'Daniel Adams', 'DanielAdams', 'Morningview Lane38', '085745665438', '38000', 'DanielAdams@gmail.com', 0),
('DB001', 'Daniel Burns', 'DanielBurns', 'Elsie Drive33', '085745665433', '33000', 'DanielBurns@gmail.com', 0),
('DC001', 'Daniel Castillo', 'DanielCastillo', ' Abia Martin Drive32', '085745665432', '32000', 'DanielCastillo@gmail.com', 0),
('DD001', 'Daniel Dixon', 'DanielDixon', 'Richards Avenue37', '085745665437', '37000', 'DanielDixon@gmail.com', 0),
('DE001', 'Daniel Edwards', 'DanielEdwards', 'Crim Lane34', '085745665434', '34000', 'DanielEdwards@gmail.com', 0),
('DG001', 'Daniel Graham', 'DanielGraham', 'Holt Street22', '085745665422', '22000', 'DanielGraham@gmail.com', 0),
('DG002', 'Daniel Gardner', 'DanielGardner', 'Duff Avenue30', '085745665430', '30000', 'DanielGardner@gmail.com', 0),
('DG003', 'Daniel Grantt', 'DanielGrantt', 'Aviation Way35', '085745665435', '35000', 'DanielGrantt@gmail.com', 0),
('DH001', 'Daniel Henderson', 'DanielHenderson', 'Perine Street23', '085745665423', '23000', 'DanielHenderson@gmail.com', 0),
('DJ001', 'Daniel Jenkins', 'DanielJenkins', 'Charmaine Lane31', '085745665431', '31000', 'DanielJenkins@gmail.com', 0),
('DM001', 'Daniel Morgan', 'DanielMorgan', 'Broaddus Avenue25', '085745665425', '25000', 'DanielMorgan@gmail.com', 0),
('DM002', 'Daniel Mason', 'DanielMason', 'Callison Lane26', '085745665426', '26000', 'DanielMason@gmail.com', 0),
('DN001', 'Daniel Nelson', 'DanielNelson', 'Franklee Lane40', '085745665440', '40000', 'DanielNelson@gmail.com', 0),
('DR001', 'Daniel Russell', 'DanielRussell', 'Hill Haven Drive36', '085745665436', '36000', 'DanielRussell@gmail.com', 0),
('DR002', 'Daniel Rogers', 'DanielRogers', 'Hoffman Avenue39', '085745665439', '39000', 'DanielRogers@gmail.com', 0),
('DS001', 'Daniel Sullivan', 'DanielSullivan', 'Beechwood Avenue27', '085745665427', '27000', 'DanielSullivan@gmail.com', 0),
('DS002', 'Daniel Spencer', 'DanielSpencer', 'Harley Brook Lane29', '085745665429', '29000', 'DanielSpencer@gmail.com', 0),
('DW001', 'Daniel Warren', 'DanielWarren', 'Candlelight Drive21', '085745665421', '21000', 'DanielWarren@gmail.com', 0),
('DW002', 'Daniel Walker', 'DanielWalker', 'Bird Spring Lane24', '085745665424', '24000', 'DanielWalker@gmail.com', 0),
('GA001', 'Gerald Andrews', 'GeraldAndrews', 'Jenna Lane88', '085745665488', '88000', 'GeraldAndrews@gmail.com', 0),
('GA002', 'Gerald Adams', 'GeraldAdams', 'Morningview Lane98', '085745665498', '98000', 'GeraldAdams@gmail.com', 0),
('GB001', 'Gerald Burns', 'GeraldBurns', 'Elsie Drive93', '085745665493', '93000', 'GeraldBurns@gmail.com', 0),
('GC001', 'Gerald Castillo', 'GeraldCastillo', ' Abia Martin Drive92', '085745665492', '92000', 'GeraldCastillo@gmail.com', 0),
('GD001', 'Gerald Dixon', 'GeraldDixon', 'Richards Avenue97', '085745665497', '97000', 'GeraldDixon@gmail.com', 0),
('GE001', 'Gerald Edwards', 'GeraldEdwards', 'Crim Lane94', '085745665494', '94000', 'GeraldEdwards@gmail.com', 0),
('GG001', 'Gerald Graham', 'GeraldGraham', 'Holt Street82', '085745665482', '82000', 'GeraldGraham@gmail.com', 0),
('GG002', 'Gerald Gardner', 'GeraldGardner', 'Duff Avenue90', '085745665490', '90000', 'GeraldGardner@gmail.com', 0),
('GG003', 'Gerald Grantt', 'GeraldGrantt', 'Aviation Way95', '085745665495', '95000', 'GeraldGrantt@gmail.com', 0),
('GH001', 'Gerald Henderson', 'GeraldHenderson', 'Perine Street83', '085745665483', '83000', 'GeraldHenderson@gmail.com', 0),
('GJ001', 'Gerald Jenkins', 'GeraldJenkins', 'Charmaine Lane91', '085745665491', '91000', 'GeraldJenkins@gmail.com', 0),
('GM001', 'Gerald Morgan', 'GeraldMorgan', 'Broaddus Avenue85', '085745665485', '85000', 'GeraldMorgan@gmail.com', 0),
('GM002', 'Gerald Mason', 'GeraldMason', 'Callison Lane86', '085745665486', '86000', 'GeraldMason@gmail.com', 0),
('GN001', 'Gerald Nelson', 'GeraldNelson', 'Franklee Lane100', '085745665100', '100000', 'GeraldNelson@gmail.com', 0),
('GR001', 'Gerald Russell', 'GeraldRussell', 'Hill Haven Drive96', '085745665496', '96000', 'GeraldRussell@gmail.com', 0),
('GR002', 'Gerald Rogers', 'GeraldRogers', 'Hoffman Avenue99', '085745665499', '99000', 'GeraldRogers@gmail.com', 0),
('GS001', 'Gerald Sullivan', 'GeraldSullivan', 'Beechwood Avenue87', '085745665487', '87000', 'GeraldSullivan@gmail.com', 0),
('GS002', 'Gerald Spencer', 'GeraldSpencer', 'Harley Brook Lane89', '085745665489', '89000', 'GeraldSpencer@gmail.com', 0),
('GW001', 'Gerald Warren', 'GeraldWarren', 'Candlelight Drive81', '085745665481', '81000', 'GeraldWarren@gmail.com', 0),
('GW002', 'Gerald Walker', 'GeraldWalker', 'Bird Spring Lane84', '085745665484', '84000', 'GeraldWalker@gmail.com', 0),
('JA001', 'James Andrews', 'JamesAndrews', 'Jenna Lane68', '085745665468', '68000', 'JamesAndrews@gmail.com', 0),
('JA002', 'James Adams', 'JamesAdams', 'Morningview Lane78', '085745665478', '78000', 'JamesAdams@gmail.com', 0),
('JB001', 'James Burns', 'JamesBurns', 'Elsie Drive73', '085745665473', '73000', 'JamesBurns@gmail.com', 0),
('JC001', 'James Castillo', 'JamesCastillo', ' Abia Martin Drive72', '085745665472', '72000', 'JamesCastillo@gmail.com', 0),
('JD001', 'James Dixon', 'JamesDixon', 'Richards Avenue77', '085745665477', '77000', 'JamesDixon@gmail.com', 0),
('JE001', 'James Edwards', 'JamesEdwards', 'Crim Lane74', '085745665474', '74000', 'JamesEdwards@gmail.com', 0),
('JG001', 'James Graham', 'JamesGraham', 'Holt Street62', '085745665462', '62000', 'JamesGraham@gmail.com', 0),
('JG002', 'James Gardner', 'JamesGardner', 'Duff Avenue70', '085745665470', '70000', 'JamesGardner@gmail.com', 0),
('JG003', 'James Grantt', 'JamesGrantt', 'Aviation Way75', '085745665475', '75000', 'JamesGrantt@gmail.com', 0),
('JH001', 'James Henderson', 'JamesHenderson', 'Perine Street63', '085745665463', '63000', 'JamesHenderson@gmail.com', 0),
('JJ001', 'James Jenkins', 'JamesJenkins', 'Charmaine Lane71', '085745665471', '71000', 'JamesJenkins@gmail.com', 0),
('JM001', 'James Morgan', 'JamesMorgan', 'Broaddus Avenue65', '085745665465', '65000', 'JamesMorgan@gmail.com', 0),
('JM002', 'James Mason', 'JamesMason', 'Callison Lane66', '085745665466', '66000', 'JamesMason@gmail.com', 0),
('JN001', 'James Nelson', 'JamesNelson', 'Franklee Lane80', '085745665480', '80000', 'JamesNelson@gmail.com', 0),
('JR001', 'James Russell', 'JamesRussell', 'Hill Haven Drive76', '085745665476', '76000', 'JamesRussell@gmail.com', 0),
('JR002', 'James Rogers', 'JamesRogers', 'Hoffman Avenue79', '085745665479', '79000', 'JamesRogers@gmail.com', 0),
('JS001', 'James Sullivan', 'JamesSullivan', 'Beechwood Avenue67', '085745665467', '67000', 'JamesSullivan@gmail.com', 0),
('JS002', 'James Spencer', 'JamesSpencer', 'Harley Brook Lane69', '085745665469', '69000', 'JamesSpencer@gmail.com', 0),
('JW001', 'James Warren', 'JamesWarren', 'Candlelight Drive61', '085745665461', '61000', 'JamesWarren@gmail.com', 0),
('JW002', 'James Walker', 'JamesWalker', 'Bird Spring Lane64', '085745665464', '64000', 'JamesWalker@gmail.com', 0),
('KA001', 'Kevin Andrews', 'KevinAndrews', 'Jenna Lane8', '085745665408', '8000', 'KevinAndrews@gmail.com', 0),
('KA002', 'Kevin Adams', 'KevinAdams', 'Morningview Lane18', '085745665418', '18000', 'KevinAdams@gmail.com', 0),
('KA003', 'Kopid Andrews', 'KopidAndrews', 'Jenna Lane48', '085745665448', '48000', 'KopidAndrews@gmail.com', 0),
('KA004', 'Kopid Adams', 'KopidAdams', 'Morningview Lane58', '085745665458', '58000', 'KopidAdams@gmail.com', 0),
('KB001', 'Kevin Burns', 'KevinBurns', 'Elsie Drive13', '085745665413', '13000', 'KevinBurns@gmail.com', 0),
('KB002', 'Kopid Burns', 'KopidBurns', 'Elsie Drive53', '085745665453', '53000', 'KopidBurns@gmail.com', 0),
('KC001', 'Kevin Castillo', 'KevinCastillo', ' Abia Martin Drive12', '085745665412', '12000', 'KevinCastillo@gmail.com', 0),
('KC002', 'Kopid Castillo', 'KopidCastillo', ' Abia Martin Drive52', '085745665452', '52000', 'KopidCastillo@gmail.com', 0),
('KD001', 'Kevin Dixon', 'KevinDixon', 'Richards Avenue17', '085745665417', '17000', 'KevinDixon@gmail.com', 0),
('KD002', 'Kopid Dixon', 'KopidDixon', 'Richards Avenue57', '085745665457', '57000', 'KopidDixon@gmail.com', 0),
('KE001', 'Kevin Edwards', 'KevinEdwards', 'Crim Lane14', '085745665414', '14000', 'KevinEdwards@gmail.com', 0),
('KE002', 'Kopid Edwards', 'KopidEdwards', 'Crim Lane54', '085745665454', '54000', 'KopidEdwards@gmail.com', 0),
('KG001', 'Kevin Graham', 'KevinGraham', 'Holt Street2', '085745665402', '2000', 'KevinGraham@gmail.com', 0),
('KG002', 'Kevin Gardner', 'KevinGardner', 'Duff Avenue10', '085745665410', '10000', 'KevinGardner@gmail.com', 0),
('KG003', 'Kevin Grantt', 'KevinGrantt', 'Aviation Way15', '085745665415', '15000', 'KevinGrantt@gmail.com', 0),
('KG004', 'Kopid Graham', 'KopidGraham', 'Holt Street42', '085745665442', '42000', 'KopidGraham@gmail.com', 0),
('KG005', 'Kopid Gardner', 'KopidGardner', 'Duff Avenue50', '085745665450', '50000', 'KopidGardner@gmail.com', 0),
('KG006', 'Kopid Grantt', 'KopidGrantt', 'Aviation Way55', '085745665455', '55000', 'KopidGrantt@gmail.com', 0),
('KH001', 'Kevin Henderson', 'KevinHenderson', 'Perine Street3', '085745665403', '3000', 'KevinHenderson@gmail.com', 0),
('KH002', 'Kopid Henderson', 'KopidHenderson', 'Perine Street43', '085745665443', '43000', 'KopidHenderson@gmail.com', 0),
('KJ001', 'Kevin Jenkins', 'KevinJenkins', 'Charmaine Lane11', '085745665411', '11000', 'KevinJenkins@gmail.com', 0),
('KJ002', 'Kopid Jenkins', 'KopidJenkins', 'Charmaine Lane51', '085745665451', '51000', 'KopidJenkins@gmail.com', 0),
('KM001', 'Kevin Morgan', 'KevinMorgan', 'Broaddus Avenue5', '085745665405', '5000', 'KevinMorgan@gmail.com', 0),
('KM002', 'Kevin Mason', 'KevinMason', 'Callison Lane6', '085745665406', '6000', 'KevinMason@gmail.com', 0),
('KM003', 'Kopid Morgan', 'KopidMorgan', 'Broaddus Avenue45', '085745665445', '45000', 'KopidMorgan@gmail.com', 0),
('KM004', 'Kopid Mason', 'KopidMason', 'Callison Lane46', '085745665446', '46000', 'KopidMason@gmail.com', 0),
('KN001', 'Kevin Nelson', 'KevinNelson', 'Franklee Lane20', '085745665420', '20000', 'KevinNelson@gmail.com', 0),
('KN002', 'Kopid Nelson', 'KopidNelson', 'Franklee Lane60', '085745665460', '60000', 'KopidNelson@gmail.com', 0),
('KR001', 'Kevin Russell', 'KevinRussell', 'Hill Haven Drive16', '085745665416', '16000', 'KevinRussell@gmail.com', 0),
('KR002', 'Kevin Rogers', 'KevinRogers', 'Hoffman Avenue19', '085745665419', '19000', 'KevinRogers@gmail.com', 0),
('KR003', 'Kopid Russell', 'KopidRussell', 'Hill Haven Drive56', '085745665456', '56000', 'KopidRussell@gmail.com', 0),
('KR004', 'Kopid Rogers', 'KopidRogers', 'Hoffman Avenue59', '085745665459', '59000', 'KopidRogers@gmail.com', 0),
('KS001', 'Kevin Sullivan', 'KevinSullivan', 'Beechwood Avenue7', '085745665407', '7000', 'KevinSullivan@gmail.com', 0),
('KS002', 'Kevin Spencer', 'KevinSpencer', 'Harley Brook Lane9', '085745665409', '9000', 'KevinSpencer@gmail.com', 0),
('KS003', 'Kopid Sullivan', 'KopidSullivan', 'Beechwood Avenue47', '085745665447', '47000', 'KopidSullivan@gmail.com', 0),
('KS004', 'Kopid Spencer', 'KopidSpencer', 'Harley Brook Lane49', '085745665449', '49000', 'KopidSpencer@gmail.com', 0),
('KW001', 'Kevin Warren', 'KevinWarren', 'Candlelight Drive1', '085745665401', '1000', 'KevinWarren@gmail.com', 0),
('KW002', 'Kevin Walker', 'KevinWalker', 'Bird Spring Lane4', '085745665404', '4000', 'KevinWalker@gmail.com', 0),
('KW003', 'Kopid Warren', 'KopidWarren', 'Candlelight Drive41', '085745665441', '41000', 'KopidWarren@gmail.com', 0),
('KW004', 'Kopid Walker', 'KopidWalker', 'Bird Spring Lane44', '085745665444', '44000', 'KopidWalker@gmail.com', 0);

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
('SD001', 'United', 'Kuning', 'F0001', 'Available', 13, 0),
('SD002', 'United', 'Merah', 'F0002', 'Available', 9, 0),
('SL001', 'Polygon', 'Hitam', 'F0003', 'Available', 10, 0),
('SL002', 'Polygon', 'Hijau', 'F0004', 'Available', 10, 0),
('SL003', 'Polygon', 'Cokelat', 'F0004', 'Available', 15, 0),
('SL004', 'Polygon ', 'Putih', 'F0005', 'Available', 13, 0),
('SM001', 'Wimcycle', 'Putih', 'F0005', 'Available', 7, 0),
('SM002', 'Wimcycle', 'Cokelat', 'F0001', 'Available', 8, 0),
('SM003', 'Wimcycle', 'Hitam', 'F0002', 'Available', 11, 0),
('SM004', 'Wimcycle', 'Biru', 'F0003', 'Available', 12, 0);

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
('SEN1', 'SC001', 'DA001', 1000, '2021-07-01', '01:00:00', '2021-07-01', '02:00:00', 0),
('SEN10', 'SC001', 'DH001', 1000, '2021-07-01', '10:00:00', '2021-07-01', '11:00:00', 0),
('SEN100', 'SM004', 'KW004', 6000, '2021-07-06', '10:00:00', '2021-07-06', '16:00:00', 0),
('SEN11', 'SC001', 'DJ001', 1000, '2021-07-01', '11:00:00', '2021-07-01', '12:00:00', 0),
('SEN12', 'SC001', 'DM001', 1000, '2021-07-01', '12:00:00', '2021-07-01', '13:00:00', 0),
('SEN13', 'SC001', 'DM002', 1000, '2021-07-01', '13:00:00', '2021-07-01', '14:00:00', 0),
('SEN14', 'SD002', 'DN001', 1000, '2021-07-01', '14:00:00', '2021-07-01', '15:00:00', 0),
('SEN15', 'SD002', 'DR001', 1000, '2021-07-01', '15:00:00', '2021-07-01', '16:00:00', 0),
('SEN16', 'SD002', 'DR002', 1000, '2021-07-01', '16:00:00', '2021-07-01', '17:00:00', 0),
('SEN17', 'SD002', 'DS001', 1000, '2021-07-01', '17:00:00', '2021-07-01', '18:00:00', 0),
('SEN18', 'SD002', 'DS002', 1000, '2021-07-01', '18:00:00', '2021-07-01', '19:00:00', 0),
('SEN19', 'SD002', 'DW001', 2000, '2021-07-02', '01:00:00', '2021-07-02', '03:00:00', 0),
('SEN2', 'SC001', 'DA002', 1000, '2021-07-01', '02:00:00', '2021-07-01', '03:00:00', 0),
('SEN20', 'SD002', 'DW002', 2000, '2021-07-02', '02:00:00', '2021-07-02', '04:00:00', 0),
('SEN21', 'SD002', 'GA001', 2000, '2021-07-02', '03:00:00', '2021-07-02', '05:00:00', 0),
('SEN22', 'SD002', 'GA002', 2000, '2021-07-02', '04:00:00', '2021-07-02', '06:00:00', 0),
('SEN23', 'SL001', 'GB001', 2000, '2021-07-02', '05:00:00', '2021-07-02', '07:00:00', 0),
('SEN24', 'SL001', 'GC001', 2000, '2021-07-02', '06:00:00', '2021-07-02', '08:00:00', 0),
('SEN25', 'SL001', 'GD001', 2000, '2021-07-02', '07:00:00', '2021-07-02', '09:00:00', 0),
('SEN26', 'SL001', 'GE001', 2000, '2021-07-02', '08:00:00', '2021-07-02', '10:00:00', 0),
('SEN27', 'SL001', 'GG001', 2000, '2021-07-02', '09:00:00', '2021-07-02', '11:00:00', 0),
('SEN28', 'SL001', 'GG002', 2000, '2021-07-02', '10:00:00', '2021-07-02', '12:00:00', 0),
('SEN29', 'SL001', 'GG003', 2000, '2021-07-02', '11:00:00', '2021-07-02', '13:00:00', 0),
('SEN3', 'SC001', 'DB001', 1000, '2021-07-01', '03:00:00', '2021-07-01', '04:00:00', 0),
('SEN30', 'SL001', 'GH001', 2000, '2021-07-02', '12:00:00', '2021-07-02', '14:00:00', 0),
('SEN31', 'SL001', 'GJ001', 2000, '2021-07-02', '13:00:00', '2021-07-02', '15:00:00', 0),
('SEN32', 'SL001', 'GM001', 2000, '2021-07-02', '14:00:00', '2021-07-02', '16:00:00', 0),
('SEN33', 'SL002', 'GM002', 2000, '2021-07-02', '15:00:00', '2021-07-02', '17:00:00', 0),
('SEN34', 'SL002', 'GN001', 2000, '2021-07-02', '16:00:00', '2021-07-02', '18:00:00', 0),
('SEN35', 'SL002', 'GR001', 2000, '2021-07-02', '17:00:00', '2021-07-02', '19:00:00', 0),
('SEN36', 'SL002', 'GR002', 2000, '2021-07-02', '18:00:00', '2021-07-02', '20:00:00', 0),
('SEN37', 'SL002', 'GS001', 3000, '2021-07-03', '01:00:00', '2021-07-03', '04:00:00', 0),
('SEN38', 'SL002', 'GS002', 3000, '2021-07-03', '02:00:00', '2021-07-03', '05:00:00', 0),
('SEN39', 'SL002', 'GW001', 3000, '2021-07-03', '03:00:00', '2021-07-03', '06:00:00', 0),
('SEN4', 'SC001', 'DC001', 1000, '2021-07-01', '04:00:00', '2021-07-01', '05:00:00', 0),
('SEN40', 'SL002', 'GW002', 3000, '2021-07-03', '04:00:00', '2021-07-03', '07:00:00', 0),
('SEN41', 'SL002', 'JA001', 3000, '2021-07-03', '05:00:00', '2021-07-03', '08:00:00', 0),
('SEN42', 'SL002', 'JA002', 3000, '2021-07-03', '06:00:00', '2021-07-03', '09:00:00', 0),
('SEN43', 'SL003', 'JB001', 3000, '2021-07-03', '07:00:00', '2021-07-03', '10:00:00', 0),
('SEN44', 'SL003', 'JC001', 3000, '2021-07-03', '08:00:00', '2021-07-03', '11:00:00', 0),
('SEN45', 'SL003', 'JD001', 3000, '2021-07-03', '09:00:00', '2021-07-03', '12:00:00', 0),
('SEN46', 'SL003', 'JE001', 3000, '2021-07-03', '10:00:00', '2021-07-03', '13:00:00', 0),
('SEN47', 'SL003', 'JG001', 3000, '2021-07-03', '11:00:00', '2021-07-03', '14:00:00', 0),
('SEN48', 'SL003', 'JG002', 3000, '2021-07-03', '12:00:00', '2021-07-03', '15:00:00', 0),
('SEN49', 'SL003', 'JG003', 3000, '2021-07-03', '13:00:00', '2021-07-03', '16:00:00', 0),
('SEN5', 'SC001', 'DD001', 1000, '2021-07-01', '05:00:00', '2021-07-01', '06:00:00', 0),
('SEN50', 'SL003', 'JH001', 3000, '2021-07-03', '14:00:00', '2021-07-03', '17:00:00', 0),
('SEN51', 'SL003', 'JJ001', 3000, '2021-07-03', '15:00:00', '2021-07-03', '18:00:00', 0),
('SEN52', 'SL003', 'JM001', 3000, '2021-07-03', '16:00:00', '2021-07-03', '19:00:00', 0),
('SEN53', 'SL003', 'JM002', 3000, '2021-07-03', '17:00:00', '2021-07-03', '20:00:00', 0),
('SEN54', 'SL003', 'JN001', 3000, '2021-07-03', '18:00:00', '2021-07-03', '21:00:00', 0),
('SEN55', 'SL003', 'JR001', 4000, '2021-07-04', '01:00:00', '2021-07-04', '05:00:00', 0),
('SEN56', 'SL003', 'JR002', 4000, '2021-07-04', '02:00:00', '2021-07-04', '06:00:00', 0),
('SEN57', 'SL003', 'JS001', 4000, '2021-07-04', '03:00:00', '2021-07-04', '07:00:00', 0),
('SEN58', 'SL004', 'JS002', 4000, '2021-07-04', '04:00:00', '2021-07-04', '08:00:00', 0),
('SEN59', 'SL004', 'JW001', 4000, '2021-07-04', '05:00:00', '2021-07-04', '09:00:00', 0),
('SEN6', 'SC001', 'DE001', 1000, '2021-07-01', '06:00:00', '2021-07-01', '07:00:00', 0),
('SEN60', 'SL004', 'JW002', 4000, '2021-07-04', '06:00:00', '2021-07-04', '10:00:00', 0),
('SEN61', 'SL004', 'KA001', 4000, '2021-07-04', '07:00:00', '2021-07-04', '11:00:00', 0),
('SEN62', 'SL004', 'KA002', 4000, '2021-07-04', '08:00:00', '2021-07-04', '12:00:00', 0),
('SEN63', 'SL004', 'KA003', 4000, '2021-07-04', '09:00:00', '2021-07-04', '13:00:00', 0),
('SEN64', 'SL004', 'KA004', 4000, '2021-07-04', '10:00:00', '2021-07-04', '14:00:00', 0),
('SEN65', 'SL004', 'KB001', 4000, '2021-07-04', '11:00:00', '2021-07-04', '15:00:00', 0),
('SEN66', 'SL004', 'KB002', 4000, '2021-07-04', '12:00:00', '2021-07-04', '16:00:00', 0),
('SEN67', 'SL004', 'KC001', 4000, '2021-07-04', '13:00:00', '2021-07-04', '17:00:00', 0),
('SEN68', 'SL004', 'KC002', 4000, '2021-07-04', '14:00:00', '2021-07-04', '18:00:00', 0),
('SEN69', 'SL004', 'KD001', 4000, '2021-07-04', '15:00:00', '2021-07-04', '19:00:00', 0),
('SEN7', 'SC001', 'DG001', 1000, '2021-07-01', '07:00:00', '2021-07-01', '08:00:00', 0),
('SEN70', 'SL004', 'KD002', 4000, '2021-07-04', '16:00:00', '2021-07-04', '20:00:00', 0),
('SEN71', 'SM001', 'KE001', 4000, '2021-07-04', '17:00:00', '2021-07-04', '21:00:00', 0),
('SEN72', 'SM001', 'KE002', 4000, '2021-07-04', '18:00:00', '2021-07-04', '22:00:00', 0),
('SEN73', 'SM001', 'KG001', 5000, '2021-07-05', '01:00:00', '2021-07-05', '06:00:00', 0),
('SEN74', 'SM001', 'KG002', 5000, '2021-07-05', '02:00:00', '2021-07-05', '07:00:00', 0),
('SEN75', 'SM001', 'KG003', 5000, '2021-07-05', '03:00:00', '2021-07-05', '08:00:00', 0),
('SEN76', 'SM001', 'KG004', 5000, '2021-07-05', '04:00:00', '2021-07-05', '09:00:00', 0),
('SEN77', 'SM001', 'KG005', 5000, '2021-07-05', '05:00:00', '2021-07-05', '10:00:00', 0),
('SEN78', 'SM002', 'KG006', 5000, '2021-07-05', '06:00:00', '2021-07-05', '11:00:00', 0),
('SEN79', 'SM002', 'KH001', 5000, '2021-07-05', '07:00:00', '2021-07-05', '12:00:00', 0),
('SEN8', 'SC001', 'DG002', 1000, '2021-07-01', '08:00:00', '2021-07-01', '09:00:00', 0),
('SEN80', 'SM002', 'KH002', 5000, '2021-07-05', '08:00:00', '2021-07-05', '13:00:00', 0),
('SEN81', 'SM002', 'KJ001', 5000, '2021-07-05', '09:00:00', '2021-07-05', '14:00:00', 0),
('SEN82', 'SM002', 'KJ002', 5000, '2021-07-05', '10:00:00', '2021-07-05', '15:00:00', 0),
('SEN83', 'SM002', 'KM001', 5000, '2021-07-05', '11:00:00', '2021-07-05', '16:00:00', 0),
('SEN84', 'SM002', 'KM002', 5000, '2021-07-05', '12:00:00', '2021-07-05', '17:00:00', 0),
('SEN85', 'SM002', 'KM003', 5000, '2021-07-05', '13:00:00', '2021-07-05', '18:00:00', 0),
('SEN86', 'SM003', 'KM004', 5000, '2021-07-05', '14:00:00', '2021-07-05', '19:00:00', 0),
('SEN87', 'SM003', 'KN001', 5000, '2021-07-05', '15:00:00', '2021-07-05', '20:00:00', 0),
('SEN88', 'SM003', 'KN002', 5000, '2021-07-05', '16:00:00', '2021-07-05', '21:00:00', 0),
('SEN89', 'SM003', 'KR001', 5000, '2021-07-05', '17:00:00', '2021-07-05', '22:00:00', 0),
('SEN9', 'SC001', 'DG003', 1000, '2021-07-01', '09:00:00', '2021-07-01', '10:00:00', 0),
('SEN90', 'SM003', 'KR002', 5000, '2021-07-05', '18:00:00', '2021-07-05', '23:00:00', 0),
('SEN91', 'SM003', 'KR003', 6000, '2021-07-06', '01:00:00', '2021-07-06', '07:00:00', 0),
('SEN92', 'SM003', 'KR004', 6000, '2021-07-06', '02:00:00', '2021-07-06', '08:00:00', 0),
('SEN93', 'SM003', 'KS001', 6000, '2021-07-06', '03:00:00', '2021-07-06', '09:00:00', 0),
('SEN94', 'SM003', 'KS002', 6000, '2021-07-06', '04:00:00', '2021-07-06', '10:00:00', 0),
('SEN95', 'SM003', 'KS003', 6000, '2021-07-06', '05:00:00', '2021-07-06', '11:00:00', 0),
('SEN96', 'SM003', 'KS004', 6000, '2021-07-06', '06:00:00', '2021-07-06', '12:00:00', 0),
('SEN97', 'SM004', 'KW001', 6000, '2021-07-06', '07:00:00', '2021-07-06', '13:00:00', 0),
('SEN98', 'SM004', 'KW002', 6000, '2021-07-06', '08:00:00', '2021-07-06', '14:00:00', 0),
('SEN99', 'SM004', 'KW003', 6000, '2021-07-06', '09:00:00', '2021-07-06', '15:00:00', 0);

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
('TU1', 'DA001', 10000, '2021-07-01 00:00:00', 0),
('TU10', 'DH001', 10000, '2021-07-01 00:00:00', 0),
('TU100', 'KW004', 50000, '2021-07-05 00:00:00', 0),
('TU11', 'DJ001', 20000, '2021-07-02 00:00:00', 0),
('TU12', 'DM001', 20000, '2021-07-02 00:00:00', 0),
('TU13', 'DM002', 20000, '2021-07-02 00:00:00', 0),
('TU14', 'DN001', 20000, '2021-07-02 00:00:00', 0),
('TU15', 'DR001', 20000, '2021-07-02 00:00:00', 0),
('TU16', 'DR002', 20000, '2021-07-02 00:00:00', 0),
('TU17', 'DS001', 20000, '2021-07-02 00:00:00', 0),
('TU18', 'DS002', 20000, '2021-07-02 00:00:00', 0),
('TU19', 'DW001', 20000, '2021-07-02 00:00:00', 0),
('TU2', 'DA002', 10000, '2021-07-01 00:00:00', 0),
('TU20', 'DW002', 20000, '2021-07-02 00:00:00', 0),
('TU21', 'GA001', 30000, '2021-07-03 00:00:00', 0),
('TU22', 'GA002', 30000, '2021-07-03 00:00:00', 0),
('TU23', 'GB001', 30000, '2021-07-03 00:00:00', 0),
('TU24', 'GC001', 30000, '2021-07-03 00:00:00', 0),
('TU25', 'GD001', 30000, '2021-07-03 00:00:00', 0),
('TU26', 'GE001', 30000, '2021-07-03 00:00:00', 0),
('TU27', 'GG001', 30000, '2021-07-03 00:00:00', 0),
('TU28', 'GG002', 30000, '2021-07-03 00:00:00', 0),
('TU29', 'GG003', 30000, '2021-07-03 00:00:00', 0),
('TU3', 'DB001', 10000, '2021-07-01 00:00:00', 0),
('TU30', 'GH001', 30000, '2021-07-03 00:00:00', 0),
('TU31', 'GJ001', 30000, '2021-07-03 00:00:00', 0),
('TU32', 'GM001', 30000, '2021-07-03 00:00:00', 0),
('TU33', 'GM002', 30000, '2021-07-03 00:00:00', 0),
('TU34', 'GN001', 30000, '2021-07-03 00:00:00', 0),
('TU35', 'GR001', 30000, '2021-07-03 00:00:00', 0),
('TU36', 'GR002', 30000, '2021-07-03 00:00:00', 0),
('TU37', 'GS001', 30000, '2021-07-03 00:00:00', 0),
('TU38', 'GS002', 30000, '2021-07-03 00:00:00', 0),
('TU39', 'GW001', 30000, '2021-07-03 00:00:00', 0),
('TU4', 'DC001', 10000, '2021-07-01 00:00:00', 0),
('TU40', 'GW002', 30000, '2021-07-03 00:00:00', 0),
('TU41', 'JA001', 30000, '2021-07-03 00:00:00', 0),
('TU42', 'JA002', 30000, '2021-07-03 00:00:00', 0),
('TU43', 'JB001', 30000, '2021-07-03 00:00:00', 0),
('TU44', 'JC001', 30000, '2021-07-03 00:00:00', 0),
('TU45', 'JD001', 30000, '2021-07-03 00:00:00', 0),
('TU46', 'JE001', 30000, '2021-07-03 00:00:00', 0),
('TU47', 'JG001', 30000, '2021-07-03 00:00:00', 0),
('TU48', 'JG002', 30000, '2021-07-03 00:00:00', 0),
('TU49', 'JG003', 30000, '2021-07-03 00:00:00', 0),
('TU5', 'DD001', 10000, '2021-07-01 00:00:00', 0),
('TU50', 'JH001', 30000, '2021-07-03 00:00:00', 0),
('TU51', 'JJ001', 40000, '2021-07-04 00:00:00', 0),
('TU52', 'JM001', 40000, '2021-07-04 00:00:00', 0),
('TU53', 'JM002', 40000, '2021-07-04 00:00:00', 0),
('TU54', 'JN001', 40000, '2021-07-04 00:00:00', 0),
('TU55', 'JR001', 40000, '2021-07-04 00:00:00', 0),
('TU56', 'JR002', 40000, '2021-07-04 00:00:00', 0),
('TU57', 'JS001', 40000, '2021-07-04 00:00:00', 0),
('TU58', 'JS002', 40000, '2021-07-04 00:00:00', 0),
('TU59', 'JW001', 40000, '2021-07-04 00:00:00', 0),
('TU6', 'DE001', 10000, '2021-07-01 00:00:00', 0),
('TU60', 'JW002', 40000, '2021-07-04 00:00:00', 0),
('TU61', 'KA001', 40000, '2021-07-04 00:00:00', 0),
('TU62', 'KA002', 40000, '2021-07-04 00:00:00', 0),
('TU63', 'KA003', 40000, '2021-07-04 00:00:00', 0),
('TU64', 'KA004', 40000, '2021-07-04 00:00:00', 0),
('TU65', 'KB001', 40000, '2021-07-04 00:00:00', 0),
('TU66', 'KB002', 40000, '2021-07-04 00:00:00', 0),
('TU67', 'KC001', 40000, '2021-07-04 00:00:00', 0),
('TU68', 'KC002', 40000, '2021-07-04 00:00:00', 0),
('TU69', 'KD001', 40000, '2021-07-04 00:00:00', 0),
('TU7', 'DG001', 10000, '2021-07-01 00:00:00', 0),
('TU70', 'KD002', 40000, '2021-07-04 00:00:00', 0),
('TU71', 'KE001', 50000, '2021-07-05 00:00:00', 0),
('TU72', 'KE002', 50000, '2021-07-05 00:00:00', 0),
('TU73', 'KG001', 50000, '2021-07-05 00:00:00', 0),
('TU74', 'KG002', 50000, '2021-07-05 00:00:00', 0),
('TU75', 'KG003', 50000, '2021-07-05 00:00:00', 0),
('TU76', 'KG004', 50000, '2021-07-05 00:00:00', 0),
('TU77', 'KG005', 50000, '2021-07-05 00:00:00', 0),
('TU78', 'KG006', 50000, '2021-07-05 00:00:00', 0),
('TU79', 'KH001', 50000, '2021-07-05 00:00:00', 0),
('TU8', 'DG002', 10000, '2021-07-01 00:00:00', 0),
('TU80', 'KH002', 50000, '2021-07-05 00:00:00', 0),
('TU81', 'KJ001', 50000, '2021-07-05 00:00:00', 0),
('TU82', 'KJ002', 50000, '2021-07-05 00:00:00', 0),
('TU83', 'KM001', 50000, '2021-07-05 00:00:00', 0),
('TU84', 'KM002', 50000, '2021-07-05 00:00:00', 0),
('TU85', 'KM003', 50000, '2021-07-05 00:00:00', 0),
('TU86', 'KM004', 50000, '2021-07-05 00:00:00', 0),
('TU87', 'KN001', 50000, '2021-07-05 00:00:00', 0),
('TU88', 'KN002', 50000, '2021-07-05 00:00:00', 0),
('TU89', 'KR001', 50000, '2021-07-05 00:00:00', 0),
('TU9', 'DG003', 10000, '2021-07-01 00:00:00', 0),
('TU90', 'KR002', 50000, '2021-07-05 00:00:00', 0),
('TU91', 'KR003', 50000, '2021-07-05 00:00:00', 0),
('TU92', 'KR004', 50000, '2021-07-05 00:00:00', 0),
('TU93', 'KS001', 50000, '2021-07-05 00:00:00', 0),
('TU94', 'KS002', 50000, '2021-07-05 00:00:00', 0),
('TU95', 'KS003', 50000, '2021-07-05 00:00:00', 0),
('TU96', 'KS004', 50000, '2021-07-05 00:00:00', 0),
('TU97', 'KW001', 50000, '2021-07-05 00:00:00', 0),
('TU98', 'KW002', 50000, '2021-07-05 00:00:00', 0),
('TU99', 'KW003', 50000, '2021-07-05 00:00:00', 0);

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
