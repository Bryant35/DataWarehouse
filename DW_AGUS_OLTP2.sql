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
-- Database: `DW_AGUS_OLTP2`
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
('E0001', 'Emerald Bike', 'Jalan Penatih 5', '081248962345', 0),
('E0002', 'Coal Bike', 'Jalan Gatsu Timur 10', '081298643234', 0),
('E0003', 'Ruby Bike', 'Jalan Gatsu Barat 15', '0812483412427', 0),
('E0004', 'Clay Bike', 'Jalan Cokroaminoto 20', '0812420823466', 0),
('E0005', 'Endstone Bike', 'Jalan Setia Budi 25', '081247248523', 0);

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
('EA001', 'Eddie Ayers', 'EddieAyers', 'Court Locust43', '088124230043', '43000', 'EddieAyers@gmail.com', 0),
('EA002', 'Eddie Austin', 'EddieAustin', 'Drive Pinewood55', '088124230055', '55000', 'EddieAustin@gmail.com', 0),
('EA003', 'Eddie Alexander', 'EddieAlexander', 'Drive Renwick59', '088124230059', '59000', 'EddieAlexander@gmail.com', 0),
('EB001', 'Eddie Bauer', 'EddieBauer', 'Way Christie42', '088124230042', '42000', 'EddieBauer@gmail.com', 0),
('EB002', 'Eddie Bean', 'EddieBean', 'Drive Emily51', '088124230051', '51000', 'EddieBean@gmail.com', 0),
('EB003', 'Eddie Bass', 'EddieBass', 'Drive Calico57', '088124230057', '57000', 'EddieBass@gmail.com', 0),
('EC001', 'Eddie Cameron', 'EddieCameron', 'Avenue Bryan48', '088124230048', '48000', 'EddieCameron@gmail.com', 0),
('ED001', 'Eddie Davis', 'EddieDavis', 'Avenue Monroe45', '088124230045', '45000', 'EddieDavis@gmail.com', 0),
('EE001', 'Eddie Esparza', 'EddieEsparza', 'Ridge Keyser Road53', '088124230053', '53000', 'EddieEsparza@gmail.com', 0),
('EE002', 'Eddie Estrada', 'EddieEstrada', 'Street Libby58', '088124230058', '58000', 'EddieEstrada@gmail.com', 0),
('EF001', 'Eddie Frederick', 'EddieFrederick', 'Alley Traders60', '088124230060', '60000', 'EddieFrederick@gmail.com', 0),
('EG001', 'Eddie Garner', 'EddieGarner', 'Street Dane41', '088124230041', '41000', 'EddieGarner@gmail.com', 0),
('EH001', 'Eddie Holden', 'EddieHolden', 'Avenue Lawman54', '088124230054', '54000', 'EddieHolden@gmail.com', 0),
('EM001', 'Eddie Maddox', 'EddieMaddox', 'Lane Gambler44', '088124230044', '44000', 'EddieMaddox@gmail.com', 0),
('EM002', 'Eddie Merritt', 'EddieMerritt', 'Lane Valley47', '088124230047', '47000', 'EddieMerritt@gmail.com', 0),
('EM003', 'Eddie Madden', 'EddieMadden', 'Valley Hidden Road52', '088124230052', '52000', 'EddieMadden@gmail.com', 0),
('ES001', 'Eddie Schaefer', 'EddieSchaefer', 'Valley Pyramid Road46', '088124230046', '46000', 'EddieSchaefer@gmail.com', 0),
('ES002', 'Eddie Simpson', 'EddieSimpson', 'Hollow Hershell Road49', '088124230049', '49000', 'EddieSimpson@gmail.com', 0),
('ET001', 'Eddie Thompson', 'EddieThompson', 'Hill University Road50', '088124230050', '50000', 'EddieThompson@gmail.com', 0),
('EW001', 'Eddie Wyatt', 'EddieWyatt', 'Avenue Simpson56', '088124230056', '56000', 'EddieWyatt@gmail.com', 0),
('JA001', 'Jayda Ayers', 'JaydaAyers', 'Court Locust3', '088124230003', '3000', 'JaydaAyers@gmail.com', 0),
('JA002', 'Jayda Austin', 'JaydaAustin', 'Drive Pinewood15', '088124230015', '15000', 'JaydaAustin@gmail.com', 0),
('JA003', 'Jayda Alexander', 'JaydaAlexander', 'Drive Renwick19', '088124230019', '19000', 'JaydaAlexander@gmail.com', 0),
('JA004', 'Jovan Ayers', 'JovanAyers', 'Court Locust63', '088124230063', '63000', 'JovanAyers@gmail.com', 0),
('JA005', 'Jovan Austin', 'JovanAustin', 'Drive Pinewood75', '088124230075', '75000', 'JovanAustin@gmail.com', 0),
('JA006', 'Jovan Alexander', 'JovanAlexander', 'Drive Renwick79', '088124230079', '79000', 'JovanAlexander@gmail.com', 0),
('JB001', 'Jayda Bauer', 'JaydaBauer', 'Way Christie2', '088124230002', '2000', 'JaydaBauer@gmail.com', 0),
('JB002', 'Jayda Bean', 'JaydaBean', 'Drive Emily11', '088124230011', '11000', 'JaydaBean@gmail.com', 0),
('JB003', 'Jayda Bass', 'JaydaBass', 'Drive Calico17', '088124230017', '17000', 'JaydaBass@gmail.com', 0),
('JB004', 'Jovan Bauer', 'JovanBauer', 'Way Christie62', '088124230062', '62000', 'JovanBauer@gmail.com', 0),
('JB005', 'Jovan Bean', 'JovanBean', 'Drive Emily71', '088124230071', '71000', 'JovanBean@gmail.com', 0),
('JB006', 'Jovan Bass', 'JovanBass', 'Drive Calico77', '088124230077', '77000', 'JovanBass@gmail.com', 0),
('JC001', 'Jayda Cameron', 'JaydaCameron', 'Avenue Bryan8', '088124230008', '8000', 'JaydaCameron@gmail.com', 0),
('JC002', 'Jovan Cameron', 'JovanCameron', 'Avenue Bryan68', '088124230068', '68000', 'JovanCameron@gmail.com', 0),
('JD001', 'Jayda Davis', 'JaydaDavis', 'Avenue Monroe5', '088124230005', '5000', 'JaydaDavis@gmail.com', 0),
('JD002', 'Jovan Davis', 'JovanDavis', 'Avenue Monroe65', '088124230065', '65000', 'JovanDavis@gmail.com', 0),
('JE001', 'Jayda Esparza', 'JaydaEsparza', 'Ridge Keyser Road13', '088124230013', '13000', 'JaydaEsparza@gmail.com', 0),
('JE002', 'Jayda Estrada', 'JaydaEstrada', 'Street Libby18', '088124230018', '18000', 'JaydaEstrada@gmail.com', 0),
('JE003', 'Jovan Esparza', 'JovanEsparza', 'Ridge Keyser Road73', '088124230073', '73000', 'JovanEsparza@gmail.com', 0),
('JE004', 'Jovan Estrada', 'JovanEstrada', 'Street Libby78', '088124230078', '78000', 'JovanEstrada@gmail.com', 0),
('JF001', 'Jayda Frederick', 'JaydaFrederick', 'Alley Traders20', '088124230020', '20000', 'JaydaFrederick@gmail.com', 0),
('JF002', 'Jovan Frederick', 'JovanFrederick', 'Alley Traders80', '088124230080', '80000', 'JovanFrederick@gmail.com', 0),
('JG001', 'Jayda Garner', 'JaydaGarner', 'Street Dane1', '088124230001', '1000', 'JaydaGarner@gmail.com', 0),
('JG002', 'Jovan Garner', 'JovanGarner', 'Street Dane61', '088124230061', '61000', 'JovanGarner@gmail.com', 0),
('JH001', 'Jayda Holden', 'JaydaHolden', 'Avenue Lawman14', '088124230014', '14000', 'JaydaHolden@gmail.com', 0),
('JH002', 'Jovan Holden', 'JovanHolden', 'Avenue Lawman74', '088124230074', '74000', 'JovanHolden@gmail.com', 0),
('JM001', 'Jayda Maddox', 'JaydaMaddox', 'Lane Gambler4', '088124230004', '4000', 'JaydaMaddox@gmail.com', 0),
('JM002', 'Jayda Merritt', 'JaydaMerritt', 'Lane Valley7', '088124230007', '7000', 'JaydaMerritt@gmail.com', 0),
('JM003', 'Jayda Madden', 'JaydaMadden', 'Valley Hidden Road12', '088124230012', '12000', 'JaydaMadden@gmail.com', 0),
('JM004', 'Jovan Maddox', 'JovanMaddox', 'Lane Gambler64', '088124230064', '64000', 'JovanMaddox@gmail.com', 0),
('JM005', 'Jovan Merritt', 'JovanMerritt', 'Lane Valley67', '088124230067', '67000', 'JovanMerritt@gmail.com', 0),
('JM006', 'Jovan Madden', 'JovanMadden', 'Valley Hidden Road72', '088124230072', '72000', 'JovanMadden@gmail.com', 0),
('JS001', 'Jayda Schaefer', 'JaydaSchaefer', 'Valley Pyramid Road6', '088124230006', '6000', 'JaydaSchaefer@gmail.com', 0),
('JS002', 'Jayda Simpson', 'JaydaSimpson', 'Hollow Hershell Road9', '088124230009', '9000', 'JaydaSimpson@gmail.com', 0),
('JS003', 'Jovan Schaefer', 'JovanSchaefer', 'Valley Pyramid Road66', '088124230066', '66000', 'JovanSchaefer@gmail.com', 0),
('JS004', 'Jovan Simpson', 'JovanSimpson', 'Hollow Hershell Road69', '088124230069', '69000', 'JovanSimpson@gmail.com', 0),
('JT001', 'Jayda Thompson', 'JaydaThompson', 'Hill University Road10', '088124230010', '10000', 'JaydaThompson@gmail.com', 0),
('JT002', 'Jovan Thompson', 'JovanThompson', 'Hill University Road70', '088124230070', '70000', 'JovanThompson@gmail.com', 0),
('JW001', 'Jayda Wyatt', 'JaydaWyatt', 'Avenue Simpson16', '088124230016', '16000', 'JaydaWyatt@gmail.com', 0),
('JW002', 'Jovan Wyatt', 'JovanWyatt', 'Avenue Simpson76', '088124230076', '76000', 'JovanWyatt@gmail.com', 0),
('QA001', 'Quincy Ayers', 'QuincyAyers', 'Court Locust83', '088124230083', '83000', 'QuincyAyers@gmail.com', 0),
('QA002', 'Quincy Austin', 'QuincyAustin', 'Drive Pinewood95', '088124230095', '95000', 'QuincyAustin@gmail.com', 0),
('QA003', 'Quincy Alexander', 'QuincyAlexander', 'Drive Renwick99', '088124230099', '99000', 'QuincyAlexander@gmail.com', 0),
('QB001', 'Quincy Bauer', 'QuincyBauer', 'Way Christie82', '088124230082', '82000', 'QuincyBauer@gmail.com', 0),
('QB002', 'Quincy Bean', 'QuincyBean', 'Drive Emily91', '088124230091', '91000', 'QuincyBean@gmail.com', 0),
('QB003', 'Quincy Bass', 'QuincyBass', 'Drive Calico97', '088124230097', '97000', 'QuincyBass@gmail.com', 0),
('QC001', 'Quincy Cameron', 'QuincyCameron', 'Avenue Bryan88', '088124230088', '88000', 'QuincyCameron@gmail.com', 0),
('QD001', 'Quincy Davis', 'QuincyDavis', 'Avenue Monroe85', '088124230085', '85000', 'QuincyDavis@gmail.com', 0),
('QE001', 'Quincy Esparza', 'QuincyEsparza', 'Ridge Keyser Road93', '088124230093', '93000', 'QuincyEsparza@gmail.com', 0),
('QE002', 'Quincy Estrada', 'QuincyEstrada', 'Street Libby98', '088124230098', '98000', 'QuincyEstrada@gmail.com', 0),
('QF001', 'Quincy Frederick', 'QuincyFrederick', 'Alley Traders100', '0881242310100', '100000', 'QuincyFrederick@gmail.com', 0),
('QG001', 'Quincy Garner', 'QuincyGarner', 'Street Dane81', '088124230081', '81000', 'QuincyGarner@gmail.com', 0),
('QH001', 'Quincy Holden', 'QuincyHolden', 'Avenue Lawman94', '088124230094', '94000', 'QuincyHolden@gmail.com', 0),
('QM001', 'Quincy Maddox', 'QuincyMaddox', 'Lane Gambler84', '088124230084', '84000', 'QuincyMaddox@gmail.com', 0),
('QM002', 'Quincy Merritt', 'QuincyMerritt', 'Lane Valley87', '088124230087', '87000', 'QuincyMerritt@gmail.com', 0),
('QM003', 'Quincy Madden', 'QuincyMadden', 'Valley Hidden Road92', '088124230092', '92000', 'QuincyMadden@gmail.com', 0),
('QS001', 'Quincy Schaefer', 'QuincySchaefer', 'Valley Pyramid Road86', '088124230086', '86000', 'QuincySchaefer@gmail.com', 0),
('QS002', 'Quincy Simpson', 'QuincySimpson', 'Hollow Hershell Road89', '088124230089', '89000', 'QuincySimpson@gmail.com', 0),
('QT001', 'Quincy Thompson', 'QuincyThompson', 'Hill University Road90', '088124230090', '90000', 'QuincyThompson@gmail.com', 0),
('QW001', 'Quincy Wyatt', 'QuincyWyatt', 'Avenue Simpson96', '088124230096', '96000', 'QuincyWyatt@gmail.com', 0),
('YA001', 'Yosef Ayers', 'YosefAyers', 'Court Locust23', '088124230023', '23000', 'YosefAyers@gmail.com', 0),
('YA002', 'Yosef Austin', 'YosefAustin', 'Drive Pinewood35', '088124230035', '35000', 'YosefAustin@gmail.com', 0),
('YA003', 'Yosef Alexander', 'YosefAlexander', 'Drive Renwick39', '088124230039', '39000', 'YosefAlexander@gmail.com', 0),
('YB001', 'Yosef Bauer', 'YosefBauer', 'Way Christie22', '088124230022', '22000', 'YosefBauer@gmail.com', 0),
('YB002', 'Yosef Bean', 'YosefBean', 'Drive Emily31', '088124230031', '31000', 'YosefBean@gmail.com', 0),
('YB003', 'Yosef Bass', 'YosefBass', 'Drive Calico37', '088124230037', '37000', 'YosefBass@gmail.com', 0),
('YC001', 'Yosef Cameron', 'YosefCameron', 'Avenue Bryan28', '088124230028', '28000', 'YosefCameron@gmail.com', 0),
('YD001', 'Yosef Davis', 'YosefDavis', 'Avenue Monroe25', '088124230025', '25000', 'YosefDavis@gmail.com', 0),
('YE001', 'Yosef Esparza', 'YosefEsparza', 'Ridge Keyser Road33', '088124230033', '33000', 'YosefEsparza@gmail.com', 0),
('YE002', 'Yosef Estrada', 'YosefEstrada', 'Street Libby38', '088124230038', '38000', 'YosefEstrada@gmail.com', 0),
('YF001', 'Yosef Frederick', 'YosefFrederick', 'Alley Traders40', '088124230040', '40000', 'YosefFrederick@gmail.com', 0),
('YG001', 'Yosef Garner', 'YosefGarner', 'Street Dane21', '088124230021', '21000', 'YosefGarner@gmail.com', 0),
('YH001', 'Yosef Holden', 'YosefHolden', 'Avenue Lawman34', '088124230034', '34000', 'YosefHolden@gmail.com', 0),
('YM001', 'Yosef Maddox', 'YosefMaddox', 'Lane Gambler24', '088124230024', '24000', 'YosefMaddox@gmail.com', 0),
('YM002', 'Yosef Merritt', 'YosefMerritt', 'Lane Valley27', '088124230027', '27000', 'YosefMerritt@gmail.com', 0),
('YM003', 'Yosef Madden', 'YosefMadden', 'Valley Hidden Road32', '088124230032', '32000', 'YosefMadden@gmail.com', 0),
('YS001', 'Yosef Schaefer', 'YosefSchaefer', 'Valley Pyramid Road26', '088124230026', '26000', 'YosefSchaefer@gmail.com', 0),
('YS002', 'Yosef Simpson', 'YosefSimpson', 'Hollow Hershell Road29', '088124230029', '29000', 'YosefSimpson@gmail.com', 0),
('YT001', 'Yosef Thompson', 'YosefThompson', 'Hill University Road30', '088124230030', '30000', 'YosefThompson@gmail.com', 0),
('YW001', 'Yosef Wyatt', 'YosefWyatt', 'Avenue Simpson36', '088124230036', '36000', 'YosefWyatt@gmail.com', 0);

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
('SG001', 'GT Bike', 'Kuning', 'E0004', 'Available', 7, 0),
('SG002', 'GT Bike', 'Hitam', 'E0005', 'Available', 10, 0),
('SG003', 'GT Bike', 'Biru', 'E0001', 'Available', 5, 0),
('SK001', 'Kona', 'Hijau', 'E0002', 'Available', 4, 0),
('SK002', 'Kona', 'Hitam', 'E0003', 'Available', 7, 0),
('SK003', 'Kona', 'Merah', 'E0004', 'Available', 9, 0),
('SO001', 'Polygon', 'Hitam', 'E0005', 'Available', 15, 0),
('SU001', 'United', 'Merah', 'E0001', 'Available', 8, 0),
('SU002', 'United', 'Putih', 'E0002', 'Available', 9, 0),
('SU003', 'United', 'Biru', 'E0003', 'Available', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_sewa`
--

CREATE TABLE `transaksi_sewa` (
  `id_sewa` varchar(20) NOT NULL,
  `id_sepeda` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
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
('SEW1', 'SC001', 'EA001', 1000, '2021-07-01', '01:00:00', '2021-07-01', '02:00:00', 0),
('SEW10', 'SG002', 'EE002', 1000, '2021-07-01', '10:00:00', '2021-07-01', '11:00:00', 0),
('SEW100', 'SG002', 'YW001', 6000, '2021-07-06', '10:00:00', '2021-07-06', '16:00:00', 0),
('SEW11', 'SG002', 'EF001', 1000, '2021-07-01', '11:00:00', '2021-07-01', '12:00:00', 0),
('SEW12', 'SG002', 'EG001', 1000, '2021-07-01', '12:00:00', '2021-07-01', '13:00:00', 0),
('SEW13', 'SG002', 'EH001', 1000, '2021-07-01', '13:00:00', '2021-07-01', '14:00:00', 0),
('SEW14', 'SG002', 'EM001', 1000, '2021-07-01', '14:00:00', '2021-07-01', '15:00:00', 0),
('SEW15', 'SG002', 'EM002', 1000, '2021-07-01', '15:00:00', '2021-07-01', '16:00:00', 0),
('SEW16', 'SG002', 'EM003', 1000, '2021-07-01', '16:00:00', '2021-07-01', '17:00:00', 0),
('SEW17', 'SG002', 'ES001', 1000, '2021-07-01', '17:00:00', '2021-07-01', '18:00:00', 0),
('SEW18', 'SG003', 'ES002', 1000, '2021-07-01', '18:00:00', '2021-07-01', '19:00:00', 0),
('SEW19', 'SG003', 'ET001', 2000, '2021-07-02', '01:00:00', '2021-07-02', '03:00:00', 0),
('SEW2', 'SC001', 'EA002', 1000, '2021-07-01', '02:00:00', '2021-07-01', '03:00:00', 0),
('SEW20', 'SG003', 'EW001', 2000, '2021-07-02', '02:00:00', '2021-07-02', '04:00:00', 0),
('SEW21', 'SG003', 'JA001', 2000, '2021-07-02', '03:00:00', '2021-07-02', '05:00:00', 0),
('SEW22', 'SG003', 'JA002', 2000, '2021-07-02', '04:00:00', '2021-07-02', '06:00:00', 0),
('SEW23', 'SK001', 'JA003', 2000, '2021-07-02', '05:00:00', '2021-07-02', '07:00:00', 0),
('SEW24', 'SK001', 'JA004', 2000, '2021-07-02', '06:00:00', '2021-07-02', '08:00:00', 0),
('SEW25', 'SK001', 'JA005', 2000, '2021-07-02', '07:00:00', '2021-07-02', '09:00:00', 0),
('SEW26', 'SK001', 'JA006', 2000, '2021-07-02', '08:00:00', '2021-07-02', '10:00:00', 0),
('SEW27', 'SK002', 'JB001', 2000, '2021-07-02', '09:00:00', '2021-07-02', '11:00:00', 0),
('SEW28', 'SK002', 'JB002', 2000, '2021-07-02', '10:00:00', '2021-07-02', '12:00:00', 0),
('SEW29', 'SK002', 'JB003', 2000, '2021-07-02', '11:00:00', '2021-07-02', '13:00:00', 0),
('SEW3', 'SC001', 'EA003', 1000, '2021-07-01', '03:00:00', '2021-07-01', '04:00:00', 0),
('SEW30', 'SK002', 'JB004', 2000, '2021-07-02', '12:00:00', '2021-07-02', '14:00:00', 0),
('SEW31', 'SK002', 'JB005', 2000, '2021-07-02', '13:00:00', '2021-07-02', '15:00:00', 0),
('SEW32', 'SK002', 'JB006', 2000, '2021-07-02', '14:00:00', '2021-07-02', '16:00:00', 0),
('SEW33', 'SK002', 'JC001', 2000, '2021-07-02', '15:00:00', '2021-07-02', '17:00:00', 0),
('SEW34', 'SK003', 'JC002', 2000, '2021-07-02', '16:00:00', '2021-07-02', '18:00:00', 0),
('SEW35', 'SK003', 'JD001', 2000, '2021-07-02', '17:00:00', '2021-07-02', '19:00:00', 0),
('SEW36', 'SK003', 'JD002', 2000, '2021-07-02', '18:00:00', '2021-07-02', '20:00:00', 0),
('SEW37', 'SK003', 'JE001', 3000, '2021-07-03', '01:00:00', '2021-07-03', '04:00:00', 0),
('SEW38', 'SK003', 'JE002', 3000, '2021-07-03', '02:00:00', '2021-07-03', '05:00:00', 0),
('SEW39', 'SK003', 'JE003', 3000, '2021-07-03', '03:00:00', '2021-07-03', '06:00:00', 0),
('SEW4', 'SC001', 'EB001', 1000, '2021-07-01', '04:00:00', '2021-07-01', '05:00:00', 0),
('SEW40', 'SK003', 'JE004', 3000, '2021-07-03', '04:00:00', '2021-07-03', '07:00:00', 0),
('SEW41', 'SK003', 'JF001', 3000, '2021-07-03', '05:00:00', '2021-07-03', '08:00:00', 0),
('SEW42', 'SK003', 'JF002', 3000, '2021-07-03', '06:00:00', '2021-07-03', '09:00:00', 0),
('SEW43', 'SO001', 'JG001', 3000, '2021-07-03', '07:00:00', '2021-07-03', '10:00:00', 0),
('SEW44', 'SO001', 'JG002', 3000, '2021-07-03', '08:00:00', '2021-07-03', '11:00:00', 0),
('SEW45', 'SO001', 'JH001', 3000, '2021-07-03', '09:00:00', '2021-07-03', '12:00:00', 0),
('SEW46', 'SO001', 'JH002', 3000, '2021-07-03', '10:00:00', '2021-07-03', '13:00:00', 0),
('SEW47', 'SO001', 'JM001', 3000, '2021-07-03', '11:00:00', '2021-07-03', '14:00:00', 0),
('SEW48', 'SO001', 'JM002', 3000, '2021-07-03', '12:00:00', '2021-07-03', '15:00:00', 0),
('SEW49', 'SO001', 'JM003', 3000, '2021-07-03', '13:00:00', '2021-07-03', '16:00:00', 0),
('SEW5', 'SC001', 'EB002', 1000, '2021-07-01', '05:00:00', '2021-07-01', '06:00:00', 0),
('SEW50', 'SO001', 'JM004', 3000, '2021-07-03', '14:00:00', '2021-07-03', '17:00:00', 0),
('SEW51', 'SO001', 'JM005', 3000, '2021-07-03', '15:00:00', '2021-07-03', '18:00:00', 0),
('SEW52', 'SO001', 'JM006', 3000, '2021-07-03', '16:00:00', '2021-07-03', '19:00:00', 0),
('SEW53', 'SO001', 'JS001', 3000, '2021-07-03', '17:00:00', '2021-07-03', '20:00:00', 0),
('SEW54', 'SO001', 'JS002', 3000, '2021-07-03', '18:00:00', '2021-07-03', '21:00:00', 0),
('SEW55', 'SO001', 'JS003', 4000, '2021-07-04', '01:00:00', '2021-07-04', '05:00:00', 0),
('SEW56', 'SO001', 'JS004', 4000, '2021-07-04', '02:00:00', '2021-07-04', '06:00:00', 0),
('SEW57', 'SO001', 'JT001', 4000, '2021-07-04', '03:00:00', '2021-07-04', '07:00:00', 0),
('SEW58', 'SU001', 'JT002', 4000, '2021-07-04', '04:00:00', '2021-07-04', '08:00:00', 0),
('SEW59', 'SU001', 'JW001', 4000, '2021-07-04', '05:00:00', '2021-07-04', '09:00:00', 0),
('SEW6', 'SC001', 'EB003', 1000, '2021-07-01', '06:00:00', '2021-07-01', '07:00:00', 0),
('SEW60', 'SU001', 'JW002', 4000, '2021-07-04', '06:00:00', '2021-07-04', '10:00:00', 0),
('SEW61', 'SU001', 'QA001', 4000, '2021-07-04', '07:00:00', '2021-07-04', '11:00:00', 0),
('SEW62', 'SU001', 'QA002', 4000, '2021-07-04', '08:00:00', '2021-07-04', '12:00:00', 0),
('SEW63', 'SU001', 'QA003', 4000, '2021-07-04', '09:00:00', '2021-07-04', '13:00:00', 0),
('SEW64', 'SU001', 'QB001', 4000, '2021-07-04', '10:00:00', '2021-07-04', '14:00:00', 0),
('SEW65', 'SU001', 'QB002', 4000, '2021-07-04', '11:00:00', '2021-07-04', '15:00:00', 0),
('SEW66', 'SU002', 'QB003', 4000, '2021-07-04', '12:00:00', '2021-07-04', '16:00:00', 0),
('SEW67', 'SU002', 'QC001', 4000, '2021-07-04', '13:00:00', '2021-07-04', '17:00:00', 0),
('SEW68', 'SU002', 'QD001', 4000, '2021-07-04', '14:00:00', '2021-07-04', '18:00:00', 0),
('SEW69', 'SU002', 'QE001', 4000, '2021-07-04', '15:00:00', '2021-07-04', '19:00:00', 0),
('SEW7', 'SC001', 'EC001', 1000, '2021-07-01', '07:00:00', '2021-07-01', '08:00:00', 0),
('SEW70', 'SU002', 'QE002', 4000, '2021-07-04', '16:00:00', '2021-07-04', '20:00:00', 0),
('SEW71', 'SU002', 'QF001', 4000, '2021-07-04', '17:00:00', '2021-07-04', '21:00:00', 0),
('SEW72', 'SU002', 'QG001', 4000, '2021-07-04', '18:00:00', '2021-07-04', '22:00:00', 0),
('SEW73', 'SU002', 'QH001', 5000, '2021-07-05', '01:00:00', '2021-07-05', '06:00:00', 0),
('SEW74', 'SU002', 'QM001', 5000, '2021-07-05', '02:00:00', '2021-07-05', '07:00:00', 0),
('SEW75', 'SU003', 'QM002', 5000, '2021-07-05', '03:00:00', '2021-07-05', '08:00:00', 0),
('SEW76', 'SU003', 'QM003', 5000, '2021-07-05', '04:00:00', '2021-07-05', '09:00:00', 0),
('SEW77', 'SU003', 'QS001', 5000, '2021-07-05', '05:00:00', '2021-07-05', '10:00:00', 0),
('SEW78', 'SU003', 'QS002', 5000, '2021-07-05', '06:00:00', '2021-07-05', '11:00:00', 0),
('SEW79', 'SU003', 'QT001', 5000, '2021-07-05', '07:00:00', '2021-07-05', '12:00:00', 0),
('SEW8', 'SC001', 'ED001', 1000, '2021-07-01', '08:00:00', '2021-07-01', '09:00:00', 0),
('SEW80', 'SU003', 'QW001', 5000, '2021-07-05', '08:00:00', '2021-07-05', '13:00:00', 0),
('SEW81', 'SU003', 'YA001', 5000, '2021-07-05', '09:00:00', '2021-07-05', '14:00:00', 0),
('SEW82', 'SU003', 'YA002', 5000, '2021-07-05', '10:00:00', '2021-07-05', '15:00:00', 0),
('SEW83', 'SU003', 'YA003', 5000, '2021-07-05', '11:00:00', '2021-07-05', '16:00:00', 0),
('SEW84', 'SU003', 'YB001', 5000, '2021-07-05', '12:00:00', '2021-07-05', '17:00:00', 0),
('SEW85', 'SG001', 'YB002', 5000, '2021-07-05', '13:00:00', '2021-07-05', '18:00:00', 0),
('SEW86', 'SG001', 'YB003', 5000, '2021-07-05', '14:00:00', '2021-07-05', '19:00:00', 0),
('SEW87', 'SG001', 'YC001', 5000, '2021-07-05', '15:00:00', '2021-07-05', '20:00:00', 0),
('SEW88', 'SG001', 'YD001', 5000, '2021-07-05', '16:00:00', '2021-07-05', '21:00:00', 0),
('SEW89', 'SG001', 'YE001', 5000, '2021-07-05', '17:00:00', '2021-07-05', '22:00:00', 0),
('SEW9', 'SC001', 'EE001', 1000, '2021-07-01', '09:00:00', '2021-07-01', '10:00:00', 0),
('SEW90', 'SG001', 'YE002', 5000, '2021-07-05', '18:00:00', '2021-07-05', '23:00:00', 0),
('SEW91', 'SG001', 'YF001', 6000, '2021-07-06', '01:00:00', '2021-07-06', '07:00:00', 0),
('SEW92', 'SG001', 'YG001', 6000, '2021-07-06', '02:00:00', '2021-07-06', '08:00:00', 0),
('SEW93', 'SG001', 'YH001', 6000, '2021-07-06', '03:00:00', '2021-07-06', '09:00:00', 0),
('SEW94', 'SG001', 'YM001', 6000, '2021-07-06', '04:00:00', '2021-07-06', '10:00:00', 0),
('SEW95', 'SG001', 'YM002', 6000, '2021-07-06', '05:00:00', '2021-07-06', '11:00:00', 0),
('SEW96', 'SG001', 'YM003', 6000, '2021-07-06', '06:00:00', '2021-07-06', '12:00:00', 0),
('SEW97', 'SG001', 'YS001', 6000, '2021-07-06', '07:00:00', '2021-07-06', '13:00:00', 0),
('SEW98', 'SG001', 'YS002', 6000, '2021-07-06', '08:00:00', '2021-07-06', '14:00:00', 0),
('SEW99', 'SG002', 'YT001', 6000, '2021-07-06', '09:00:00', '2021-07-06', '15:00:00', 0);

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
('TU1', 'EA001', 10000, '2021-09-01 00:00:00', 0),
('TU10', 'EE002', 10000, '2021-09-01 00:00:00', 0),
('TU100', 'YW001', 50000, '2021-09-05 00:00:00', 0),
('TU11', 'EF001', 20000, '2021-09-02 00:00:00', 0),
('TU12', 'EG001', 20000, '2021-09-02 00:00:00', 0),
('TU13', 'EH001', 20000, '2021-09-02 00:00:00', 0),
('TU14', 'EM001', 20000, '2021-09-02 00:00:00', 0),
('TU15', 'EM002', 20000, '2021-09-02 00:00:00', 0),
('TU16', 'EM003', 20000, '2021-09-02 00:00:00', 0),
('TU17', 'ES001', 20000, '2021-09-02 00:00:00', 0),
('TU18', 'ES002', 20000, '2021-09-02 00:00:00', 0),
('TU19', 'ET001', 20000, '2021-09-02 00:00:00', 0),
('TU2', 'EA002', 10000, '2021-09-01 00:00:00', 0),
('TU20', 'EW001', 20000, '2021-09-02 00:00:00', 0),
('TU21', 'JA001', 30000, '2021-09-03 00:00:00', 0),
('TU22', 'JA002', 30000, '2021-09-03 00:00:00', 0),
('TU23', 'JA003', 30000, '2021-09-03 00:00:00', 0),
('TU24', 'JA004', 30000, '2021-09-03 00:00:00', 0),
('TU25', 'JA005', 30000, '2021-09-03 00:00:00', 0),
('TU26', 'JA006', 30000, '2021-09-03 00:00:00', 0),
('TU27', 'JB001', 30000, '2021-09-03 00:00:00', 0),
('TU28', 'JB002', 30000, '2021-09-03 00:00:00', 0),
('TU29', 'JB003', 30000, '2021-09-03 00:00:00', 0),
('TU3', 'EA003', 10000, '2021-09-01 00:00:00', 0),
('TU30', 'JB004', 30000, '2021-09-03 00:00:00', 0),
('TU31', 'JB005', 30000, '2021-09-03 00:00:00', 0),
('TU32', 'JB006', 30000, '2021-09-03 00:00:00', 0),
('TU33', 'JC001', 30000, '2021-09-03 00:00:00', 0),
('TU34', 'JC002', 30000, '2021-09-03 00:00:00', 0),
('TU35', 'JD001', 30000, '2021-09-03 00:00:00', 0),
('TU36', 'JD002', 30000, '2021-09-03 00:00:00', 0),
('TU37', 'JE001', 30000, '2021-09-03 00:00:00', 0),
('TU38', 'JE002', 30000, '2021-09-03 00:00:00', 0),
('TU39', 'JE003', 30000, '2021-09-03 00:00:00', 0),
('TU4', 'EB001', 10000, '2021-09-01 00:00:00', 0),
('TU40', 'JE004', 30000, '2021-09-03 00:00:00', 0),
('TU41', 'JF001', 30000, '2021-09-03 00:00:00', 0),
('TU42', 'JF002', 30000, '2021-09-03 00:00:00', 0),
('TU43', 'JG001', 30000, '2021-09-03 00:00:00', 0),
('TU44', 'JG002', 30000, '2021-09-03 00:00:00', 0),
('TU45', 'JH001', 30000, '2021-09-03 00:00:00', 0),
('TU46', 'JH002', 30000, '2021-09-03 00:00:00', 0),
('TU47', 'JM001', 30000, '2021-09-03 00:00:00', 0),
('TU48', 'JM002', 30000, '2021-09-03 00:00:00', 0),
('TU49', 'JM003', 30000, '2021-09-03 00:00:00', 0),
('TU5', 'EB002', 10000, '2021-09-01 00:00:00', 0),
('TU50', 'JM004', 30000, '2021-09-03 00:00:00', 0),
('TU51', 'JM005', 40000, '2021-09-04 00:00:00', 0),
('TU52', 'JM006', 40000, '2021-09-04 00:00:00', 0),
('TU53', 'JS001', 40000, '2021-09-04 00:00:00', 0),
('TU54', 'JS002', 40000, '2021-09-04 00:00:00', 0),
('TU55', 'JS003', 40000, '2021-09-04 00:00:00', 0),
('TU56', 'JS004', 40000, '2021-09-04 00:00:00', 0),
('TU57', 'JT001', 40000, '2021-09-04 00:00:00', 0),
('TU58', 'JT002', 40000, '2021-09-04 00:00:00', 0),
('TU59', 'JW001', 40000, '2021-09-04 00:00:00', 0),
('TU6', 'EB003', 10000, '2021-09-01 00:00:00', 0),
('TU60', 'JW002', 40000, '2021-09-04 00:00:00', 0),
('TU61', 'QA001', 40000, '2021-09-04 00:00:00', 0),
('TU62', 'QA002', 40000, '2021-09-04 00:00:00', 0),
('TU63', 'QA003', 40000, '2021-09-04 00:00:00', 0),
('TU64', 'QB001', 40000, '2021-09-04 00:00:00', 0),
('TU65', 'QB002', 40000, '2021-09-04 00:00:00', 0),
('TU66', 'QB003', 40000, '2021-09-04 00:00:00', 0),
('TU67', 'QC001', 40000, '2021-09-04 00:00:00', 0),
('TU68', 'QD001', 40000, '2021-09-04 00:00:00', 0),
('TU69', 'QE001', 40000, '2021-09-04 00:00:00', 0),
('TU7', 'EC001', 10000, '2021-09-01 00:00:00', 0),
('TU70', 'QE002', 40000, '2021-09-04 00:00:00', 0),
('TU71', 'QF001', 50000, '2021-09-05 00:00:00', 0),
('TU72', 'QG001', 50000, '2021-09-05 00:00:00', 0),
('TU73', 'QH001', 50000, '2021-09-05 00:00:00', 0),
('TU74', 'QM001', 50000, '2021-09-05 00:00:00', 0),
('TU75', 'QM002', 50000, '2021-09-05 00:00:00', 0),
('TU76', 'QM003', 50000, '2021-09-05 00:00:00', 0),
('TU77', 'QS001', 50000, '2021-09-05 00:00:00', 0),
('TU78', 'QS002', 50000, '2021-09-05 00:00:00', 0),
('TU79', 'QT001', 50000, '2021-09-05 00:00:00', 0),
('TU8', 'ED001', 10000, '2021-09-01 00:00:00', 0),
('TU80', 'QW001', 50000, '2021-09-05 00:00:00', 0),
('TU81', 'YA001', 50000, '2021-09-05 00:00:00', 0),
('TU82', 'YA002', 50000, '2021-09-05 00:00:00', 0),
('TU83', 'YA003', 50000, '2021-09-05 00:00:00', 0),
('TU84', 'YB001', 50000, '2021-09-05 00:00:00', 0),
('TU85', 'YB002', 50000, '2021-09-05 00:00:00', 0),
('TU86', 'YB003', 50000, '2021-09-05 00:00:00', 0),
('TU87', 'YC001', 50000, '2021-09-05 00:00:00', 0),
('TU88', 'YD001', 50000, '2021-09-05 00:00:00', 0),
('TU89', 'YE001', 50000, '2021-09-05 00:00:00', 0),
('TU9', 'EE001', 10000, '2021-09-01 00:00:00', 0),
('TU90', 'YE002', 50000, '2021-09-05 00:00:00', 0),
('TU91', 'YF001', 50000, '2021-09-05 00:00:00', 0),
('TU92', 'YG001', 50000, '2021-09-05 00:00:00', 0),
('TU93', 'YH001', 50000, '2021-09-05 00:00:00', 0),
('TU94', 'YM001', 50000, '2021-09-05 00:00:00', 0),
('TU95', 'YM002', 50000, '2021-09-05 00:00:00', 0),
('TU96', 'YM003', 50000, '2021-09-05 00:00:00', 0),
('TU97', 'YS001', 50000, '2021-09-05 00:00:00', 0),
('TU98', 'YS002', 50000, '2021-09-05 00:00:00', 0),
('TU99', 'YT001', 50000, '2021-09-05 00:00:00', 0);

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
