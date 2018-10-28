-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2018 at 09:16 AM
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
-- Database: `db_capstone30`
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
(6, 1, 2018, '5000000.00', '4988940.00'),
(8, 1, 2019, '2710000.00', '2710000.00');

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
(23, 34, NULL, 'Sample-29', 10, 'pc'),
(24, 37, NULL, 'Sample-32', 10, 'pc'),
(25, 38, NULL, 'benefitwithsponsor1', 2, 'pc'),
(26, 39, NULL, 'Medical Kit1', 1, 'pc'),
(27, 40, NULL, 'benefit1111 from uniliver', 3, 'pc'),
(28, 41, NULL, 'benefit1educ', 1, 'pc'),
(29, 42, NULL, 'benefitmonetaryatdisaster', 2, 'pc'),
(30, 43, NULL, 'benefitfromalaska2categ', 2, 'pc');

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
(2, 4, 1, 'Resident', 'Received', '2018-10-26 18:23:08', '2018-10-26 12:26:44'),
(3, 4, 1, 'Resident', 'Received', '2018-10-26 17:45:35', '2018-10-26 12:29:40'),
(4, 4, 1, 'Resident', 'Rejected', NULL, '2018-10-26 12:43:34'),
(5, 4, 2, 'Resident', 'Pending', NULL, '2018-10-26 19:43:38'),
(6, 4, 2, 'Resident', 'Pending', NULL, '2018-10-26 19:48:56'),
(7, 4, 3, 'Household', 'Pending', NULL, '2018-10-26 20:43:24'),
(8, 4, 3, 'Household', 'Pending', NULL, '2018-10-26 20:56:16'),
(13, 4, 38, 'Resident', 'Received', '2018-10-28 11:12:50', '2018-10-28 11:29:12'),
(14, 4, 38, 'Resident', 'Received', '2018-10-28 11:12:50', '2018-10-28 11:30:04'),
(15, 4, 39, 'Resident', 'Received', '2018-10-28 12:09:34', '2018-10-28 12:19:22'),
(16, 4, 39, 'Resident', 'Received', '2018-10-28 12:09:34', '2018-10-28 12:20:31'),
(17, 9, 39, 'Resident', 'Received', '2018-10-28 12:09:34', '2018-10-28 12:23:01'),
(18, 9, 39, 'Resident', 'Received', '2018-10-28 12:09:34', '2018-10-28 12:23:57'),
(19, 4, 40, 'Barangay', 'Approved', NULL, '2018-10-28 13:15:54'),
(20, 9, 40, 'Barangay', 'Approved', NULL, '2018-10-28 13:19:19'),
(21, 4, 41, 'Resident', 'Received', '2018-10-28 13:46:19', '2018-10-28 13:52:11'),
(22, 4, 41, 'Resident', 'Received', '2018-10-28 13:46:19', '2018-10-28 13:53:03'),
(23, 4, 42, 'Resident', 'Received', '2018-10-28 13:46:19', '2018-10-28 14:01:37'),
(24, 4, 42, 'Resident', 'Received', '2018-10-28 13:46:19', '2018-10-28 14:02:23'),
(25, 4, 43, 'Resident', 'Received', '2018-10-28 14:15:34', '2018-10-28 14:19:38'),
(26, 4, 43, 'Resident', 'Received', '2018-10-28 14:15:34', '2018-10-28 14:20:19');

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
(3, 2, 1, 'jsncjscs2', 'Passed'),
(4, 2, 14, 'jsncjscs2', 'Passed'),
(5, 3, 1, 'sjsk', 'Passed'),
(6, 3, 14, 'skdlsjx', 'Passed'),
(7, 4, 1, 'jkkk', 'Passed'),
(8, 4, 14, 'jkhkj', 'Passed'),
(9, 5, 1, 'wdwd', 'Passed'),
(10, 5, 9, 'dwd', 'Passed'),
(11, 5, 14, '', 'Incomplete'),
(12, 6, 1, '', 'Incomplete'),
(13, 6, 9, 'jbjcs1', 'Passed'),
(14, 6, 14, 'sjxskh1', 'Passed'),
(15, 7, 13, 'sjd1', 'Passed'),
(16, 7, 14, 'sjdeyyyy', 'Passed'),
(17, 8, 13, 'swsw1', 'Passed'),
(18, 8, 14, 'swsw2', 'Passed'),
(19, 13, 14, 'cabinet1 row 1', 'Passed'),
(20, 14, 14, 'cabinett1', 'Passed'),
(21, 15, 14, 'Cabinet 1 row 1', 'Passed'),
(22, 16, 14, 'Cabinet 1 row 1', 'Passed'),
(23, 17, 14, 'Cabinet 1 row 1', 'Passed'),
(24, 18, 14, 'Cabinet 1 row 1', 'Passed'),
(25, 21, 14, 'cabinet1row1', 'Passed'),
(26, 22, 14, 'jasdk', 'Passed'),
(27, 23, 14, 'cabinet1row1', 'Passed'),
(28, 24, 14, 'cabinet1eow1', 'Passed'),
(29, 25, 14, 'cabinet1row1', 'Passed'),
(30, 26, 14, 'cabinet1row1', 'Passed');

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
(19, 10, 'xhbcjzb'),
(20, 10, 'jskjxs');

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
(1, 19, 'Abi', '', 'ksjls', '', '2018-10-28 13:13:41', '2232', 'none'),
(2, 19, 'Namey', '', 'Eyy', '', '2018-10-28 13:13:41', '2536', 'none'),
(3, 20, 'Marly', 'Jona', 'Janee', '', '2018-10-28 13:13:41', '2596', 'ssxs');

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
(1, 2, 'benefitwithsponsor1', 2),
(2, 3, 'Medical Kit1', 2),
(3, 4, 'Medical Kit1', 2),
(4, 5, 'benefit1111 from uniliver', 1),
(5, 6, 'benefit1111 from uniliver', 1),
(6, 7, 'benefit1educ', 2),
(7, 8, 'benefitmonetaryatdisaster', 2),
(8, 9, 'benefitfromalaska2categ', 2);

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
(1, 1, 4, 'Absss Del Rosario', '2018-10-26', NULL, 'Closed'),
(2, 38, 4, 'Girly Diaz', '2018-10-28', NULL, 'Closed'),
(3, 39, 4, 'Girly Diaz', '2018-10-28', NULL, 'Closed'),
(4, 39, 9, 'Hail Cruzadas', '2018-10-28', NULL, 'Closed'),
(5, 40, 4, 'Girly Diaz', '2018-10-28', NULL, 'Closed'),
(6, 40, 9, 'Hail Cruzadas', '2018-10-28', NULL, 'Closed'),
(7, 41, 4, 'Girly Diaz', '2018-10-28', NULL, 'Closed'),
(8, 42, 4, 'Girly Diaz', '2018-10-28', NULL, 'Closed'),
(9, 43, 4, 'Girly Diaz', '2018-10-28', NULL, 'Closed');

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
(9, 8, 1, '1500000.00', '1500000.00'),
(10, 8, 2, '400000.00', '400000.00'),
(11, 8, 3, '680000.00', '680000.00'),
(12, 8, 4, '130000.00', '130000.00'),
(13, 6, 1, '1500000.00', '1500000.00'),
(14, 6, 2, '1000000.00', '997600.00'),
(15, 6, 3, '1000000.00', '997600.00'),
(16, 6, 4, '1500000.00', '1498340.00');

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
(1, 1, NULL, 'Benefit Expense', 20, '750.00', '0.00', '1500.00', 2),
(2, 2, NULL, 'Benefit Expense', 20, '240.00', '0.00', NULL, NULL),
(3, 3, NULL, 'Benefit Expense', 20, '360.00', '0.00', NULL, NULL),
(31, 34, NULL, 'Benefit Expense', 1000, '100.00', '100000.00', NULL, NULL),
(32, 34, NULL, 'Sample-29', 100, '100.00', '10000.00', NULL, NULL),
(37, 37, NULL, 'Benefit Expense', 100, '100.00', '10000.00', NULL, NULL),
(38, 37, NULL, 'Sample-32', 100, '100.00', '10000.00', NULL, NULL),
(39, 38, NULL, 'Benefit Expense', 60, '140.00', '0.00', '280.00', 2),
(40, 38, NULL, 'Food Expense', NULL, '40.00', NULL, '2400.00', 60),
(41, 39, NULL, 'Benefit Expense', 50, '150.00', '0.00', '600.00', 4),
(42, 39, NULL, 'Food Expense', NULL, '60.00', NULL, '4800.00', 80),
(43, 1, NULL, 'Food Expense', NULL, '120.00', NULL, '7200.00', 60),
(44, 40, NULL, 'Benefit Expense', 20, '360.00', '0.00', '1080.00', 3),
(45, 40, NULL, 'Food Expense', NULL, '200.00', NULL, '4000.00', 20),
(46, 41, NULL, 'Benefit Expense', 10, '430.00', '0.00', '860.00', 2),
(47, 41, NULL, 'Food Expense', NULL, '200.00', NULL, '800.00', 4),
(48, 42, NULL, 'Benefit Expense', 30, '300.00', '0.00', '600.00', 2),
(49, 42, NULL, 'Food Expense', NULL, '200.00', NULL, '4000.00', 20),
(50, 43, NULL, 'Benefit Expense', 20, '300.00', '0.00', '600.00', 2),
(51, 43, NULL, 'Food Expense', NULL, '60.00', NULL, '3000.00', 50),
(52, 43, NULL, 'tarpaulin', NULL, '300.00', NULL, '1200.00', 4);

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

