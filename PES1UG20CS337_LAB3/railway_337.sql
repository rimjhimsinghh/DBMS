-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2022 at 03:22 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railway_337`
--

-- --------------------------------------------------------

--
-- Table structure for table `compartment_337`
--

CREATE TABLE `compartment_337` (
  `Train_No` int(11) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  `Availability` tinyint(1) DEFAULT 1,
  `Compartment_No` int(11) NOT NULL,
  `Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `fare`
-- (See below for the actual view)
--
CREATE TABLE `fare` (
`fareperkm` int(11)
,`compartment_type` varchar(255)
,`train_type` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `fare_table_337`
--

CREATE TABLE `fare_table_337` (
  `FarePerKM` int(11) DEFAULT NULL,
  `Train_Type` varchar(255) NOT NULL,
  `Compartment_Type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fare_table_337`
--

INSERT INTO `fare_table_337` (`FarePerKM`, `Train_Type`, `Compartment_Type`) VALUES
(12, 'A', 'Sleeper'),
(10, 'B', 'AC'),
(5, 'C', 'non-AC'),
(17, 'D', 'General');

-- --------------------------------------------------------

--
-- Table structure for table `passenger_info_337`
--

CREATE TABLE `passenger_info_337` (
  `PNR` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Seat_No` int(11) NOT NULL,
  `Age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_info_337`
--

CREATE TABLE `payment_info_337` (
  `Transaction_ID` int(11) NOT NULL,
  `Bank` varchar(255) DEFAULT NULL,
  `Card_No` int(11) DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL,
  `PNR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `route_info_337`
--

CREATE TABLE `route_info_337` (
  `Train_No` int(11) DEFAULT NULL,
  `From_Station_No` int(11) NOT NULL,
  `From_Station_Name` varchar(255) DEFAULT NULL,
  `Distance` int(11) DEFAULT NULL,
  `To_Station_No` int(11) NOT NULL,
  `To_Station_Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_337`
--

CREATE TABLE `ticket_337` (
  `PNR` int(11) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Travel_Date` date DEFAULT NULL,
  `Arrival` time DEFAULT NULL,
  `Departure` time DEFAULT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Train_Type` varchar(255) DEFAULT NULL,
  `Compartment_Type` int(11) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `train_337`
--

CREATE TABLE `train_337` (
  `Train_No` int(11) NOT NULL,
  `Train_Type` varchar(255) NOT NULL,
  `Destination` varchar(50) DEFAULT NULL,
  `Train_Name` varchar(255) NOT NULL,
  `Availability` tinyint(1) DEFAULT NULL,
  `Src` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_337`
--

CREATE TABLE `user_337` (
  `User_ID` int(11) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Street_No` int(11) DEFAULT NULL,
  `PINCODE` int(11) DEFAULT NULL,
  `F_Name` varchar(255) DEFAULT NULL,
  `L_Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_phone_337`
--

CREATE TABLE `user_phone_337` (
  `User_ID` int(11) DEFAULT NULL,
  `Phone_No` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_train_checks_337`
--

CREATE TABLE `user_train_checks_337` (
  `Train_No` int(11) DEFAULT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Date_Time_Stamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure for view `fare`
--
DROP TABLE IF EXISTS `fare`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fare`  AS SELECT `fare_table_337`.`FarePerKM` AS `fareperkm`, `fare_table_337`.`Compartment_Type` AS `compartment_type`, `fare_table_337`.`Train_Type` AS `train_type` FROM `fare_table_337` WHERE `fare_table_337`.`FarePerKM` > 66  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compartment_337`
--
ALTER TABLE `compartment_337`
  ADD PRIMARY KEY (`Compartment_No`),
  ADD KEY `Train_No` (`Train_No`);

--
-- Indexes for table `fare_table_337`
--
ALTER TABLE `fare_table_337`
  ADD PRIMARY KEY (`Train_Type`,`Compartment_Type`);

--
-- Indexes for table `passenger_info_337`
--
ALTER TABLE `passenger_info_337`
  ADD PRIMARY KEY (`Seat_No`),
  ADD KEY `PNR` (`PNR`);

--
-- Indexes for table `payment_info_337`
--
ALTER TABLE `payment_info_337`
  ADD PRIMARY KEY (`Transaction_ID`),
  ADD UNIQUE KEY `Transaction_ID` (`Transaction_ID`),
  ADD KEY `PNR` (`PNR`);

--
-- Indexes for table `route_info_337`
--
ALTER TABLE `route_info_337`
  ADD PRIMARY KEY (`From_Station_No`,`To_Station_No`),
  ADD KEY `Train_No` (`Train_No`);

--
-- Indexes for table `ticket_337`
--
ALTER TABLE `ticket_337`
  ADD PRIMARY KEY (`PNR`),
  ADD UNIQUE KEY `PNR` (`PNR`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `train_337`
--
ALTER TABLE `train_337`
  ADD PRIMARY KEY (`Train_No`),
  ADD UNIQUE KEY `Train_No` (`Train_No`);

--
-- Indexes for table `user_337`
--
ALTER TABLE `user_337`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `User_ID` (`User_ID`);

--
-- Indexes for table `user_phone_337`
--
ALTER TABLE `user_phone_337`
  ADD PRIMARY KEY (`Phone_No`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `user_train_checks_337`
--
ALTER TABLE `user_train_checks_337`
  ADD KEY `Train_No` (`Train_No`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compartment_337`
--
ALTER TABLE `compartment_337`
  ADD CONSTRAINT `compartment_337_ibfk_1` FOREIGN KEY (`Train_No`) REFERENCES `train_337` (`Train_No`);

--
-- Constraints for table `passenger_info_337`
--
ALTER TABLE `passenger_info_337`
  ADD CONSTRAINT `passenger_info_337_ibfk_1` FOREIGN KEY (`PNR`) REFERENCES `ticket_337` (`PNR`);

--
-- Constraints for table `payment_info_337`
--
ALTER TABLE `payment_info_337`
  ADD CONSTRAINT `payment_info_337_ibfk_1` FOREIGN KEY (`PNR`) REFERENCES `ticket_337` (`PNR`);

--
-- Constraints for table `route_info_337`
--
ALTER TABLE `route_info_337`
  ADD CONSTRAINT `route_info_337_ibfk_1` FOREIGN KEY (`Train_No`) REFERENCES `train_337` (`Train_No`);

--
-- Constraints for table `ticket_337`
--
ALTER TABLE `ticket_337`
  ADD CONSTRAINT `ticket_337_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user_337` (`User_ID`);

--
-- Constraints for table `user_phone_337`
--
ALTER TABLE `user_phone_337`
  ADD CONSTRAINT `user_phone_337_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user_337` (`User_ID`);

--
-- Constraints for table `user_train_checks_337`
--
ALTER TABLE `user_train_checks_337`
  ADD CONSTRAINT `user_train_checks_337_ibfk_1` FOREIGN KEY (`Train_No`) REFERENCES `train_337` (`Train_No`),
  ADD CONSTRAINT `user_train_checks_337_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `user_337` (`User_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
