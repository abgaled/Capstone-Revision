-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2019 at 12:49 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_capstone32`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_annualbudget`
--

CREATE TABLE `tbl_annualbudget` (
  `int_budgetID` int(11) NOT NULL,
  `int_cityID` int(11) NOT NULL,
  `date_budgetYear` year(4) NOT NULL,
  `decimal_annualBudget` decimal(20,2) NOT NULL,
  `decimal_annualRemaining` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_annualbudget`
--

INSERT INTO `tbl_annualbudget` (`int_budgetID`, `int_cityID`, `date_budgetYear`, `decimal_annualBudget`, `decimal_annualRemaining`) VALUES
(5, 1, 2017, '1200000.00', '756000.00'),
(6, 1, 2018, '5000000.00', '4961090.00'),
(8, 1, 2019, '2710000.00', '2707420.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_applicantbenefit`
--

CREATE TABLE `tbl_applicantbenefit` (
  `int_appbeneID` int(11) NOT NULL,
  `int_projectID` int(11) NOT NULL,
  `int_sponsorID` int(11) DEFAULT NULL,
  `text_benefitName` text NOT NULL,
  `int_benefitQuantity` int(11) NOT NULL,
  `char_itemUnit` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_applicantbenefit`
--

INSERT INTO `tbl_applicantbenefit` (`int_appbeneID`, `int_projectID`, `int_sponsorID`, `text_benefitName`, `int_benefitQuantity`, `char_itemUnit`) VALUES
(36, 50, NULL, 'Health Benefit1', 3, 'pc'),
(37, 51, NULL, 'School Supplies Benefit1', 3, 'pc'),
(38, 52, 3, 'Alaska milk1', 2, 'pc'),
(39, 53, NULL, 'Benefit 1 for residenttest', 3, 'pc'),
(40, 54, NULL, 'benefit1', 2, 'pc'),
(41, 55, NULL, 'BenefitsaDM1', 1, 'pc'),
(42, 56, NULL, 'Benefit1fromnewsponsor1', 2, 'pc'),
(43, 57, NULL, 'BENEFITMONETARYUNILEVER', 1, 'pc'),
(44, 58, 26, 'MATERIAL1', 2, 'pc'),
(46, 60, NULL, 'benefirfromnew3', 1, 'pc'),
(48, 62, NULL, 'BENEFITFROMSPONSOR51', 1, 'pc'),
(49, 63, NULL, 'benefit52', 2, 'pc'),
(50, 64, NULL, 'bothannualandnewsponsor1benefit', 2, 'pc'),
(51, 65, 32, 'benefit1', 1, 'pc'),
(52, 66, NULL, 'newsponsor1foodsuppliesbenefit1', 2, 'pc'),
(53, 67, 33, 'Food Supplies existing sponsor materialbenefit', 1, 'pc'),
(54, 68, NULL, 'benefitsponsor1', 2, 'pc'),
(55, 69, NULL, 'Capsules ', 8, 'undefined'),
(56, 69, NULL, 'Medicine 1', 2, 'pc'),
(57, 69, NULL, 'Face Mask', 3, 'undefined');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_application`
--

CREATE TABLE `tbl_application` (
  `int_applicationID` int(11) NOT NULL,
  `int_barangayID` int(11) NOT NULL,
  `int_projectID` int(11) NOT NULL,
  `enum_applicationType` enum('Resident','Barangay','Household') NOT NULL,
  `enum_applicationStatus` enum('Pending','Approved','Rejected','Received','In Progress') NOT NULL DEFAULT 'Pending',
  `datetime_receivedDate` datetime DEFAULT NULL,
  `datetime_submittedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_application`
--

INSERT INTO `tbl_application` (`int_applicationID`, `int_barangayID`, `int_projectID`, `enum_applicationType`, `enum_applicationStatus`, `datetime_receivedDate`, `datetime_submittedDate`) VALUES
(48, 9, 50, 'Resident', 'Received', '2018-10-29 15:02:55', '2018-10-29 15:08:59'),
(49, 9, 50, 'Resident', 'Received', '2018-10-29 15:02:55', '2018-10-29 15:10:46'),
(50, 9, 50, 'Resident', 'Received', '2018-10-29 15:02:55', '2018-10-29 15:11:39'),
(51, 9, 51, 'Barangay', 'Approved', NULL, '2018-10-29 15:25:34'),
(52, 2, 51, 'Barangay', 'Approved', NULL, '2018-10-29 15:26:45'),
(53, 1, 52, 'Barangay', 'Approved', NULL, '2018-10-29 16:04:21'),
(54, 4, 52, 'Barangay', 'Approved', NULL, '2018-10-29 16:05:14'),
(55, 9, 53, 'Resident', 'Approved', NULL, '2018-10-29 19:41:30'),
(56, 9, 53, 'Resident', 'Rejected', NULL, '2018-10-29 19:42:36'),
(57, 9, 53, 'Resident', 'Approved', NULL, '2018-10-29 19:43:57'),
(58, 9, 54, 'Barangay', 'Approved', NULL, '2018-10-29 20:06:25'),
(59, 9, 64, 'Resident', 'Received', '2018-11-06 01:12:15', '2018-11-06 01:26:34'),
(60, 9, 64, 'Resident', 'Received', '2018-11-06 01:12:15', '2018-11-06 01:29:31'),
(61, 9, 64, 'Resident', 'Rejected', NULL, '2018-11-06 01:30:29'),
(62, 4, 65, 'Barangay', 'Approved', NULL, '2018-11-06 02:45:09'),
(63, 9, 65, 'Barangay', 'Approved', NULL, '2018-11-06 02:46:28'),
(64, 9, 66, 'Resident', 'Received', '2018-11-06 13:27:03', '2018-11-06 14:49:31'),
(65, 9, 66, 'Resident', 'Received', '2018-11-06 13:27:03', '2018-11-06 14:50:29'),
(66, 9, 67, 'Barangay', 'Approved', NULL, '2018-11-06 15:03:06'),
(67, 4, 67, 'Barangay', 'Approved', NULL, '2018-11-06 15:03:58'),
(68, 9, 68, 'Barangay', 'Approved', NULL, '2018-11-06 19:31:14'),
(69, 4, 68, 'Barangay', 'Approved', NULL, '2018-11-06 19:33:28'),
(70, 4, 53, 'Resident', 'Approved', NULL, '2019-02-08 20:10:45'),
(71, 9, 53, 'Resident', 'Rejected', NULL, '2019-02-08 20:15:02'),
(72, 6, 53, 'Resident', 'Approved', NULL, '2019-02-08 20:18:00'),
(73, 2, 53, 'Resident', 'Pending', NULL, '2019-02-08 21:05:31'),
(74, 6, 53, 'Resident', 'Pending', NULL, '2019-02-08 21:06:54'),
(75, 6, 69, 'Resident', 'Received', '2019-02-08 19:15:48', '2019-02-09 00:38:42'),
(76, 4, 69, 'Resident', 'Received', '2019-02-08 19:15:48', '2019-02-09 00:43:22'),
(77, 4, 69, 'Resident', 'Received', '2019-02-08 19:15:48', '2019-02-09 00:44:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_applicationrequirement`
--

CREATE TABLE `tbl_applicationrequirement` (
  `int_appreqID` int(11) NOT NULL,
  `int_applicationID` int(11) NOT NULL,
  `int_requirementID` int(11) NOT NULL,
  `varchar_fileLocation` varchar(100) DEFAULT NULL,
  `enum_appreqStatus` enum('Passed','Incomplete') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_applicationrequirement`
--

INSERT INTO `tbl_applicationrequirement` (`int_appreqID`, `int_applicationID`, `int_requirementID`, `varchar_fileLocation`, `enum_appreqStatus`) VALUES
(51, 48, 1, 'Cabinet1 row1', 'Passed'),
(52, 48, 14, 'Cabinet1 row2', 'Passed'),
(53, 49, 1, 'Cabinet1 row1', 'Passed'),
(54, 49, 14, 'Cabinet1 row2', 'Passed'),
(55, 50, 1, 'Cabinet1 row1', 'Passed'),
(56, 50, 14, 'Cabinet1 row2', 'Passed'),
(57, 55, 14, 'Cabinet 1 row 1', 'Passed'),
(58, 56, 14, 'Cabinet1 row 1', 'Passed'),
(59, 57, 14, 'Cabinet 1 row 1', 'Passed'),
(60, 59, 14, 'cabinet1 row 1', 'Passed'),
(61, 60, 14, 'cabinet 1 row 1', 'Passed'),
(62, 61, 14, 'cabinet 1 row 1', 'Passed'),
(63, 64, 14, 'cabinet 1 row 1', 'Passed'),
(64, 65, 14, 'cabinet 1 row 1', 'Passed'),
(65, 70, 14, 'Cabinet 1 Row A', 'Passed'),
(66, 71, 14, 'Cabinet A Row A', 'Passed'),
(67, 72, 14, 'cabinet 5 row e', 'Passed'),
(68, 73, 14, 'Cabinet A Row A', 'Passed'),
(69, 74, 14, 'Cabinet 1 Row A', 'Passed'),
(70, 75, 14, 'Cabinet 1 Row 1', 'Passed'),
(71, 76, 14, 'Cabinet 1 Row B', 'Passed'),
(72, 77, 14, 'Cabinet 1 Row D', 'Passed');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barangay`
--

CREATE TABLE `tbl_barangay` (
  `int_barangayID` int(11) NOT NULL,
  `int_cityID` int(11) NOT NULL,
  `varchar_barangayName` varchar(100) NOT NULL,
  `varchar_barangayContact` varchar(100) NOT NULL,
  `text_barangayAddress` text NOT NULL,
  `enum_barangayStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_barangay`
--

INSERT INTO `tbl_barangay` (`int_barangayID`, `int_cityID`, `varchar_barangayName`, `varchar_barangayContact`, `text_barangayAddress`, `enum_barangayStatus`) VALUES
(1, 1, 'Addition Hills', '226-6666', 'Blk. 12 Welfareville Compound', 'Active'),
(2, 1, 'Bagong Silang', '514-8312/9953354', 'cor. J. Luna Street', 'Active'),
(3, 1, 'Barangka Drive', '531-6544', '775 Barangka Drive cor. Sgt. Bumatay', 'Active'),
(4, 1, 'Hulo', '534-5056/535-2505', 'Coronado Street', 'Active'),
(6, 1, 'Plainview', '534-1874', '40 Malaya Street', 'Active'),
(9, 1, 'Ilaya', '2534521', '253 Ilaya', 'Active'),
(11, 1, 'Malapit', '5236549', '2532 Mandaluyong City', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barangayapplication`
--

CREATE TABLE `tbl_barangayapplication` (
  `int_applicationID` int(11) NOT NULL,
  `int_slot` int(11) NOT NULL,
  `text_applicationReason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_barangayapplication`
--

INSERT INTO `tbl_barangayapplication` (`int_applicationID`, `int_slot`, `text_applicationReason`) VALUES
(51, 10, 'We need it'),
(52, 10, 'Our barangay needs it'),
(53, 15, 'We need it'),
(54, 15, 'We need it too'),
(58, 20, 'idhcishxi'),
(62, 10, 'jknjk'),
(63, 2, 'jnj'),
(66, 10, 'sjhdkjshx'),
(67, 10, 'wdwdw'),
(68, 10, 'kjsklcjs'),
(69, 10, 'hjkcdhc');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barangaybeneficiary`
--

CREATE TABLE `tbl_barangaybeneficiary` (
  `int_brgybeneID` int(11) NOT NULL,
  `int_applicationID` int(11) NOT NULL,
  `varchar_FName` varchar(100) NOT NULL,
  `varchar_MName` varchar(100) DEFAULT NULL,
  `varchar_LName` varchar(100) NOT NULL,
  `text_signaturePath` text NOT NULL,
  `datetime_received` datetime DEFAULT NULL,
  `varchar_validationID` varchar(100) NOT NULL,
  `text_remarks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_barangaybeneficiary`
--

INSERT INTO `tbl_barangaybeneficiary` (`int_brgybeneID`, `int_applicationID`, `varchar_FName`, `varchar_MName`, `varchar_LName`, `text_signaturePath`, `datetime_received`, `varchar_validationID`, `text_remarks`) VALUES
(11, 51, 'James', 'Dean', 'Daydream', '', '2018-10-29 15:02:55', '2541', 'None'),
(12, 51, 'Key', 'To ', 'Correction', '', '2018-10-29 15:02:55', '2578', 'None'),
(13, 52, 'Abs', 'Sent', 'Ikaw', '', '2018-10-29 15:02:55', '7845', 'None'),
(14, 52, 'Hammy', 'Chees', 'Sause', '', '2018-10-29 15:02:55', '2569', 'None'),
(15, 53, 'Athena', 'Bem', 'Loa', '', '2018-10-29 15:51:40', '1452', 'None'),
(16, 53, 'Hui', 'Jusko', 'Layuan', '', '2018-10-29 15:51:40', '7896', 'none'),
(17, 54, 'Jakie', 'Rice', 'Coffee', '', '2018-10-29 15:51:40', '7845', 'none'),
(18, 54, 'Bruno', 'Mars', 'Ertg', '', '2018-10-29 15:51:40', '2358', 'none'),
(19, 58, 'Gale', 'Del ', 'Punzalan', '', '2018-10-29 19:35:09', '1245', 'none'),
(20, 58, 'Jake', 'Santos', 'Mendoza', '', '2018-10-29 19:35:09', '2578 ', 'none'),
(21, 62, 'shduiw', 'uihuihi', 'iuhuih', '', '2018-11-06 02:15:55', '2536', 'iuhui'),
(22, 62, 'ksdjj', 'hjkhjk', 'jkhk', '', '2018-11-06 02:15:55', '2536', 'jkhk'),
(23, 63, 'ihuihui', 'huihiu', 'huihui', '', '2018-11-06 02:15:55', 'sdsklj', 'uihui\r\n'),
(24, 63, 'ghgjg', 'jhgj', 'gjghj', '', '2018-11-06 02:15:55', 'hg', 'jhghj'),
(25, 66, 'sj', 'jijioj', 'jiojo', '', '2018-11-06 13:27:03', '2145', 'ijioj'),
(26, 66, 'kjsdk', 'jkhjk', 'kjhjkh', '', '2018-11-06 13:27:03', '2541', 'kjhjk'),
(27, 66, 'skljdkljlk', 'jlkj', 'kjljk', '', '2018-11-06 13:27:03', '7845', 'kljkl'),
(28, 67, 'kjsckk', 'hkjhjksh', 'jkhjk', '', '2018-11-06 13:27:03', '1236', 'duhucdhiu'),
(29, 67, 'kjdck', 'khjkhjh', 'hjbjhjkhk', '', '2018-11-06 13:27:03', '2541', 'kjhkjhsk'),
(30, 68, 'skjckls', 'lkjkl', 'lkjkl', '', '2018-11-06 19:02:02', '1234', 'klsjxkl'),
(31, 68, 'jkhkh', 'kjhjk', 'kjhjk', '', '2018-11-06 19:02:02', '2536', 'jkhjk'),
(32, 68, 'k', 'jhjkdhc', 'hjsgc', '', '2018-11-06 19:02:02', '2563', 'hjghj');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barangaybenefit`
--

CREATE TABLE `tbl_barangaybenefit` (
  `int_projbenefitID` int(11) NOT NULL,
  `int_brgyreleaseID` int(11) NOT NULL,
  `text_itemReceived` text NOT NULL,
  `int_itemQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_barangaybenefit`
--

INSERT INTO `tbl_barangaybenefit` (`int_projbenefitID`, `int_brgyreleaseID`, `text_itemReceived`, `int_itemQuantity`) VALUES
(16, 19, 'Health Benefit1', 3),
(17, 21, 'School Supplies Benefit1', 10),
(18, 20, 'School Supplies Benefit1', 10),
(19, 23, 'Alaska milk1', 15),
(20, 22, 'Alaska milk1', 15),
(21, 24, 'benefit1', 20),
(22, 25, 'bothannualandnewsponsor1benefit', 2),
(23, 27, 'benefit1', 2),
(24, 26, 'benefit1', 10),
(25, 28, 'newsponsor1foodsuppliesbenefit1', 2),
(26, 30, 'Food Supplies existing sponsor materialbenefit', 10),
(27, 29, 'Food Supplies existing sponsor materialbenefit', 10),
(28, 32, 'benefitsponsor1', 10),
(29, 31, 'benefitsponsor1', 10),
(39, 38, 'Capsules ', 6),
(40, 38, 'Medicine 1', 6),
(41, 38, 'Face Mask', 6),
(42, 37, 'Capsules ', 2),
(43, 37, 'Medicine 1', 2),
(44, 37, 'Face Mask', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barangayreleasing`
--

CREATE TABLE `tbl_barangayreleasing` (
  `int_brgyreleaseID` int(11) NOT NULL,
  `int_projectID` int(11) NOT NULL,
  `int_barangayID` int(11) NOT NULL,
  `varchar_receiversName` varchar(100) DEFAULT NULL,
  `date_claimedBenefit` date DEFAULT NULL,
  `text_imgBenefit` text,
  `enum_barangayReleaseStatus` enum('Releasing','Closed','Claimed Benefit') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_barangayreleasing`
--

INSERT INTO `tbl_barangayreleasing` (`int_brgyreleaseID`, `int_projectID`, `int_barangayID`, `varchar_receiversName`, `date_claimedBenefit`, `text_imgBenefit`, `enum_barangayReleaseStatus`) VALUES
(19, 50, 9, 'Hail Cruzadas', '2018-10-29', NULL, 'Closed'),
(20, 51, 9, 'Hail Cruzadas', '2018-10-29', NULL, 'Closed'),
(21, 51, 2, 'Althea De Jesu', '2018-10-29', NULL, 'Closed'),
(22, 52, 1, 'Aurea Napiza', '2018-10-29', NULL, 'Closed'),
(23, 52, 4, 'Girly Diaz', '2018-10-29', NULL, 'Closed'),
(24, 54, 9, 'Hail Cruzadas', '2018-10-29', NULL, 'Closed'),
(25, 64, 9, 'Hail Cruzadas', '2018-11-06', NULL, 'Closed'),
(26, 65, 4, 'Girly Diaz', '2018-11-06', NULL, 'Closed'),
(27, 65, 9, 'Hail Cruzadas', '2018-11-06', NULL, 'Closed'),
(28, 66, 9, 'Hail Cruzadas', '2018-11-06', NULL, 'Closed'),
(29, 67, 9, 'Hail Cruzadas', '2018-11-06', NULL, 'Closed'),
(30, 67, 4, 'Girly Diaz', '2018-11-06', NULL, 'Closed'),
(31, 68, 9, 'Hail Cruzadas', '2018-11-06', NULL, 'Closed'),
(32, 68, 4, 'Girly Diaz', '2018-11-06', NULL, 'Claimed Benefit'),
(33, 53, 9, NULL, NULL, NULL, 'Releasing'),
(34, 53, 6, NULL, NULL, NULL, 'Releasing'),
(35, 53, 4, NULL, NULL, NULL, 'Releasing'),
(36, 53, 2, NULL, NULL, NULL, 'Releasing'),
(37, 69, 6, 'Claridel Fidel', '2019-02-08', NULL, 'Closed'),
(38, 69, 4, 'Girly Diaz', '2019-02-08', NULL, 'Closed');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_beneficiary`
--

CREATE TABLE `tbl_beneficiary` (
  `int_beneficiaryID` int(11) NOT NULL,
  `varchar_beneficiaryName` varchar(100) NOT NULL,
  `enum_beneficiaryStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `varchar_identityTitle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_beneficiary`
--

INSERT INTO `tbl_beneficiary` (`int_beneficiaryID`, `varchar_beneficiaryName`, `enum_beneficiaryStatus`, `varchar_identityTitle`) VALUES
(1, 'Senior Citizen', 'Active', ''),
(2, 'Person with Disability (PWD)', 'Active', ''),
(3, 'College Student', 'Active', ''),
(4, 'Women and girls', 'Active', ''),
(5, 'Men', 'Active', ''),
(6, 'Elementary Students', 'Active', ''),
(7, 'Mother', 'Active', ''),
(8, 'Pregnant Women', 'Active', ''),
(9, 'Households', 'Active', ''),
(10, 'Retired worker', 'Active', ''),
(11, 'Youths', 'Active', ''),
(12, 'Disaster Victims', 'Active', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `int_categoryID` int(11) NOT NULL,
  `varchar_categoryName` varchar(100) NOT NULL,
  `enum_categoryStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`int_categoryID`, `varchar_categoryName`, `enum_categoryStatus`) VALUES
(1, 'Health', 'Active'),
(2, 'Monetary', 'Active'),
(3, 'Disaster Management', 'Active'),
(4, 'Education', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categorybudget`
--

CREATE TABLE `tbl_categorybudget` (
  `int_categbudID` int(11) NOT NULL,
  `int_budgetID` int(11) NOT NULL,
  `int_categoryID` int(11) NOT NULL,
  `decimal_categBudget` decimal(20,2) NOT NULL,
  `decimal_categRemaining` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_categorybudget`
--

INSERT INTO `tbl_categorybudget` (`int_categbudID`, `int_budgetID`, `int_categoryID`, `decimal_categBudget`, `decimal_categRemaining`) VALUES
(9, 8, 1, '1500000.00', '1497420.00'),
(10, 8, 2, '400000.00', '400000.00'),
(11, 8, 3, '680000.00', '680000.00'),
(12, 8, 4, '130000.00', '130000.00'),
(13, 6, 1, '1500000.00', '1493580.00'),
(14, 6, 2, '1000000.00', '990120.00'),
(15, 6, 3, '1000000.00', '980000.00'),
(16, 6, 4, '1500000.00', '1497390.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_city`
--

CREATE TABLE `tbl_city` (
  `int_cityID` int(11) NOT NULL,
  `varchar_officeName` varchar(100) NOT NULL,
  `varchar_cityName` varchar(100) NOT NULL,
  `text_cityAddress` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_city`
--

INSERT INTO `tbl_city` (`int_cityID`, `varchar_officeName`, `varchar_cityName`, `text_cityAddress`) VALUES
(1, 'Office of the Congresswomen Alexandria Gonzales', 'Mandaluyong City', '315 Maysilo Cir, Mandaluyong, 1550 Metro Manila');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expense`
--

CREATE TABLE `tbl_expense` (
  `int_expenseID` int(11) NOT NULL,
  `int_projectID` int(11) NOT NULL,
  `int_sponsorID` int(11) DEFAULT NULL,
  `text_expenseDescription` text NOT NULL,
  `int_estimatedQuantity` int(11) DEFAULT NULL,
  `decimal_unitPrice` decimal(10,2) NOT NULL,
  `decimal_estimatedAmount` decimal(20,2) DEFAULT NULL,
  `decimal_actualAmount` decimal(20,2) DEFAULT NULL,
  `int_actualQuantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_expense`
--

INSERT INTO `tbl_expense` (`int_expenseID`, `int_projectID`, `int_sponsorID`, `text_expenseDescription`, `int_estimatedQuantity`, `decimal_unitPrice`, `decimal_estimatedAmount`, `decimal_actualAmount`, `int_actualQuantity`) VALUES
(60, 50, NULL, 'Benefit Expense', 20, '180.00', '0.00', '540.00', 3),
(61, 50, NULL, 'Food Expense', NULL, '120.00', NULL, '3600.00', 30),
(62, 51, NULL, 'Benefit Expense', 20, '150.00', '0.00', '600.00', 4),
(63, 51, NULL, 'Food Expense', NULL, '20.00', NULL, '800.00', 40),
(64, 52, NULL, 'Benefit Expense', 30, '120.00', '0.00', '480.00', 4),
(65, 52, NULL, 'Food Expense', NULL, '110.00', NULL, '4400.00', 40),
(66, 53, NULL, 'Benefit Expense', 20, '180.00', '0.00', NULL, NULL),
(67, 54, NULL, 'Benefit Expense', 20, '240.00', '0.00', '480.00', 2),
(68, 54, NULL, 'Food Expense', NULL, '60.00', NULL, '1800.00', 30),
(69, 55, NULL, 'Benefit Expense', 20, '350.00', '7000.00', NULL, NULL),
(70, 56, NULL, 'Benefit Expense', 50, '120.00', '6000.00', NULL, NULL),
(71, 57, NULL, 'Benefit Expense', 30, '220.00', '6600.00', NULL, NULL),
(72, 58, 26, 'Benefit Expense', 10, '900.00', '9000.00', NULL, NULL),
(74, 60, NULL, 'Benefit Expense', 55, '250.00', '13750.00', NULL, NULL),
(76, 62, 29, 'Benefit Expense51', 20, '170.00', '3400.00', NULL, NULL),
(77, 63, NULL, 'Benefit Expense52', 10, '160.00', '1600.00', NULL, NULL),
(78, 64, NULL, 'Benefit Expense', 15, '500.00', '7500.00', '1000.00', 2),
(79, 64, NULL, 'Food Expense', NULL, '35.00', NULL, '210.00', 6),
(80, 65, 32, 'Benefit Expense', 12, '350.00', '4200.00', NULL, NULL),
(81, 66, 33, 'Benefit Expense', 20, '380.00', '7600.00', NULL, NULL),
(82, 67, 33, 'Benefit Expense Food Supplies existing sponsor material', 20, '150.00', '3000.00', NULL, NULL),
(83, 68, 34, 'Benefit Expense', 20, '120.00', '2400.00', NULL, NULL),
(84, 69, NULL, 'Tarpaulin', 4, '450.00', '1800.00', '1800.00', 4),
(85, 69, NULL, 'Benefit Expense', 25, '260.00', '6500.00', '780.00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_familybackground`
--

CREATE TABLE `tbl_familybackground` (
  `int_familybgID` int(11) NOT NULL,
  `int_applicationID` int(11) NOT NULL,
  `varchar_memberFName` varchar(100) NOT NULL,
  `varchar_memberMName` varchar(100) DEFAULT NULL,
  `varchar_memberLName` varchar(100) NOT NULL,
  `enum_civilStatus` enum('Single','Married','Widowed','Divorced/Separated') NOT NULL,
  `text_educationalAttainment` text NOT NULL,
  `varchar_occupation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_financialcontribution`
--

CREATE TABLE `tbl_financialcontribution` (
  `int_financialconID` int(11) NOT NULL,
  `int_applicationID` int(11) NOT NULL,
  `text_finconPurpose` text NOT NULL,
  `varchar_relationship` varchar(100) NOT NULL,
  `enum_frequency` enum('Monthly','Quarterly','Semi Annual','Annual','Irregular') NOT NULL,
  `decimal_annualContribution` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_householdapplication`
--

CREATE TABLE `tbl_householdapplication` (
  `int_applicationID` int(11) NOT NULL,
  `varchar_familyName` varchar(100) NOT NULL,
  `text_homeAddress` text NOT NULL,
  `varchar_representativeName` varchar(100) NOT NULL,
  `varchar_representativeEmailAddress` varchar(50) NOT NULL,
  `varchar_representativeContact` varchar(50) NOT NULL,
  `varchar_validationID` varchar(100) NOT NULL,
  `decimal_totalAnnualIncome` decimal(10,2) NOT NULL,
  `enum_houseStatus` enum('Owned','Rent','Rent to own','Squatter area') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_intentstatement`
--

CREATE TABLE `tbl_intentstatement` (
  `int_statementID` int(11) NOT NULL,
  `int_barangayID` int(11) NOT NULL,
  `int_categoryID` int(11) DEFAULT NULL,
  `int_projectID` int(11) DEFAULT NULL,
  `varchar_statementTitle` varchar(100) NOT NULL,
  `text_statementContent` text NOT NULL,
  `date_createdDate` date NOT NULL,
  `varchar_residentName` varchar(100) NOT NULL,
  `text_residentAddress` text NOT NULL,
  `enum_problemStatus` enum('Submitted','Acknowledged','Solved','Rejected') NOT NULL DEFAULT 'Submitted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_intentstatement`
--

INSERT INTO `tbl_intentstatement` (`int_statementID`, `int_barangayID`, `int_categoryID`, `int_projectID`, `varchar_statementTitle`, `text_statementContent`, `date_createdDate`, `varchar_residentName`, `text_residentAddress`, `enum_problemStatus`) VALUES
(45, 9, 1, 50, 'To help the residents1', 'To help the residents1', '2018-10-29', 'Abigale Del Rosario', '325 Ilaya', 'Solved'),
(46, 2, 4, 51, 'School supplies', 'To help the elementary students', '2018-10-29', 'Jadie Ann Cruz', '132 Barangay', 'Solved'),
(47, 1, 2, 52, 'Goods for the dogs', 'Help the pets of the college students', '2018-10-29', 'Karl Marx', '253 Addition Hills', 'Solved'),
(48, 9, 2, 53, 'Test app for resident monetary', 'Test app for resident monetary', '2018-10-29', 'James Dead', '256 Ilaya', 'Solved'),
(49, 9, 1, 54, 'for the health of residents', 'for the health of residents', '2018-10-29', 'abi', '253 ilaya', 'Solved'),
(53, 2, 1, 56, 'CREATEPROJECTTEST2-HEALTH SPONSOR', 'CREATEPROJECTTEST2-HEALTH SPONSOR', '2018-11-04', 'Chika Muna', '2536 Hulo', 'Solved'),
(54, 2, 4, NULL, 'createprojecttest5', 'createprojecttest5', '2018-11-04', 'jakie', '53 bagong silang', 'Solved'),
(55, 2, 4, 60, 'createprojecttest6newsponsormon', 'createprojecttest6newsponsormon', '2018-11-04', 'kiii', '253', 'Solved'),
(56, 9, 3, NULL, 'CREATEPROJECTTEST50', 'CREATEPROJECTTEST50', '2018-11-04', 'Treu', '253 Ilaya', 'Solved'),
(57, 2, 4, 62, 'CREATEPROJECTTEST51', 'CREATEPROJECTTEST51', '2018-11-04', 'Rosa', '784 Bagong Silang', 'Solved'),
(58, 4, 4, 64, 'bothannualandsponsor01', 'bothannualandsponsor01', '2018-11-06', 'keii', '256', 'Solved'),
(59, 4, 2, 65, 'SPONSOREDLAHAT1', 'SPONSOREDLAHAT1', '2018-11-06', 'Jksds', '35 hulio', 'Solved'),
(60, 9, 2, 66, 'Food supplies giving', 'Food supplies giving', '2018-11-06', 'Gale Del Rosario', '523 Ilaya', 'Solved'),
(61, 9, 2, 67, 'Food Supplies existing sponsor material', 'Food Supplies existing sponsor material', '2018-11-06', 'klei', '323 ilaya', 'Solved'),
(62, 4, 1, 68, 'sponsor test1', 'sponsor test1', '2018-11-06', 'abigale', '253 hulo', 'Solved'),
(63, 6, 1, 69, 'Project: Medical Kit ', 'For the senior citizens.', '2019-02-08', 'Zeus Lorda', '273 Plainview', 'Solved');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `int_notifID` int(11) NOT NULL,
  `int_notifReceiverID` int(11) NOT NULL,
  `int_notifSenderID` int(11) NOT NULL,
  `int_linkID` int(11) NOT NULL,
  `varchar_notifTitle` varchar(100) NOT NULL,
  `text_notifContent` text NOT NULL,
  `enum_notifStatus` enum('New','Read') NOT NULL DEFAULT 'New',
  `enum_notifInfo` enum('Project Application','Problem Statement','Project Proposal','Project Releasing','Proposal Revision') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_officialsaccount`
--

CREATE TABLE `tbl_officialsaccount` (
  `int_officialsuserID` int(11) NOT NULL,
  `int_officialsID` int(11) NOT NULL,
  `int_userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_officialsaccount`
--

INSERT INTO `tbl_officialsaccount` (`int_officialsuserID`, `int_officialsID`, `int_userID`) VALUES
(15, 1, 18),
(16, 1, 20),
(17, 2, 21),
(18, 2, 22),
(19, 3, 23),
(20, 3, 24),
(21, 4, 25),
(22, 4, 26),
(23, 9, 27),
(24, 9, 28),
(25, 6, 29),
(26, 6, 30),
(27, 1, 32),
(28, 1, 17);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_personalinformation`
--

CREATE TABLE `tbl_personalinformation` (
  `int_applicationID` int(11) NOT NULL,
  `varchar_firstName` varchar(100) NOT NULL,
  `varchar_middleName` varchar(100) DEFAULT NULL,
  `varchar_lastName` varchar(100) NOT NULL,
  `date_birthDate` date NOT NULL,
  `enum_gender` enum('Male','Female') NOT NULL,
  `year_applicantResidency` year(4) NOT NULL,
  `enum_civilStatus` enum('Single','Married','Widow/Widower','Separated') NOT NULL,
  `varchar_contactNumber` varchar(100) NOT NULL,
  `varchar_emailAddress` varchar(100) NOT NULL,
  `text_address` text NOT NULL,
  `varchar_validationID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_personalinformation`
--

INSERT INTO `tbl_personalinformation` (`int_applicationID`, `varchar_firstName`, `varchar_middleName`, `varchar_lastName`, `date_birthDate`, `enum_gender`, `year_applicantResidency`, `enum_civilStatus`, `varchar_contactNumber`, `varchar_emailAddress`, `text_address`, `varchar_validationID`) VALUES
(48, 'Abigale ', '', 'Dela Rosa', '1999-06-13', 'Female', 2003, 'Single', '(+63) 568-648-6446', 'abigaledr13@gmail.com', '13 Ilaya', '1245'),
(49, 'Angelik', 'Jom', 'Amore', '2005-06-18', 'Female', 2006, 'Single', '(+63) 956-456-4645', 'abigaledr13@gmail.com', '325 Ilaya', '2541'),
(50, 'Marlon', 'Jems', 'Del La', '2004-02-13', 'Male', 2006, 'Single', '(+63) 956-646-2312', 'marlllon@gmail.com', '133 Ilaya', '7845'),
(55, 'Hayme', 'Gordon', 'James', '2005-02-10', 'Male', 2006, 'Single', '(+63) 915-645-4564', 'kjnckc@gmail.com', '253 Ilaya', '1452'),
(56, 'Kel', 'Eyy', 'Vin', '2006-02-13', 'Male', 2008, 'Single', '(+63) 965-456-4564', 'bhsxj@gmail.com', '478 Ilaya', '2536'),
(57, 'Gale ', 'Hey', 'Dela Rosa', '2003-04-15', 'Female', 0000, 'Single', '(+63) 546-464-5646', 'jkdchkjshjk@gmail.com', '36 Ilaya', '7894'),
(59, 'aju', 'eyy', 'nice', '1997-02-15', 'Male', 1997, 'Single', '(+63) 956-454-6465', 'jsdhkj@gmail.com', '2532', '2145'),
(60, 'hsgj', 'jgjdc', 'hgjg', '2003-02-15', 'Female', 2003, 'Single', '(+63) 956-464-5646', 'kjdck@gmail.com', '546', '2145'),
(61, 'jndjk', 'kjhjkhkj', 'kkhjkh', '1996-01-02', 'Male', 2005, 'Single', '(+63) 546-464-6464', 'kjsdjkw@gmail.com', '564 dcdc', '1425'),
(64, 'kjdchj', 'hjkhskjh', 'kjcskhjk', '2003-02-10', 'Male', 2005, 'Single', '(+63) 625-656-5565', 'jshjkhkjs@gmail.com', '323', '2514'),
(65, 'jjk', 'kjhkh', 'jkhjkhk', '2003-02-10', 'Male', 2003, 'Single', '(+63) 626-565-6565', 'jkhdk@gmail.com', '656', '4785'),
(70, 'Stay', 'Hoo', 'Klaire', '2003-09-18', 'Female', 2005, 'Single', '(+63) 915-326-2665', 'stayklaire@gmail.com', '136 Hulo', '124563'),
(71, 'Athens', 'Goya', 'Hai', '2005-02-13', 'Male', 2009, 'Single', '(+63) 944-544-6446', 'athenshaigoya@gmail.com', '33 Ilaya', '545523'),
(72, 'Hallo', 'Loow', 'Fe', '2006-09-17', 'Female', 2008, 'Single', '(+63) 949-656-5655', 'hallofe@gmail.com', '235 Plainview', '45454'),
(73, 'Hello', 'Yu', 'Hai', '2008-02-15', 'Male', 2010, 'Single', '(+63) 849-959-5959', 'hellohaiyu@gmail.com', '236 Bagong Silang', '3565'),
(74, 'One', 'Karls', 'Mendoza', '2015-02-07', 'Male', 2015, 'Single', '(+63) 546-484-8487', 'onemendozakarls@gmail.com', '2563 Plainview', '5241'),
(75, 'Abby', 'Punz', 'Dela Cruz', '1952-06-05', 'Female', 1955, 'Married', '(+63) 945-565-4156', 'abigaledr13@gmail.com', '256 Plainview', '2541'),
(76, 'Gale', 'Cruz', 'Heyylo', '1975-05-25', 'Female', 2006, 'Single', '(+63) 656-454-5645', 'galeeecruz@gmail.com', '251 Hulo', '5784'),
(77, 'Karl', 'Low', 'Mack', '1965-03-15', 'Male', 1988, 'Single', '(+63) 564-684-8648', 'karlmacklow@gmail.com', '2567 Hulo', '5241');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projectapplicationtype`
--

CREATE TABLE `tbl_projectapplicationtype` (
  `int_proapptypeID` int(11) NOT NULL,
  `int_projectID` int(11) NOT NULL,
  `enum_applicationType` enum('Household','Resident','Barangay') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_projectapplicationtype`
--

INSERT INTO `tbl_projectapplicationtype` (`int_proapptypeID`, `int_projectID`, `enum_applicationType`) VALUES
(49, 50, 'Resident'),
(50, 51, 'Barangay'),
(51, 52, 'Barangay'),
(52, 53, 'Resident'),
(53, 54, 'Barangay'),
(54, 55, 'Resident'),
(55, 56, 'Barangay'),
(56, 57, 'Household'),
(57, 58, 'Resident'),
(59, 60, 'Barangay'),
(61, 62, 'Barangay'),
(62, 63, 'Resident'),
(63, 64, 'Resident'),
(64, 65, 'Barangay'),
(65, 66, 'Resident'),
(66, 67, 'Barangay'),
(67, 68, 'Barangay'),
(68, 69, 'Resident');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projectbeneficiary`
--

CREATE TABLE `tbl_projectbeneficiary` (
  `int_projbeneID` int(11) NOT NULL,
  `int_linkID` int(11) NOT NULL,
  `int_beneficiaryID` int(11) NOT NULL,
  `enum_beneficiaryLink` enum('Intent Statement','Project') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_projectbeneficiary`
--

INSERT INTO `tbl_projectbeneficiary` (`int_projbeneID`, `int_linkID`, `int_beneficiaryID`, `enum_beneficiaryLink`) VALUES
(142, 45, 11, 'Intent Statement'),
(143, 50, 11, 'Project'),
(144, 46, 6, 'Intent Statement'),
(145, 51, 6, 'Project'),
(146, 47, 3, 'Intent Statement'),
(147, 52, 3, 'Project'),
(148, 48, 11, 'Intent Statement'),
(149, 53, 11, 'Project'),
(150, 49, 11, 'Intent Statement'),
(151, 54, 11, 'Project'),
(152, 52, 11, 'Intent Statement'),
(153, 55, 11, 'Project'),
(154, 53, 12, 'Intent Statement'),
(155, 56, 12, 'Project'),
(156, 57, 9, 'Project'),
(157, 58, 11, 'Project'),
(158, 54, 6, 'Intent Statement'),
(159, 59, 6, 'Project'),
(160, 55, 11, 'Intent Statement'),
(161, 60, 11, 'Project'),
(162, 56, 10, 'Intent Statement'),
(163, 61, 10, 'Project'),
(164, 57, 6, 'Intent Statement'),
(165, 62, 6, 'Project'),
(166, 63, 11, 'Project'),
(167, 58, 1, 'Intent Statement'),
(168, 64, 1, 'Project'),
(169, 59, 11, 'Intent Statement'),
(170, 65, 11, 'Project'),
(171, 60, 11, 'Intent Statement'),
(172, 66, 11, 'Project'),
(173, 61, 11, 'Intent Statement'),
(174, 67, 11, 'Project'),
(175, 62, 11, 'Intent Statement'),
(176, 68, 11, 'Project'),
(177, 63, 1, 'Intent Statement'),
(178, 69, 1, 'Project');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projectcategory`
--

CREATE TABLE `tbl_projectcategory` (
  `int_projcategID` int(11) NOT NULL,
  `int_projectID` int(11) NOT NULL,
  `int_categoryID` int(11) NOT NULL,
  `decimal_allotedBudget` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_projectcategory`
--

INSERT INTO `tbl_projectcategory` (`int_projcategID`, `int_projectID`, `int_categoryID`, `decimal_allotedBudget`) VALUES
(61, 50, 1, '5000.00'),
(62, 51, 4, '5000.00'),
(63, 52, 2, '5000.00'),
(64, 53, 2, '5000.00'),
(65, 54, 1, '5000.00'),
(66, 55, 3, '10000.00'),
(67, 56, 1, '0.00'),
(68, 57, 2, '0.00'),
(69, 58, 1, '0.00'),
(71, 60, 4, '0.00'),
(73, 62, 4, '0.00'),
(74, 63, 4, '0.00'),
(75, 64, 4, '5000.00'),
(76, 65, 2, '0.00'),
(77, 66, 2, '0.00'),
(78, 67, 2, '0.00'),
(79, 68, 1, '0.00'),
(80, 69, 1, '10000.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projectdetail`
--

CREATE TABLE `tbl_projectdetail` (
  `int_projectID` int(11) NOT NULL,
  `int_cityID` int(11) NOT NULL,
  `varchar_projectName` varchar(100) NOT NULL,
  `text_projectRationale` text NOT NULL,
  `text_projectDescription` text NOT NULL,
  `text_projectObjective` text NOT NULL,
  `int_allotedSlot` int(11) NOT NULL,
  `date_targetStartApp` date NOT NULL,
  `date_targetEndApp` date NOT NULL,
  `date_targetStartRelease` date NOT NULL,
  `date_targetEndRelease` date NOT NULL,
  `date_targetClosing` date NOT NULL,
  `date_actualStartApp` date DEFAULT NULL,
  `date_actualEndApp` date DEFAULT NULL,
  `date_startReleasing` date DEFAULT NULL,
  `date_endReleasing` date DEFAULT NULL,
  `date_actualClosing` date DEFAULT NULL,
  `date_createdDate` date NOT NULL,
  `decimal_estimatedBudget` decimal(20,2) NOT NULL,
  `decimal_appropriatedBudget` decimal(20,2) NOT NULL,
  `decimal_actualBudget` decimal(20,2) DEFAULT NULL,
  `enum_projectStatus` enum('Created','Ongoing','Closed Application','Releasing','Closed Releasing','Finished','Terminated') NOT NULL DEFAULT 'Created'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_projectdetail`
--

INSERT INTO `tbl_projectdetail` (`int_projectID`, `int_cityID`, `varchar_projectName`, `text_projectRationale`, `text_projectDescription`, `text_projectObjective`, `int_allotedSlot`, `date_targetStartApp`, `date_targetEndApp`, `date_targetStartRelease`, `date_targetEndRelease`, `date_targetClosing`, `date_actualStartApp`, `date_actualEndApp`, `date_startReleasing`, `date_endReleasing`, `date_actualClosing`, `date_createdDate`, `decimal_estimatedBudget`, `decimal_appropriatedBudget`, `decimal_actualBudget`, `enum_projectStatus`) VALUES
(50, 1, ' To help the residents1   ', 'To help the residents1', 'To help the residents1', 'To help the residents1', 20, '2018-10-31', '2018-11-14', '2018-11-17', '2018-11-17', '2018-11-27', '2018-10-29', '2018-10-29', '2018-10-29', '2018-10-29', '2018-10-29', '2018-10-29', '0.00', '5000.00', '4140.00', 'Finished'),
(51, 1, ' School supplies   ', 'To help the elementary students', 'To help the elementary students', 'To help the elementary students', 20, '2018-10-31', '2018-11-07', '2018-11-13', '2018-11-13', '2018-11-17', '2018-10-29', '2018-10-29', '2018-10-29', '2018-10-29', '2018-10-29', '2018-10-29', '0.00', '5000.00', '1400.00', 'Finished'),
(52, 1, ' Goods for the dogs   ', 'Help the pets of the college students', 'Help the pets of the college students', 'Help the pets of the college students', 30, '2018-10-31', '2018-11-08', '2018-11-20', '2018-11-20', '2018-11-30', '2018-10-29', '2018-10-29', '2018-10-29', '2018-10-29', '2018-10-29', '2018-10-29', '0.00', '5000.00', '4880.00', 'Finished'),
(53, 1, ' Test app for resident monetary   ', 'Test app for resident monetary', 'Test app for resident monetary', 'Test app for resident monetary', 20, '2018-10-30', '2018-11-14', '2018-11-17', '2018-11-17', '2018-11-21', '2018-10-29', '2019-02-08', NULL, NULL, NULL, '2018-10-29', '0.00', '5000.00', NULL, 'Closed Application'),
(54, 1, ' for the health of residents   ', 'for the health of residents', 'for the health of residents', 'for the health of residents', 20, '2018-10-30', '2018-11-14', '2018-11-19', '2018-11-19', '2018-11-23', '2018-10-29', '2018-10-29', '2018-10-29', '2018-10-29', '2018-10-29', '2018-10-29', '0.00', '5000.00', '2280.00', 'Finished'),
(55, 1, 'GUMANAKAPROJECT1-DM', 'GUMANAKAPROJECT1-DM', 'GUMANAKAPROJECT1-DM', 'GUMANAKAPROJECT1-DM', 20, '2018-11-07', '2018-11-22', '2018-11-26', '2018-11-26', '2018-11-30', NULL, NULL, NULL, NULL, NULL, '2018-11-04', '350.00', '10000.00', NULL, 'Created'),
(56, 1, ' CREATEPROJECTTEST2-HEALTH SPONSOR   ', 'CREATEPROJECTTEST2-HEALTH SPONSOR', 'CREATEPROJECTTEST2-HEALTH SPONSOR', 'CREATEPROJECTTEST2-HEALTH SPONSOR', 50, '2018-11-06', '2018-11-22', '2018-11-26', '2018-11-26', '2018-11-29', NULL, NULL, NULL, NULL, NULL, '2018-11-04', '120.00', '0.00', NULL, 'Created'),
(57, 1, 'CREATEPROJECTTEST3-monetary', 'CREATEPROJECTTEST3-monetary', 'CREATEPROJECTTEST3-monetary', 'CREATEPROJECTTEST3-monetary', 30, '2018-11-06', '2018-11-21', '2018-11-26', '2018-11-26', '2018-11-29', NULL, NULL, NULL, NULL, NULL, '2018-11-04', '220.00', '0.00', NULL, 'Created'),
(58, 1, 'CREATEPROJECT4MATERIALNEWSPONSOR', 'CREATEPROJECT4MATERIALNEWSPONSOR', 'CREATEPROJECT4MATERIALNEWSPONSOR', 'CREATEPROJECT4MATERIALNEWSPONSOR', 10, '2018-11-06', '2018-11-22', '2018-11-24', '2018-11-24', '2018-11-27', NULL, NULL, NULL, NULL, NULL, '2018-11-04', '900.00', '0.00', NULL, 'Created'),
(60, 1, ' createprojecttest6newsponsormon   ', ' createprojecttest6newsponsormon   ', ' createprojecttest6newsponsormon   ', ' createprojecttest6newsponsormon   ', 55, '2018-11-06', '2018-11-21', '2018-11-23', '2018-11-23', '2018-11-26', NULL, NULL, NULL, NULL, NULL, '2018-11-04', '250.00', '0.00', NULL, 'Created'),
(62, 1, ' CREATEPROJECTTEST51   ', 'CREATEPROJECTTEST51', 'CREATEPROJECTTEST51', 'CREATEPROJECTTEST51', 20, '2018-11-07', '2018-11-22', '2018-11-26', '2018-11-26', '2018-11-29', NULL, NULL, NULL, NULL, NULL, '2018-11-04', '170.00', '0.00', NULL, 'Created'),
(63, 1, 'PROJECT52', 'PROJECT52', 'PROJECT52', 'PROJECT52', 10, '2018-11-08', '2018-11-15', '2018-11-19', '2018-11-19', '2018-11-22', NULL, NULL, NULL, NULL, NULL, '2018-11-05', '160.00', '0.00', NULL, 'Created'),
(64, 1, ' bothannualandsponsor01   ', 'bothannualandsponsor01', 'cityprojmsoffice', 'cityprojmsoffice', 15, '2018-11-09', '2018-11-21', '2018-11-27', '2018-11-27', '2018-11-30', '2018-11-06', '2018-11-06', '2018-11-06', '2018-11-06', '2018-11-06', '2018-11-06', '500.00', '5000.00', '1210.00', 'Finished'),
(65, 1, ' SPONSOREDLAHAT1   ', 'SPONSOREDLAHAT1', 'SPONSOREDLAHAT1', 'SPONSOREDLAHAT1', 12, '2018-11-09', '2018-11-20', '2018-11-22', '2018-11-22', '2018-11-27', '2018-11-06', '2018-11-06', '2018-11-06', '2018-11-06', '2018-11-06', '2018-11-06', '350.00', '0.00', NULL, 'Finished'),
(66, 1, ' Food supplies giving   ', 'Food supplies giving', 'Food supplies giving', 'Food supplies giving', 20, '2018-11-09', '2018-11-21', '2018-11-24', '2018-11-24', '2018-11-27', '2018-11-06', '2018-11-06', '2018-11-06', '2018-11-06', '2018-11-06', '2018-11-06', '380.00', '0.00', NULL, 'Finished'),
(67, 1, ' Food Supplies existing sponsor material   ', 'Food Supplies existing sponsor material', 'Food Supplies existing sponsor material', 'Food Supplies existing sponsor material', 20, '2018-11-09', '2018-11-21', '2018-11-24', '2018-11-24', '2018-11-27', '2018-11-06', '2018-11-06', '2018-11-06', '2018-11-06', '2018-11-06', '2018-11-06', '150.00', '0.00', NULL, 'Finished'),
(68, 1, ' sponsor test1   ', 'sponsor test1', 'sponsor test1', 'sponsor test1', 20, '2018-11-09', '2018-11-21', '2018-11-24', '2018-11-24', '2018-11-27', '2018-11-06', '2018-11-06', '2018-11-06', NULL, NULL, '2018-11-06', '120.00', '0.00', NULL, 'Releasing'),
(69, 1, ' Project: Medical Kit    ', 'For the senior citizens.', 'To help the senior citizens. For the senior citizens.', 'To help the senior citizens.', 25, '2019-02-10', '2019-02-15', '2019-02-17', '2019-02-17', '2019-02-20', '2019-02-08', '2019-02-08', '2019-02-08', '2019-02-08', '2019-02-08', '2019-02-09', '8300.00', '10000.00', '2580.00', 'Finished');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projectreason`
--

CREATE TABLE `tbl_projectreason` (
  `int_projectReasonID` int(11) NOT NULL,
  `int_projectID` int(11) NOT NULL,
  `text_projectReason` text NOT NULL,
  `enum_projectPhase` enum('Start Application','Close Application','Start Releasing','Close Releasing','Close Project') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_projectreason`
--

INSERT INTO `tbl_projectreason` (`int_projectReasonID`, `int_projectID`, `text_projectReason`, `enum_projectPhase`) VALUES
(59, 50, 'jkkxs', 'Start Application'),
(60, 50, 'jckschs', 'Close Application'),
(61, 50, 'jgkjg', 'Start Releasing'),
(62, 50, 'jkkh', 'Close Releasing'),
(63, 51, 'kjksdjls', 'Start Application'),
(64, 51, 'sjksxks', 'Close Application'),
(65, 51, 'jkhk', 'Start Releasing'),
(66, 51, 'jkhkj', 'Close Releasing'),
(67, 51, 'jks', 'Close Releasing'),
(68, 52, 'kjll', 'Start Application'),
(69, 52, 'kljlj', 'Close Application'),
(70, 52, 'kjhk', 'Start Releasing'),
(71, 52, 'hjkhjk', 'Close Releasing'),
(72, 52, 'jhk', 'Close Releasing'),
(73, 53, 'jhjjk', 'Start Application'),
(74, 54, 'jdhfjej', 'Start Application'),
(75, 54, 'khfkhsk', 'Close Application'),
(76, 54, 'idfidhc', 'Start Releasing'),
(77, 54, 'uidhfuidhc', 'Close Releasing'),
(78, 64, 'gfgfh\r\n', 'Start Application'),
(79, 64, 'jbjb', 'Close Application'),
(80, 64, 'jhjkhjk', 'Start Releasing'),
(81, 64, 'hkhj', 'Close Releasing'),
(82, 65, 'huhi', 'Start Application'),
(83, 65, 'hjih', 'Close Application'),
(84, 65, 'ghjk', 'Start Releasing'),
(85, 65, 'hjuik', 'Close Releasing'),
(86, 65, 'jkhkj', 'Close Releasing'),
(87, 66, 'ijijoi', 'Start Application'),
(88, 66, 'khiu', 'Close Application'),
(89, 66, 'khdkhs', 'Start Releasing'),
(90, 66, 'sisjx', 'Close Releasing'),
(91, 67, 'jlkjlk', 'Start Application'),
(92, 67, 'ededw', 'Close Application'),
(93, 67, 'jkdckdl', 'Start Releasing'),
(94, 67, 'jkhkj', 'Close Releasing'),
(95, 67, 'sjkhjks', 'Close Releasing'),
(96, 68, 'suysix', 'Start Application'),
(97, 68, 'jhjxks', 'Close Application'),
(98, 68, 'gjkgkgk', 'Start Releasing'),
(99, 68, 'jgj', 'Close Releasing'),
(100, 69, 'Due to early change of schedule.', 'Start Application'),
(101, 53, 'Due to early dates', 'Close Application'),
(102, 69, 'change sched', 'Close Application'),
(103, 69, 'change sched', 'Start Releasing'),
(104, 69, 'change sched', 'Close Releasing'),
(105, 69, 'knxjls', 'Close Releasing');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projectrequirement`
--

CREATE TABLE `tbl_projectrequirement` (
  `int_projreqID` int(11) NOT NULL,
  `int_requirementID` int(11) NOT NULL,
  `int_projectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_projectrequirement`
--

INSERT INTO `tbl_projectrequirement` (`int_projreqID`, `int_requirementID`, `int_projectID`) VALUES
(60, 1, 50),
(61, 14, 50),
(62, 14, 51),
(63, 14, 52),
(64, 14, 53),
(65, 14, 54),
(66, 1, 55),
(67, 14, 55),
(68, 14, 56),
(69, 14, 57),
(70, 14, 58),
(73, 1, 60),
(75, 1, 62),
(76, 14, 62),
(77, 13, 63),
(78, 14, 64),
(79, 14, 65),
(80, 14, 66),
(81, 14, 67),
(82, 14, 68),
(83, 14, 69);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_projectsponsor`
--

CREATE TABLE `tbl_projectsponsor` (
  `int_projsponID` int(11) NOT NULL,
  `int_projectID` int(11) NOT NULL,
  `int_sponsorID` int(11) NOT NULL,
  `decimal_sponsorBudget` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_projectsponsor`
--

INSERT INTO `tbl_projectsponsor` (`int_projsponID`, `int_projectID`, `int_sponsorID`, `decimal_sponsorBudget`) VALUES
(1, 56, 25, '10000.00'),
(2, 57, 1, '8000.00'),
(3, 60, 27, '15000.00'),
(4, 62, 29, '5000.00'),
(5, 64, 31, '5000.00'),
(6, 65, 32, '5000.00'),
(7, 66, 33, '10000.00'),
(8, 68, 34, '10000.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_requirement`
--

CREATE TABLE `tbl_requirement` (
  `int_requirementID` int(11) NOT NULL,
  `varchar_requirementName` varchar(100) NOT NULL,
  `enum_requirementStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_requirement`
--

INSERT INTO `tbl_requirement` (`int_requirementID`, `varchar_requirementName`, `enum_requirementStatus`) VALUES
(1, 'Birth Certificate', 'Active'),
(2, 'Transcript of Records/ Diploma', 'Active'),
(3, 'NBI Clearance', 'Active'),
(4, 'SSS', 'Active'),
(5, 'Pag-IBIG', 'Active'),
(6, 'Philhealth', 'Active'),
(7, 'BIR forms', 'Active'),
(8, 'Valid Driver’s License', 'Active'),
(9, 'Valid Passport', 'Active'),
(10, 'Baptismal Certificate', 'Active'),
(11, 'Marriage Certificate', 'Active'),
(12, 'Barangay Certificate of Residency', 'Active'),
(13, 'Utility Bill/s', 'Active'),
(14, 'Valid ID', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_residentrepresentative`
--

CREATE TABLE `tbl_residentrepresentative` (
  `int_applicationID` int(11) NOT NULL,
  `varchar_representativeName` varchar(100) NOT NULL,
  `varchar_representativesRelation` varchar(100) NOT NULL,
  `text_representativeReason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_residentrepresentative`
--

INSERT INTO `tbl_residentrepresentative` (`int_applicationID`, `varchar_representativeName`, `varchar_representativesRelation`, `text_representativeReason`) VALUES
(49, 'Hale', 'Kaja', 'Busy'),
(60, 'Hale', 'Kaja', 'dsds'),
(65, 'huh', 'huh', 'isjdi');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sponsordetail`
--

CREATE TABLE `tbl_sponsordetail` (
  `int_sponsorID` int(11) NOT NULL,
  `varchar_sponsorName` varchar(100) NOT NULL,
  `varchar_sponsorContact` varchar(100) NOT NULL,
  `varchar_sponsorEmailAdd` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sponsordetail`
--

INSERT INTO `tbl_sponsordetail` (`int_sponsorID`, `varchar_sponsorName`, `varchar_sponsorContact`, `varchar_sponsorEmailAdd`) VALUES
(1, 'Unilever', '+632 588 8888', 'cec.philippines@unilever.com'),
(2, 'P&G: Procter & Gamble ', '+632 894 39 55', 'depadua.d@pg.com'),
(3, 'Alaska Milk Corporation (AMC)', '+63 2 638 1122', 'consumer@alaskamilk.com'),
(20, '', '', ''),
(21, 'ExampleSponsor1', 'ExampleSponsor1@gmail.com', '09125632412'),
(22, '', '', ''),
(23, 'Sposor1', 'Sposor1@gmail.com', '09152345892'),
(24, '', '', ''),
(25, 'SPONSORHEALTH1', 'sponsor1@gmail.com', '09253698451'),
(26, 'NEWSPONSOR2', 'sponsor2@gmail.com', '09125632596'),
(27, 'SPONSOR3NABA', 'SPONSOR3NABA@gmail.com', '09253645785'),
(28, '', '', ''),
(29, 'SPONSOR51', 'SPONSOR51@gmail.com', '091254125362'),
(30, 'sponsor52', 'sponsor52@gmail.com', '0912536541'),
(31, 'bothannualandnewsponsor1', 'bothannualandnewsponsor1@gmail.com', '09152457896'),
(32, 'SPONSOREDLAHAT1', 'SPONSOREDLAHAT1@gmail.com', '09152365482'),
(33, 'newsponsor1foodsupplies', 'newsponsor1foodsupplies@gmail.com', '09225631452'),
(34, 'si mam nayre', 'nayre@gmail.com', '09124563253'),
(35, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_unitmeasure`
--

CREATE TABLE `tbl_unitmeasure` (
  `int_unitMeasureID` int(11) NOT NULL,
  `varchar_unitName` varchar(100) NOT NULL,
  `char_unitSymbol` char(10) NOT NULL,
  `enum_unitStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_unitmeasure`
--

INSERT INTO `tbl_unitmeasure` (`int_unitMeasureID`, `varchar_unitName`, `char_unitSymbol`, `enum_unitStatus`) VALUES
(1, 'Piece', 'pc', 'Active'),
(2, 'Box', 'box', 'Active'),
(3, 'Kilogram', 'kg', 'Active'),
(4, 'Pound', 'lbs', 'Active'),
(5, 'Liter', 'L', 'Active'),
(6, 'Sack', 'sack', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `int_userID` int(11) NOT NULL,
  `varchar_userEmailAddress` varchar(100) NOT NULL,
  `varchar_userPassword` varchar(100) NOT NULL,
  `enum_userType` enum('Barangay Staff','Office Staff','Budget Office Staff') NOT NULL DEFAULT 'Barangay Staff',
  `text_userName` text NOT NULL,
  `text_userAddress` text NOT NULL,
  `varchar_userContact` text NOT NULL,
  `varchar_userPosition` varchar(100) NOT NULL,
  `enum_accountStatus` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`int_userID`, `varchar_userEmailAddress`, `varchar_userPassword`, `enum_userType`, `text_userName`, `text_userAddress`, `varchar_userContact`, `varchar_userPosition`, `enum_accountStatus`) VALUES
(4, 'budget@gmail.com', 'budget', 'Budget Office Staff', 'Jayce Calucin', '19 Maganda St., Buli, Mandaluyong City', '+63 978 765 1827', 'PIO', 'Active'),
(17, 'cityprojmsoffice@gmail.com', 'cityprojmsoffice', 'Office Staff', 'Bruno Dela Rosa', '235 Boni Mandaluyong City', '09125242121', 'PIO', 'Active'),
(18, 'additionhills@gmail.com', 'additionhills', 'Barangay Staff', 'Aurea Napiza', '233 Addition Hills Mandaluyong City', '09124211295', 'PIO', 'Active'),
(20, 'additionhills2@gmail.com', 'additionhills2', 'Barangay Staff', 'Fernando Go', '255 Additional Hills Mandaluyong City', '09152227569', 'PIO', 'Active'),
(21, 'bagongsilang@gmail.com', 'bagongsilang', 'Barangay Staff', 'Althea De Jesu', '12 Bagong Silang Mandaluyong City', '09175986321', 'PIO', 'Active'),
(22, 'bagongsilang2@gmail.com', 'bagongsilang2', 'Barangay Staff', 'Bea Cruz', '2577 Bagong Silang Mandaluyong City', '09452231956', 'PIO', 'Active'),
(23, 'barangkadrive@gmail.com', 'barangkadrive', 'Barangay Staff', 'Mars Mendoza', '278 Barangka Drive Mandaluyong City', '09452218754', 'PIO', 'Active'),
(24, 'barangkadrive2@gmail.com', 'barangkadrive2', 'Barangay Staff', 'Gil Madami', '275 Barangka Drive Mandaluyong City', '09452133395', 'PIO', 'Active'),
(25, 'hulo@gmail.com', 'hulo', 'Barangay Staff', 'Girly Diaz', '885 Hulo Mandaluyong City', '09412325695', 'PIO', 'Active'),
(26, 'hulo2@gmail.com', 'hulo2', 'Barangay Staff', 'Marilou Chavez', '774 Hulo Mandaluyong City', '09235689564', 'PIO', 'Active'),
(27, 'ilaya@gmail.com', 'ilaya', 'Barangay Staff', 'Hail Cruzadas', '253 Ilaya Mandaluyong City', '09263596212', 'PIO', 'Active'),
(28, 'ilaya2@gmail.com', 'ilaya2', 'Barangay Staff', 'Hannah Dela Sal', '596 Ilaya Mandaluyong City', '09152364895', 'PIO', 'Active'),
(29, 'plainview@gmail.com', 'plainview', 'Barangay Staff', 'Claridel Fidel', '232 Plainview Mandaluyong City', '09185562312', 'PIO', 'Active'),
(30, 'plainview2@gmail.com', 'plainview2', 'Barangay Staff', 'Jose Paul Damian', '785 Plainview Mandaluyong City', '09123556985', 'PIO', 'Active'),
(31, 'budget1@gmail.com', 'budget1', 'Budget Office Staff', 'Ram Santosa', '537 Ilaya Mandaluyong City', '09253156231', 'Staff', 'Active'),
(32, 'office1@gmail.com', 'office1', 'Office Staff', 'Von Dutch', '693 Plainview Mandaluyong', '09123697589', 'Staff', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_annualbudget`
--
ALTER TABLE `tbl_annualbudget`
  ADD PRIMARY KEY (`int_budgetID`),
  ADD KEY `cityBudget_idx` (`int_cityID`);

--
-- Indexes for table `tbl_applicantbenefit`
--
ALTER TABLE `tbl_applicantbenefit`
  ADD PRIMARY KEY (`int_appbeneID`),
  ADD KEY `appbene_idx` (`int_projectID`);

--
-- Indexes for table `tbl_application`
--
ALTER TABLE `tbl_application`
  ADD PRIMARY KEY (`int_applicationID`),
  ADD KEY `appbrgy_idx` (`int_barangayID`),
  ADD KEY `appproj_idx` (`int_projectID`);

--
-- Indexes for table `tbl_applicationrequirement`
--
ALTER TABLE `tbl_applicationrequirement`
  ADD PRIMARY KEY (`int_appreqID`),
  ADD KEY `appreqapp_idx` (`int_applicationID`),
  ADD KEY `appreqreq_idx` (`int_requirementID`);

--
-- Indexes for table `tbl_barangay`
--
ALTER TABLE `tbl_barangay`
  ADD PRIMARY KEY (`int_barangayID`),
  ADD KEY `brgycity_idx` (`int_cityID`);

--
-- Indexes for table `tbl_barangayapplication`
--
ALTER TABLE `tbl_barangayapplication`
  ADD PRIMARY KEY (`int_applicationID`);

--
-- Indexes for table `tbl_barangaybeneficiary`
--
ALTER TABLE `tbl_barangaybeneficiary`
  ADD PRIMARY KEY (`int_brgybeneID`),
  ADD KEY `brgybeneapp_idx` (`int_applicationID`);

--
-- Indexes for table `tbl_barangaybenefit`
--
ALTER TABLE `tbl_barangaybenefit`
  ADD PRIMARY KEY (`int_projbenefitID`);

--
-- Indexes for table `tbl_barangayreleasing`
--
ALTER TABLE `tbl_barangayreleasing`
  ADD PRIMARY KEY (`int_brgyreleaseID`);

--
-- Indexes for table `tbl_beneficiary`
--
ALTER TABLE `tbl_beneficiary`
  ADD PRIMARY KEY (`int_beneficiaryID`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`int_categoryID`);

--
-- Indexes for table `tbl_categorybudget`
--
ALTER TABLE `tbl_categorybudget`
  ADD PRIMARY KEY (`int_categbudID`);

--
-- Indexes for table `tbl_city`
--
ALTER TABLE `tbl_city`
  ADD PRIMARY KEY (`int_cityID`);

--
-- Indexes for table `tbl_expense`
--
ALTER TABLE `tbl_expense`
  ADD PRIMARY KEY (`int_expenseID`),
  ADD KEY `expproj_idx` (`int_projectID`);

--
-- Indexes for table `tbl_familybackground`
--
ALTER TABLE `tbl_familybackground`
  ADD PRIMARY KEY (`int_familybgID`),
  ADD KEY `fambghouse_idx` (`int_applicationID`);

--
-- Indexes for table `tbl_financialcontribution`
--
ALTER TABLE `tbl_financialcontribution`
  ADD PRIMARY KEY (`int_financialconID`),
  ADD KEY `finconapp_idx` (`int_applicationID`);

--
-- Indexes for table `tbl_householdapplication`
--
ALTER TABLE `tbl_householdapplication`
  ADD PRIMARY KEY (`int_applicationID`);

--
-- Indexes for table `tbl_intentstatement`
--
ALTER TABLE `tbl_intentstatement`
  ADD PRIMARY KEY (`int_statementID`),
  ADD KEY `intstatebrgy_idx` (`int_barangayID`),
  ADD KEY `intstatecateg_idx` (`int_categoryID`),
  ADD KEY `instateprooj_idx` (`int_projectID`);

--
-- Indexes for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`int_notifID`),
  ADD KEY `userreceive_idx` (`int_notifReceiverID`),
  ADD KEY `usersend_idx` (`int_notifSenderID`);

--
-- Indexes for table `tbl_officialsaccount`
--
ALTER TABLE `tbl_officialsaccount`
  ADD PRIMARY KEY (`int_officialsuserID`),
  ADD KEY `brgyid_idx` (`int_officialsID`),
  ADD KEY `userid_idx` (`int_userID`);

--
-- Indexes for table `tbl_personalinformation`
--
ALTER TABLE `tbl_personalinformation`
  ADD PRIMARY KEY (`int_applicationID`);

--
-- Indexes for table `tbl_projectapplicationtype`
--
ALTER TABLE `tbl_projectapplicationtype`
  ADD PRIMARY KEY (`int_proapptypeID`),
  ADD KEY `projapptype_idx` (`int_projectID`);

--
-- Indexes for table `tbl_projectbeneficiary`
--
ALTER TABLE `tbl_projectbeneficiary`
  ADD PRIMARY KEY (`int_projbeneID`),
  ADD KEY `beneid_idx` (`int_beneficiaryID`);

--
-- Indexes for table `tbl_projectcategory`
--
ALTER TABLE `tbl_projectcategory`
  ADD PRIMARY KEY (`int_projcategID`),
  ADD KEY `projcateg_idx` (`int_projectID`),
  ADD KEY `categid_idx` (`int_categoryID`);

--
-- Indexes for table `tbl_projectdetail`
--
ALTER TABLE `tbl_projectdetail`
  ADD PRIMARY KEY (`int_projectID`),
  ADD KEY `cityid_idx` (`int_cityID`);

--
-- Indexes for table `tbl_projectreason`
--
ALTER TABLE `tbl_projectreason`
  ADD PRIMARY KEY (`int_projectReasonID`),
  ADD KEY `projid_idx` (`int_projectID`);

--
-- Indexes for table `tbl_projectrequirement`
--
ALTER TABLE `tbl_projectrequirement`
  ADD PRIMARY KEY (`int_projreqID`),
  ADD KEY `proreqid_idx` (`int_projectID`),
  ADD KEY `projreqreq_idx` (`int_requirementID`);

--
-- Indexes for table `tbl_projectsponsor`
--
ALTER TABLE `tbl_projectsponsor`
  ADD PRIMARY KEY (`int_projsponID`);

--
-- Indexes for table `tbl_requirement`
--
ALTER TABLE `tbl_requirement`
  ADD PRIMARY KEY (`int_requirementID`);

--
-- Indexes for table `tbl_residentrepresentative`
--
ALTER TABLE `tbl_residentrepresentative`
  ADD PRIMARY KEY (`int_applicationID`);

--
-- Indexes for table `tbl_sponsordetail`
--
ALTER TABLE `tbl_sponsordetail`
  ADD PRIMARY KEY (`int_sponsorID`);

--
-- Indexes for table `tbl_unitmeasure`
--
ALTER TABLE `tbl_unitmeasure`
  ADD PRIMARY KEY (`int_unitMeasureID`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`int_userID`),
  ADD UNIQUE KEY `varchar_userEmailAddress` (`varchar_userEmailAddress`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_annualbudget`
--
ALTER TABLE `tbl_annualbudget`
  MODIFY `int_budgetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_applicantbenefit`
--
ALTER TABLE `tbl_applicantbenefit`
  MODIFY `int_appbeneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `tbl_application`
--
ALTER TABLE `tbl_application`
  MODIFY `int_applicationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `tbl_applicationrequirement`
--
ALTER TABLE `tbl_applicationrequirement`
  MODIFY `int_appreqID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `tbl_barangay`
--
ALTER TABLE `tbl_barangay`
  MODIFY `int_barangayID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_barangaybeneficiary`
--
ALTER TABLE `tbl_barangaybeneficiary`
  MODIFY `int_brgybeneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_barangaybenefit`
--
ALTER TABLE `tbl_barangaybenefit`
  MODIFY `int_projbenefitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_barangayreleasing`
--
ALTER TABLE `tbl_barangayreleasing`
  MODIFY `int_brgyreleaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbl_beneficiary`
--
ALTER TABLE `tbl_beneficiary`
  MODIFY `int_beneficiaryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `int_categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_categorybudget`
--
ALTER TABLE `tbl_categorybudget`
  MODIFY `int_categbudID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_city`
--
ALTER TABLE `tbl_city`
  MODIFY `int_cityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_expense`
--
ALTER TABLE `tbl_expense`
  MODIFY `int_expenseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `tbl_familybackground`
--
ALTER TABLE `tbl_familybackground`
  MODIFY `int_familybgID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_financialcontribution`
--
ALTER TABLE `tbl_financialcontribution`
  MODIFY `int_financialconID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_intentstatement`
--
ALTER TABLE `tbl_intentstatement`
  MODIFY `int_statementID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `int_notifID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_officialsaccount`
--
ALTER TABLE `tbl_officialsaccount`
  MODIFY `int_officialsuserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tbl_projectapplicationtype`
--
ALTER TABLE `tbl_projectapplicationtype`
  MODIFY `int_proapptypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tbl_projectbeneficiary`
--
ALTER TABLE `tbl_projectbeneficiary`
  MODIFY `int_projbeneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `tbl_projectcategory`
--
ALTER TABLE `tbl_projectcategory`
  MODIFY `int_projcategID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `tbl_projectdetail`
--
ALTER TABLE `tbl_projectdetail`
  MODIFY `int_projectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `tbl_projectreason`
--
ALTER TABLE `tbl_projectreason`
  MODIFY `int_projectReasonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `tbl_projectrequirement`
--
ALTER TABLE `tbl_projectrequirement`
  MODIFY `int_projreqID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `tbl_projectsponsor`
--
ALTER TABLE `tbl_projectsponsor`
  MODIFY `int_projsponID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_requirement`
--
ALTER TABLE `tbl_requirement`
  MODIFY `int_requirementID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_sponsordetail`
--
ALTER TABLE `tbl_sponsordetail`
  MODIFY `int_sponsorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tbl_unitmeasure`
--
ALTER TABLE `tbl_unitmeasure`
  MODIFY `int_unitMeasureID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `int_userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_annualbudget`
--
ALTER TABLE `tbl_annualbudget`
  ADD CONSTRAINT `cityBudget` FOREIGN KEY (`int_cityID`) REFERENCES `tbl_city` (`int_cityID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_applicantbenefit`
--
ALTER TABLE `tbl_applicantbenefit`
  ADD CONSTRAINT `appbene` FOREIGN KEY (`int_projectID`) REFERENCES `tbl_projectdetail` (`int_projectID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_application`
--
ALTER TABLE `tbl_application`
  ADD CONSTRAINT `appbrgy` FOREIGN KEY (`int_barangayID`) REFERENCES `tbl_barangay` (`int_barangayID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appproj` FOREIGN KEY (`int_projectID`) REFERENCES `tbl_projectdetail` (`int_projectID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_applicationrequirement`
--
ALTER TABLE `tbl_applicationrequirement`
  ADD CONSTRAINT `appreqapp` FOREIGN KEY (`int_applicationID`) REFERENCES `tbl_application` (`int_applicationID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appreqreq` FOREIGN KEY (`int_requirementID`) REFERENCES `tbl_requirement` (`int_requirementID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_barangay`
--
ALTER TABLE `tbl_barangay`
  ADD CONSTRAINT `brgycity` FOREIGN KEY (`int_cityID`) REFERENCES `tbl_city` (`int_cityID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_barangayapplication`
--
ALTER TABLE `tbl_barangayapplication`
  ADD CONSTRAINT `brgyappapp` FOREIGN KEY (`int_applicationID`) REFERENCES `tbl_application` (`int_applicationID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_barangaybeneficiary`
--
ALTER TABLE `tbl_barangaybeneficiary`
  ADD CONSTRAINT `brgybeneapp` FOREIGN KEY (`int_applicationID`) REFERENCES `tbl_barangayapplication` (`int_applicationID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_expense`
--
ALTER TABLE `tbl_expense`
  ADD CONSTRAINT `expproj` FOREIGN KEY (`int_projectID`) REFERENCES `tbl_projectdetail` (`int_projectID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_familybackground`
--
ALTER TABLE `tbl_familybackground`
  ADD CONSTRAINT `fambghouse` FOREIGN KEY (`int_applicationID`) REFERENCES `tbl_householdapplication` (`int_applicationID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_financialcontribution`
--
ALTER TABLE `tbl_financialcontribution`
  ADD CONSTRAINT `finconapp` FOREIGN KEY (`int_applicationID`) REFERENCES `tbl_householdapplication` (`int_applicationID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_householdapplication`
--
ALTER TABLE `tbl_householdapplication`
  ADD CONSTRAINT `houseapp` FOREIGN KEY (`int_applicationID`) REFERENCES `tbl_application` (`int_applicationID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_intentstatement`
--
ALTER TABLE `tbl_intentstatement`
  ADD CONSTRAINT `instateprooj` FOREIGN KEY (`int_projectID`) REFERENCES `tbl_projectdetail` (`int_projectID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `intstatebrgy` FOREIGN KEY (`int_barangayID`) REFERENCES `tbl_barangay` (`int_barangayID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `intstatecateg` FOREIGN KEY (`int_categoryID`) REFERENCES `tbl_category` (`int_categoryID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD CONSTRAINT `userreceive` FOREIGN KEY (`int_notifReceiverID`) REFERENCES `tbl_user` (`int_userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usersend` FOREIGN KEY (`int_notifSenderID`) REFERENCES `tbl_user` (`int_userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_officialsaccount`
--
ALTER TABLE `tbl_officialsaccount`
  ADD CONSTRAINT `userid` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_personalinformation`
--
ALTER TABLE `tbl_personalinformation`
  ADD CONSTRAINT `persoapp` FOREIGN KEY (`int_applicationID`) REFERENCES `tbl_application` (`int_applicationID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_projectapplicationtype`
--
ALTER TABLE `tbl_projectapplicationtype`
  ADD CONSTRAINT `projapptype` FOREIGN KEY (`int_projectID`) REFERENCES `tbl_projectdetail` (`int_projectID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_projectbeneficiary`
--
ALTER TABLE `tbl_projectbeneficiary`
  ADD CONSTRAINT `beneid` FOREIGN KEY (`int_beneficiaryID`) REFERENCES `tbl_beneficiary` (`int_beneficiaryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_projectcategory`
--
ALTER TABLE `tbl_projectcategory`
  ADD CONSTRAINT `categid` FOREIGN KEY (`int_categoryID`) REFERENCES `tbl_category` (`int_categoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projcateg` FOREIGN KEY (`int_projectID`) REFERENCES `tbl_projectdetail` (`int_projectID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_projectdetail`
--
ALTER TABLE `tbl_projectdetail`
  ADD CONSTRAINT `city` FOREIGN KEY (`int_cityID`) REFERENCES `tbl_city` (`int_cityID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_projectreason`
--
ALTER TABLE `tbl_projectreason`
  ADD CONSTRAINT `projid` FOREIGN KEY (`int_projectID`) REFERENCES `tbl_projectdetail` (`int_projectID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_projectrequirement`
--
ALTER TABLE `tbl_projectrequirement`
  ADD CONSTRAINT `projreqreq` FOREIGN KEY (`int_requirementID`) REFERENCES `tbl_requirement` (`int_requirementID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proreqid` FOREIGN KEY (`int_projectID`) REFERENCES `tbl_projectdetail` (`int_projectID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