--
-- Dumping data for table `tbl_familybackground`
--

INSERT INTO `tbl_familybackground` (`int_familybgID`, `int_applicationID`, `varchar_memberFName`, `varchar_memberMName`, `varchar_memberLName`, `enum_civilStatus`, `text_educationalAttainment`, `varchar_occupation`) VALUES
(1, 7, 'JJH', 'jsk', 'jshd', 'Single', 'college', 'none'),
(2, 7, 'skljl', 'kjdhjk', 'jhdjkh', 'Single', 'hs', 'none'),
(3, 8, 'wsw', 'ijidojw', 'slijxl', 'Single', 'hs', 'none');

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

--
-- Dumping data for table `tbl_financialcontribution`
--

INSERT INTO `tbl_financialcontribution` (`int_financialconID`, `int_applicationID`, `text_finconPurpose`, `varchar_relationship`, `enum_frequency`, `decimal_annualContribution`) VALUES
(1, 7, 'Household expense', 'Father', 'Monthly', '120000.00'),
(2, 7, 'sjdjs', 'mother', 'Monthly', '50000.00'),
(3, 8, 'Household expense', 'Father', 'Monthly', '300000.00');

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

--
-- Dumping data for table `tbl_householdapplication`
--

INSERT INTO `tbl_householdapplication` (`int_applicationID`, `varchar_familyName`, `text_homeAddress`, `varchar_representativeName`, `varchar_representativeEmailAddress`, `varchar_representativeContact`, `varchar_validationID`, `decimal_totalAnnualIncome`, `enum_houseStatus`) VALUES
(7, 'Athenee', '685 hulo', 'Bababa', 'abigaledr13@gmail.com', '(+63) 956-564-6464', '36sds', '99999999.99', 'Owned'),
(8, 'eyyy', '545 uwhuw', 'halaaa', 'sjsijdisjd@gmail.com', '(+63) 884-687-6767', 'isjx545', '300000.00', 'Owned');

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
(29, 6, 2, 34, 'Monetary Request from Plainview', 'Request for monetary help for retired workers.', '2018-10-12', 'Adrian Vasquez', '296 Plainview', 'Solved'),
(31, 4, 1, 37, 'Medical Kit for the youths', 'To make the youths always ready', '2018-10-13', 'Lovely Gamora', '365 Hulo Mandaluyong City', 'Solved'),
(33, 1, 1, 1, 'Eye glasses giving for senior citizens', 'To help the senior citizens', '2018-10-13', 'Zyannah Ombre', '63 Addition Hills Mandaluyong City', 'Solved'),
(34, 1, 1, 3, 'Things for the babies', 'To help the pregnant women for their babies', '2018-10-12', 'Marivic Campos', '65 Addition Hills Mandaluyong City', 'Solved'),
(35, 4, 3, 38, 'exampleulit', 'jkzzchjkshkjshkjcshkj', '2018-10-28', 'givennn', '323 hulo', 'Solved'),
(36, 4, 1, 39, 'For the residents', 'To help the college students', '2018-10-28', 'Abby', '236 Hulo', 'Solved'),
(37, 2, 3, 40, 'tulungan ang barangay', 'sacascsajkhjk', '2018-10-28', 'jane', '522 bagong silang', 'Solved'),
(38, 9, 4, 41, 'exampleforliq1', 'jkhskdcxsx', '2018-10-28', 'Abss', '351 hulo', 'Solved');

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
(2, 'm', 'scsc', 'jsjxsx', '1999-06-13', 'Female', 2005, '', '(+63) 915-666-2933', 'abigaledr13@gmail.com', '', ''),
(3, 'j', 'hbhjb', 'hjbhj', '1999-06-13', 'Female', 2006, '', '(+63) 091-532-6564', 'abigaledr13@gmail.com', '', ''),
(4, '', 'shxbs', 'hsgxj', '1999-06-13', 'Female', 2006, 'Single', '(+63) 656-565-6565', 'abigaledr13@gmail.com', '546 wdw', ''),
(5, 'Athena', 'Punz', 'jnj', '2015-02-20', 'Female', 2015, 'Single', '(+63) 848-494-8948', 'abigaledr13@gmail.com', '598 hulo', '52236'),
(6, 'Bruno', 'skd', 'Del ', '2015-02-25', 'Male', 2015, 'Married', '(+63) 654-564-6464', 'sjxjs@gmail.com', '923 dcdc', '65sqw'),
(13, 'Hey ', 'heyyy', 'hey', '2005-02-15', 'Female', 2006, 'Single', '(+63) 956-466-4622', 'abigaledr13@gmail.com', '323 hulo', '1245'),
(14, 'abiiii', 'jskjcs', 'skja', '2004-05-13', 'Male', 2005, 'Married', '(+63) 956-446-4564', 'abigaledr13@gmail.com', '564 hulo', '3256'),
(15, 'Abbygale', 'Napiza', 'Dela Rosa ', '2008-06-12', 'Female', 2008, 'Single', '(+63) 915-656-5623', 'abigaledr13@gmail.com', '123 Hulo', '1234'),
(16, 'Angelika', 'Cruz', 'Dela Pena', '2000-02-15', 'Female', 2006, 'Single', '(+63) 095-646-4564', 'jncke@gmail.com', '656 Hulo', '2568'),
(17, 'Kathe', 'ho', 'Ill', '2000-05-13', 'Female', 2005, 'Single', '(+63) 546-488-6486', 'jsk@gmail.com', '313 Ilaya', '2596'),
(18, 'Jaime', '', 'Juan', '2001-02-16', 'Male', 2008, 'Single', '(+63) 684-648-6486', 'jksck@gmail.com', '59 Ilaya', '9875'),
(21, 'Magulo', '', 'SI', '2003-02-05', 'Female', 2005, 'Single', '(+63) 848-445-4564', 'sakjxska@gmail.com', '313 hulo', '2345'),
(22, 'asdjk', 'dkjchk', 'jkshck', '2007-05-20', 'Male', 2008, 'Single', '(+63) 546-456-4564', 'sjkhck@gmail.com', '896 hulo', '5325'),
(23, 'syempre', 'kjchk', 'hxsjkch', '2005-02-10', 'Male', 2005, 'Single', '(+63) 956-446-4564', 'jsksjk@gmail.com', '323 hulo', '1245'),
(24, 'dshjh', 'jdckh', 'jdhjk', '2007-02-15', 'Male', 2008, 'Single', '(+63) 586-486-4684', 'abskjsax@gmail.com', '544 hulo', '2578'),
(25, 'ksdhui', 'ihudich', 'udhcih', '2005-02-15', 'Male', 2005, 'Single', '(+63) 564-654-6456', 'jdcbhj@gmail.com', '5656 hulo', '2356'),
(26, 'kjhsd', 'oieo', 'ieodi', '2008-02-15', 'Male', 2010, 'Single', '(+63) 545-646-4646', 'kjschkh@gmail.com', '554 hsud', '5874');

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
(1, 1, 'Resident'),
(2, 2, 'Resident'),
(3, 3, 'Household'),
(33, 34, 'Barangay'),
(36, 37, 'Resident'),
(37, 38, 'Resident'),
(38, 39, 'Resident'),
(39, 40, 'Barangay'),
(40, 41, 'Resident'),
(41, 42, 'Resident'),
(42, 43, 'Resident');

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
(80, 29, 10, 'Intent Statement'),
(81, 30, 3, 'Intent Statement'),
(82, 31, 11, 'Intent Statement'),
(83, 32, 1, 'Intent Statement'),
(84, 33, 1, 'Intent Statement'),
(85, 34, 8, 'Intent Statement'),
(86, 2, 3, 'Project'),
(87, 4, 4, 'Project'),
(88, 5, 2, 'Project'),
(89, 6, 1, 'Project'),
(90, 7, 1, 'Project'),
(91, 8, 2, 'Project'),
(92, 9, 2, 'Project'),
(93, 11, 1, 'Project'),
(94, 11, 5, 'Project'),
(95, 12, 1, 'Project'),
(96, 12, 5, 'Project'),
(97, 13, 1, 'Project'),
(98, 13, 4, 'Project'),
(99, 13, 3, 'Project'),
(100, 14, 1, 'Project'),
(101, 14, 4, 'Project'),
(102, 15, 4, 'Project'),
(103, 15, 3, 'Project'),
(104, 15, 1, 'Project'),
(105, 16, 1, 'Project'),
(106, 17, 1, 'Project'),
(107, 18, 1, 'Project'),
(108, 19, 1, 'Project'),
(109, 23, 1, 'Project'),
(110, 24, 3, 'Project'),
(111, 25, 2, 'Project'),
(112, 26, 2, 'Project'),
(113, 27, 2, 'Project'),
(114, 28, 2, 'Project'),
(115, 29, 3, 'Project'),
(116, 30, 2, 'Project'),
(117, 31, 2, 'Project'),
(118, 32, 1, 'Project'),
(119, 33, 1, 'Project'),
(120, 36, 4, 'Project'),
(121, 35, 3, 'Intent Statement'),
(122, 38, 3, 'Project'),
(123, 36, 3, 'Intent Statement'),
(124, 39, 3, 'Project'),
(125, 37, 2, 'Intent Statement'),
(126, 40, 2, 'Project'),
(127, 38, 2, 'Intent Statement'),
(128, 41, 2, 'Project'),
(129, 42, 11, 'Project'),
(130, 43, 11, 'Project');

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
(1, 1, 1, '18000.00'),
(2, 2, 3, '6000.00'),
(3, 3, 1, '10000.00'),
(42, 34, 2, '100000.00'),
(45, 37, 1, '100000.00'),
(46, 38, 3, '10000.00'),
(47, 39, 1, '10000.00'),
(48, 40, 3, '10000.00'),
(49, 41, 4, '5000.00'),
(50, 42, 2, '5000.00'),
(51, 42, 3, '5000.00'),
(52, 43, 3, '10000.00'),
(53, 43, 2, '10000.00');

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
(1, 1, ' Eye glasses giving for senior citizens   ', 'To help the senior citizens', 'To help the senior citizens', 'To help the senior citizens', 20, '2018-10-27', '2018-11-15', '2018-11-19', '2018-11-19', '2018-11-22', '2018-10-26', '2018-10-26', '2018-10-26', '2018-10-26', '2018-10-28', '2018-10-26', '0.00', '18000.00', '8700.00', 'Finished'),
(2, 1, 'uhuiiu', 'jhajx', 'ksnxkja', 'jshxj', 20, '2018-10-27', '2018-10-31', '2018-11-15', '2018-11-15', '2018-11-23', '2018-10-26', NULL, NULL, NULL, NULL, '2018-10-26', '0.00', '6000.00', NULL, 'Ongoing'),
(3, 1, ' Things for the babies   ', 'To help the pregnant women for their babies', 'lkscl', 'sjkx', 20, '2018-10-29', '2018-11-17', '2018-11-21', '2018-11-21', '2018-11-29', '2018-10-26', NULL, NULL, NULL, NULL, '2018-10-26', '0.00', '10000.00', NULL, 'Ongoing'),
(34, 1, ' Monetary Request from Plainview   ', 'Request for monetary help for retired workers.', 'Sample-29', 'Sample-29', 1000, '2019-01-16', '2019-01-18', '2019-01-19', '2019-01-22', '2019-01-25', NULL, NULL, NULL, NULL, NULL, '2018-10-28', '110000.00', '100000.00', NULL, 'Created'),
(37, 1, ' Medical Kit for the youths   ', 'To make the youths always ready', 'JKSDHFJKA', 'HFASJKDHF', 100, '2018-11-08', '2018-11-14', '2018-11-17', '2018-11-20', '2018-11-23', NULL, NULL, NULL, NULL, NULL, '2018-10-28', '20000.00', '100000.00', NULL, 'Created'),
(38, 1, ' exampleulit   ', 'jkzzchjkshkjshkjcshkj', 'kjdjkhckj', 'jdshjkcs', 60, '2018-10-29', '2018-11-14', '2018-11-21', '2018-11-21', '2018-11-29', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '0.00', '10000.00', '2680.00', 'Finished'),
(39, 1, ' For the residents   ', 'To help the college students', 'To help the college students', 'To help the college students', 50, '2018-10-29', '2018-11-15', '2018-11-20', '2018-11-20', '2018-11-28', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '0.00', '10000.00', '5400.00', 'Finished'),
(40, 1, ' tulungan ang barangay   ', 'sacascsajkhjk', 'sacascsajkhjk', 'sacascsajkhjk', 20, '2018-10-30', '2018-11-13', '2018-11-20', '2018-11-20', '2018-11-30', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '0.00', '10000.00', '5080.00', 'Finished'),
(41, 1, ' exampleforliq1   ', 'jkhskdcxsx', 'kjskcj', 'sjaklj', 10, '2018-10-30', '2018-11-14', '2018-11-21', '2018-11-21', '2018-11-30', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '0.00', '5000.00', '1660.00', 'Finished'),
(42, 1, '2categ', 'jakshjk', 'dkjcjk', 'jkdck', 30, '2018-10-29', '2018-11-13', '2018-11-15', '2018-11-15', '2018-11-22', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '0.00', '10000.00', '4600.00', 'Finished'),
(43, 1, '222categ', 'kjhdk', 'kjdckjd', 'sxksjxk', 20, '2018-10-30', '2018-11-14', '2018-11-16', '2018-11-16', '2018-11-28', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '2018-10-28', '0.00', '20000.00', '4800.00', 'Finished');

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
(1, 1, 'bjhbb', 'Start Application'),
(2, 1, 'jhk', 'Close Application'),
(3, 1, 'kljlk', 'Start Releasing'),
(4, 1, 'ugi', 'Close Releasing'),
(5, 2, 'jhkj', 'Start Application'),
(6, 3, 'jjkb', 'Start Application'),
(8, 38, 'jbjhhkhcks', 'Start Application'),
(9, 38, 'jjkhjkh', 'Close Application'),
(10, 38, 'ksdjklc', 'Start Releasing'),
(11, 38, 'jkdljclkjs', 'Close Releasing'),
(12, 39, 'sjcksjc', 'Start Application'),
(13, 39, 'xjnscjksn', 'Close Application'),
(14, 39, 'jsxs', 'Start Releasing'),
(15, 39, 'asijxioa', 'Close Releasing'),
(16, 39, 'jsdck', 'Close Releasing'),
(17, 40, 'jknk', 'Start Application'),
(18, 40, 'jkk', 'Close Application'),
(19, 40, 'jkhjk', 'Start Releasing'),
(20, 40, 'jhjk', 'Close Releasing'),
(21, 40, 'jkhk', 'Close Releasing'),
(22, 41, 'jhjk', 'Start Application'),
(23, 41, 'jk', 'Close Application'),
(24, 41, 'jklj', 'Start Releasing'),
(25, 41, 'jscksac', 'Close Releasing'),
(26, 42, 'jhsjx', 'Start Application'),
(27, 42, 'kjklj', 'Close Application'),
(28, 42, 'jkh', 'Start Releasing'),
(29, 42, 'kljkl', 'Close Releasing'),
(30, 43, 'hikhujh', 'Start Application'),
(31, 43, 'jk', 'Close Application'),
(32, 43, 'jhkh', 'Start Releasing'),
(33, 43, 'jkhjk', 'Close Releasing');

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
(1, 1, 1),
(2, 14, 1),
(3, 1, 2),
(4, 9, 2),
(5, 14, 2),
(6, 13, 3),
(7, 14, 3),
(43, 2, 34),
(46, 2, 37),
(47, 14, 38),
(48, 14, 39),
(49, 14, 40),
(50, 14, 41),
(51, 14, 42),
(52, 14, 43);

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
(1, 30, 10, '100000.00'),
(2, 31, 10, '100000.00'),
(3, 34, 3, '1000.00'),
(4, 40, 1, '10000.00'),
(5, 43, 3, '10000.00');

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
(3, 'Hale', 'Kaja', 'ksjxips'),
(14, 'yeahh', 'father', 'xsaxs'),
(16, 'Hale', 'Kaja', 'sdjcisj'),
(24, 'jsa', 'jkshk', 'ksjhxks');

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
(4, 'Sample-3', 'Sample-3', 'Sample-3'),
(5, 'Sample-3', 'Sample-3', 'Sample-3'),
(6, 'Sample-4', 'Sample-4', 'Sample-4'),
(7, 'Sample-4', 'Sample-4', 'Sample-4'),
(8, 'Sample-12', 'Sample-12', 'Sample-12'),
(9, 'Sample-13', 'Sample-13', 'Sample-13'),
(10, 'Sampe-14', 'Sampe-14', 'Sampe-14'),
(11, 'Sample-32', 'Sample-32', 'Sample-32'),
(12, 'sponsorexample1', 'sponsorexample1@gmail.com', '09125412523'),
(13, '', '', ''),
(14, 'Sponsor1', 'sponsssor1@gmail.com', '09521354852');

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
  MODIFY `int_appbeneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_application`
--
ALTER TABLE `tbl_application`
  MODIFY `int_applicationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_applicationrequirement`
--
ALTER TABLE `tbl_applicationrequirement`
  MODIFY `int_appreqID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_barangay`
--
ALTER TABLE `tbl_barangay`
  MODIFY `int_barangayID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_barangaybeneficiary`
--
ALTER TABLE `tbl_barangaybeneficiary`
  MODIFY `int_brgybeneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_barangaybenefit`
--
ALTER TABLE `tbl_barangaybenefit`
  MODIFY `int_projbenefitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_barangayreleasing`
--
ALTER TABLE `tbl_barangayreleasing`
  MODIFY `int_brgyreleaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `int_expenseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `tbl_familybackground`
--
ALTER TABLE `tbl_familybackground`
  MODIFY `int_familybgID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_financialcontribution`
--
ALTER TABLE `tbl_financialcontribution`
  MODIFY `int_financialconID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_intentstatement`
--
ALTER TABLE `tbl_intentstatement`
  MODIFY `int_statementID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
  MODIFY `int_proapptypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_projectbeneficiary`
--
ALTER TABLE `tbl_projectbeneficiary`
  MODIFY `int_projbeneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `tbl_projectcategory`
--
ALTER TABLE `tbl_projectcategory`
  MODIFY `int_projcategID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `tbl_projectdetail`
--
ALTER TABLE `tbl_projectdetail`
  MODIFY `int_projectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `tbl_projectreason`
--
ALTER TABLE `tbl_projectreason`
  MODIFY `int_projectReasonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_projectrequirement`
--
ALTER TABLE `tbl_projectrequirement`
  MODIFY `int_projreqID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `tbl_projectsponsor`
--
ALTER TABLE `tbl_projectsponsor`
  MODIFY `int_projsponID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_requirement`
--
ALTER TABLE `tbl_requirement`
  MODIFY `int_requirementID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_sponsordetail`
--
ALTER TABLE `tbl_sponsordetail`
  MODIFY `int_sponsorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
