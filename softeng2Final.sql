-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Creato il: Gen 14, 2020 alle 09:08
-- Versione del server: 5.7.28-0ubuntu0.16.04.2
-- Versione PHP: 7.2.24-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `softeng2Final`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Communication`
--

CREATE TABLE `Communication` (
  `ID` int(11) NOT NULL,
  `Title` varchar(535) NOT NULL,
  `Description` text NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `OfficerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Communication`
--

INSERT INTO `Communication` (`ID`, `Title`, `Description`, `Timestamp`, `OfficerID`) VALUES
(1, 'Christmas holidays', 'All lectures are suspended from 20/12/2019 until 07/01/2020', '2019-12-09 16:34:14', 1),
(3, 'Lecture suspended', 'All lectures are suspended on 11/12/2019', '2019-12-09 16:35:07', 1),
(8, 'Holydays', 'description of holydays', '2019-12-17 14:53:18', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `FinalGrades`
--

CREATE TABLE `FinalGrades` (
  `ID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `TopicID` int(11) NOT NULL,
  `Mark` int(11) NOT NULL,
  `TermID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `FinalGrades`
--

INSERT INTO `FinalGrades` (`ID`, `StudentID`, `TopicID`, `Mark`, `TermID`) VALUES
(42, 2, 1, 7, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Homework`
--

CREATE TABLE `Homework` (
  `ID` int(11) NOT NULL,
  `Description` text NOT NULL,
  `SpecificClassID` int(11) NOT NULL,
  `TeacherID` int(11) NOT NULL,
  `Deadline` date DEFAULT NULL,
  `TopicID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Homework`
--

INSERT INTO `Homework` (`ID`, `Description`, `SpecificClassID`, `TeacherID`, `Deadline`, `TopicID`) VALUES
(1, 'desc1', 1, 1, '2020-01-08', 1),
(2, 'desc2', 1, 1, '2020-01-09', 2),
(4, 'desc4', 1, 1, '2019-11-26', 1),
(5, 'desc5', 1, 1, '2019-11-27', 2),
(7, 'desc7', 2, 2, '2020-01-08', 1),
(9, 'desc9', 3, 3, '2019-11-28', 1),
(11, 'Exercise in class', 2, 7, '2019-12-01', 3),
(12, 'Elephant carpaccio', 2, 7, '2019-11-26', 4),
(13, 'Scrum', 1, 1, '2019-11-28', 1),
(14, 'prova prova', 1, 1, '2019-11-27', 2),
(15, 'Study everything', 1, 1, '2019-12-04', 2),
(16, 'Demo + release. End of 2nd sprint', 1, 1, '2019-12-03', 2),
(17, 'Retrospective', 1, 1, '2019-12-04', 1),
(18, 'E2E testing', 1, 1, '2019-12-02', 2),
(19, 'assignment 1', 1, 1, '2019-12-04', 1),
(20, 'Code refactoring', 1, 1, '2019-12-05', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `MarksRecord`
--

CREATE TABLE `MarksRecord` (
  `ID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `Mark` float NOT NULL,
  `TeacherID` int(11) NOT NULL,
  `TopicID` int(11) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Laude` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `MarksRecord`
--

INSERT INTO `MarksRecord` (`ID`, `StudentID`, `Mark`, `TeacherID`, `TopicID`, `Timestamp`, `Laude`) VALUES
(1, 2, 7, 1, 1, '2019-11-09 07:00:00', 0),
(2, 2, 7, 2, 2, '2019-11-09 08:00:00', 0),
(3, 3, 4, 3, 3, '2019-11-09 09:00:00', 0),
(4, 4, 2, 4, 4, '2019-11-09 10:00:00', 0),
(7, 5, 9, 7, 7, '2019-11-09 13:00:00', 0),
(10, 1, 1, 1, 1, '2019-11-26 14:02:30', 0),
(11, 5, 8, 1, 1, '2019-12-01 16:31:43', 0),
(12, 1, 3, 1, 1, '2019-12-01 16:32:05', 0),
(13, 4, 10, 1, 1, '2019-12-02 08:00:00', 0),
(14, 6, 7, 1, 1, '2019-12-01 16:32:09', 0),
(15, 3, 7, 1, 1, '2019-12-01 16:32:09', 0),
(16, 2, 10, 1, 1, '2019-12-01 16:32:16', 1),
(17, 8, 8, 1, 1, '2019-12-01 16:36:53', 0),
(18, 2, 5, 1, 2, '2019-12-01 17:58:06', 0),
(19, 6, 10, 1, 1, '2019-12-01 17:58:06', 1),
(20, 3, 8, 1, 2, '2019-12-02 12:10:40', 0),
(21, 5, 3, 1, 2, '2019-12-02 16:23:56', 0),
(22, 2, 8, 1, 1, '2019-12-03 08:49:11', 0),
(23, 12, 9, 1, 2, '2019-12-03 08:00:00', 0),
(24, 12, 4, 2, 1, '2019-12-03 09:00:00', 0),
(25, 12, 6, 3, 3, '2019-12-03 10:00:00', 0),
(26, 12, 10, 4, 4, '2019-12-03 11:00:00', 0),
(27, 12, 9, 5, 5, '2019-11-26 09:00:00', 0),
(28, 12, 2, 6, 6, '2019-11-28 09:00:00', 0),
(29, 4, 5, 2, 2, '2019-12-02 07:00:00', 0),
(30, 4, 7, 4, 4, '2019-12-02 09:00:00', 0),
(31, 4, 6, 5, 5, '2019-12-03 09:00:00', 0),
(32, 4, 6, 6, 6, '2019-12-03 10:00:00', 0),
(33, 4, 10, 7, 7, '2019-12-03 11:00:00', 0),
(34, 2, 10, 1, 2, '2019-12-03 10:43:54', 1),
(35, 4, 10, 1, 1, '2019-12-03 10:43:54', 0),
(36, 8, 10, 1, 1, '2020-01-06 09:53:23', 1),
(37, 2, 1, 1, 1, '2020-01-06 17:24:51', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `MeetingReservation`
--

CREATE TABLE `MeetingReservation` (
  `ID` int(11) NOT NULL,
  `ParentID` int(11) NOT NULL,
  `TeacherAvailabilityID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `TimeSlot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `MeetingReservation`
--

INSERT INTO `MeetingReservation` (`ID`, `ParentID`, `TeacherAvailabilityID`, `Date`, `TimeSlot`) VALUES
(7, 5, 9, '2020-01-27', 1),
(8, 5, 8, '2020-01-13', 1),
(9, 5, 8, '2020-01-13', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `Note`
--

CREATE TABLE `Note` (
  `ID` int(11) NOT NULL,
  `TeacherID` int(11) NOT NULL,
  `SpecificClassID` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Note`
--

INSERT INTO `Note` (`ID`, `TeacherID`, `SpecificClassID`, `Date`, `Description`) VALUES
(1, 1, 1, '2019-12-09 23:00:00', 'note1'),
(4, 1, 1, '2019-12-09 23:00:00', 'Di Leo and Riba talk during lesson'),
(5, 1, 1, '2019-12-12 23:00:00', 'Student talks with classmates'),
(6, 1, 1, '2019-12-09 23:00:00', 'Di Leo is doing E2E testing with his teammates'),
(7, 7, 2, '2019-12-08 23:00:00', 'Dries plays football during the lecture'),
(8, 7, 3, '2019-12-12 23:00:00', 'dries mertens plays with nintendo switch during the lecture'),
(9, 1, 1, '2019-12-15 23:00:00', 'Di Leo and Sordi note'),
(12, 1, 1, '2019-12-16 23:00:00', 'di leo and sordi are talking during demo');

-- --------------------------------------------------------

--
-- Struttura della tabella `NoteRecord`
--

CREATE TABLE `NoteRecord` (
  `ID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `NoteID` int(11) NOT NULL,
  `Seen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `NoteRecord`
--

INSERT INTO `NoteRecord` (`ID`, `StudentID`, `NoteID`, `Seen`) VALUES
(1, 2, 1, 1),
(2, 6, 1, 0),
(3, 2, 4, 1),
(4, 5, 4, 0),
(5, 4, 5, 1),
(6, 2, 6, 1),
(7, 6, 6, 0),
(8, 3, 6, 0),
(9, 5, 6, 0),
(10, 8, 6, 0),
(11, 4, 6, 1),
(12, 13, 8, 0),
(13, 2, 9, 1),
(14, 4, 9, 1),
(18, 2, 12, 1),
(19, 4, 12, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `NotPresentRecord`
--

CREATE TABLE `NotPresentRecord` (
  `ID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `SpecificClassID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Late` tinyint(1) NOT NULL DEFAULT '0',
  `ExitHour` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `NotPresentRecord`
--

INSERT INTO `NotPresentRecord` (`ID`, `StudentID`, `SpecificClassID`, `Date`, `Late`, `ExitHour`) VALUES
(1, 1, 1, '2019-11-28', 1, 4),
(2, 2, 1, '2019-11-28', 0, 0),
(3, 3, 1, '2019-11-28', 0, 4),
(12, 6, 1, '2019-12-02', 0, 0),
(13, 3, 1, '2019-12-02', 1, 6),
(14, 2, 1, '2019-12-02', 1, 6),
(15, 5, 1, '2019-12-02', 0, 0),
(16, 4, 1, '2019-12-02', 0, 0),
(20, 6, 1, '2019-12-12', 1, 6),
(22, 4, 1, '2019-12-13', 0, 4),
(23, 4, 1, '2019-12-12', 0, 0),
(24, 2, 1, '2019-12-12', 0, 4),
(25, 6, 1, '2019-12-11', 0, 0),
(26, 1, 1, '2019-12-11', 0, 2),
(27, 5, 1, '2019-12-11', 0, 4),
(28, 3, 1, '2019-12-11', 1, 6),
(29, 5, 1, '2019-12-16', 1, 6),
(30, 2, 1, '2019-12-16', 0, 0),
(31, 1, 1, '2019-12-16', 0, 4),
(81, 4, 1, '2019-12-17', 0, 0),
(82, 2, 1, '2019-12-17', 0, 4),
(83, 1, 1, '2019-12-17', 1, 6),
(84, 3, 1, '2019-12-17', 1, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `Officer`
--

CREATE TABLE `Officer` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `FiscalCode` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Officer`
--

INSERT INTO `Officer` (`ID`, `UserID`, `FiscalCode`) VALUES
(1, 10, 'FSCOFFICER1'),
(2, 11, 'FSCOFFICER2');

-- --------------------------------------------------------

--
-- Struttura della tabella `Parent`
--

CREATE TABLE `Parent` (
  `ID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Parent`
--

INSERT INTO `Parent` (`ID`, `StudentID`, `UserID`) VALUES
(2, 2, 2),
(5, 4, 1),
(7, 3, 45),
(8, 3, 44),
(10, 4, 2),
(11, 12, 55),
(12, 13, 56),
(14, 12, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `SpecificClass`
--

CREATE TABLE `SpecificClass` (
  `ID` int(11) NOT NULL,
  `YearClassID` int(11) NOT NULL,
  `Section` varchar(5) NOT NULL,
  `UploadedPath` varchar(50) NOT NULL,
  `CoordinatorTeacherID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `SpecificClass`
--

INSERT INTO `SpecificClass` (`ID`, `YearClassID`, `Section`, `UploadedPath`, `CoordinatorTeacherID`) VALUES
(-1, -1, 'noC', '', 19),
(1, 1, 'A', 'uploadedPath1', 1),
(2, 1, 'B', 'uploadedPath2', 2),
(3, 1, 'C', 'uploadedPath3', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `Student`
--

CREATE TABLE `Student` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `AverageLastSchool` float NOT NULL,
  `CF` varchar(16) NOT NULL,
  `SpecificClassID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Student`
--

INSERT INTO `Student` (`ID`, `Name`, `Surname`, `AverageLastSchool`, `CF`, `SpecificClassID`) VALUES
(1, 'Hirving', 'Lozano', 10, 'LGGLPM50L71Z356X', 1),
(2, 'Vittorio', 'Di Leo', 10, 'PHGKRF55P70E908R', 1),
(3, 'Emanuele', 'Munafo', 10, 'DLGLYL71H30E159S', 1),
(4, 'Davide', 'Sordi', 10, 'HYFWMS36B11A963E', 1),
(5, 'Francesco', 'Riba', 10, 'JFVYMM92P59A229O', 1),
(6, 'Riccardo', 'Mamone', 10, 'ZGSQPD62P61F443K', 1),
(8, 'Antonio', 'Santoro', 10, 'GHFNDJ51S10L730U', 1),
(9, 'Michael', 'Bing', 7, 'RRQDWW41C60G670Z', 2),
(11, 'Mario', 'Rossi', 7, 'LVMLVS80T70L552B', 2),
(12, 'Javier', 'Lautaro', 10, 'LTRJVR97A01F839O', 2),
(13, 'Dries', 'Mertens', 10, 'MRTDRS89L03F839J', 3),
(18, 'Lorenzo', 'Riba', 9, 'WTCPGG93M51H398P', 1),
(23, 'Ross', 'Trebbiani', 9.25, 'TRBRSS80A01F839Q', -1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Teacher`
--

CREATE TABLE `Teacher` (
  `ID` int(11) NOT NULL,
  `MeetingHourID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `FiscalCode` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Teacher`
--

INSERT INTO `Teacher` (`ID`, `MeetingHourID`, `UserID`, `FiscalCode`) VALUES
(1, 0, 3, 'MTFiscalCode'),
(2, 0, 4, 'TCHTHR14A01A007F'),
(3, 0, 5, 'TCHTHR14A01B300W'),
(4, 0, 6, 'LLORAI73A41B259F'),
(5, 0, 7, 'NSGNGN73A41B647A'),
(6, 0, 8, 'DJZCTD36R14A485P'),
(7, 0, 9, 'QDLQVP51P54I962V'),
(8, 0, 57, 'VTRNTN80M01F839G'),
(11, 0, 64, 'RKARJG54T05L797F'),
(12, 0, 65, 'MMVDZB68M06G387F'),
(13, 0, 66, 'ZLTWWG92L10H553D'),
(14, 0, 67, 'VGPHPN91T28L998D'),
(15, 0, 68, 'ZVMLHY45E52D875H'),
(16, 0, 69, 'YJFPTR77S65A258U'),
(17, 0, 70, 'RRAHVP52C42A474I'),
(18, 0, 71, 'HBFDDZ68T06A243E'),
(19, -1, 72, 'noteacherfc1');

-- --------------------------------------------------------

--
-- Struttura della tabella `TeacherAvailability`
--

CREATE TABLE `TeacherAvailability` (
  `ID` int(11) NOT NULL,
  `TeacherID` int(11) NOT NULL,
  `DayOfWeek` int(11) NOT NULL,
  `HourSlot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `TeacherAvailability`
--

INSERT INTO `TeacherAvailability` (`ID`, `TeacherID`, `DayOfWeek`, `HourSlot`) VALUES
(8, 1, 0, 2),
(9, 1, 0, 3),
(10, 1, 2, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `Terms`
--

CREATE TABLE `Terms` (
  `ID` int(11) NOT NULL,
  `LimitDay` date NOT NULL,
  `Stamp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Terms`
--

INSERT INTO `Terms` (`ID`, `LimitDay`, `Stamp`) VALUES
(1, '2019-12-21', '2019/2020 - 01'),
(2, '2019-06-14', '2018/2019 - 02');

-- --------------------------------------------------------

--
-- Struttura della tabella `Timetables`
--

CREATE TABLE `Timetables` (
  `ID` int(11) NOT NULL,
  `TeacherID` int(11) NOT NULL,
  `TopicID` int(11) NOT NULL,
  `SpecificClassID` int(11) NOT NULL,
  `DayOfWeek` int(11) NOT NULL,
  `HourSlot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Timetables`
--

INSERT INTO `Timetables` (`ID`, `TeacherID`, `TopicID`, `SpecificClassID`, `DayOfWeek`, `HourSlot`) VALUES
(1317, 6, 6, 1, 0, 0),
(1318, 8, 8, 1, 1, 0),
(1319, 7, 7, 1, 2, 0),
(1320, 2, 2, 1, 3, 0),
(1321, 8, 8, 1, 4, 0),
(1322, 8, 8, 1, 5, 0),
(1323, 8, 8, 1, 0, 1),
(1324, 8, 8, 1, 1, 1),
(1325, 13, 3, 1, 2, 1),
(1326, 13, 3, 1, 3, 1),
(1327, 13, 3, 1, 4, 1),
(1328, 1, 1, 1, 5, 1),
(1329, 6, 6, 1, 0, 2),
(1330, 8, 8, 1, 1, 2),
(1331, 13, 3, 1, 2, 2),
(1332, 1, 1, 1, 3, 2),
(1333, 7, 7, 1, 4, 2),
(1334, 4, 4, 1, 5, 2),
(1335, 5, 5, 1, 0, 3),
(1336, 13, 3, 1, 1, 3),
(1337, 5, 5, 1, 2, 3),
(1338, 13, 3, 1, 3, 3),
(1339, 4, 4, 1, 4, 3),
(1340, 2, 2, 1, 5, 3),
(1341, 13, 3, 1, 0, 4),
(1342, 14, 4, 2, 0, 0),
(1343, 18, 8, 2, 1, 0),
(1344, 3, 3, 2, 2, 0),
(1345, 14, 4, 2, 3, 0),
(1346, 18, 8, 2, 4, 0),
(1347, 12, 2, 2, 5, 0),
(1348, 16, 6, 2, 0, 1),
(1349, 1, 1, 2, 1, 1),
(1350, 3, 3, 2, 2, 1),
(1351, 3, 3, 2, 3, 1),
(1352, 15, 5, 2, 4, 1),
(1353, 16, 6, 2, 5, 1),
(1354, 17, 7, 2, 0, 2),
(1355, 1, 1, 2, 1, 2),
(1356, 18, 8, 2, 2, 2),
(1357, 18, 8, 2, 3, 2),
(1358, 12, 2, 2, 4, 2),
(1359, 3, 3, 2, 5, 2),
(1360, 18, 8, 2, 0, 3),
(1361, 3, 3, 2, 1, 3),
(1362, 3, 3, 2, 2, 3),
(1363, 3, 3, 2, 3, 3),
(1364, 17, 7, 2, 4, 3),
(1365, 15, 5, 2, 5, 3),
(1366, 18, 8, 2, 0, 4),
(1367, 5, 5, 3, 0, 0),
(1368, 13, 3, 3, 1, 0),
(1369, 4, 4, 3, 2, 0),
(1370, 13, 3, 3, 3, 0),
(1371, 6, 6, 3, 4, 0),
(1372, 13, 3, 3, 5, 0),
(1373, 13, 3, 3, 0, 1),
(1374, 13, 3, 3, 1, 1),
(1375, 8, 8, 3, 2, 1),
(1376, 7, 7, 3, 3, 1),
(1377, 8, 8, 3, 4, 1),
(1378, 2, 2, 3, 5, 1),
(1379, 8, 8, 3, 0, 2),
(1380, 13, 3, 3, 1, 2),
(1381, 1, 1, 3, 2, 2),
(1382, 8, 8, 3, 3, 2),
(1383, 6, 6, 3, 4, 2),
(1384, 2, 2, 3, 5, 2),
(1385, 4, 4, 3, 0, 3),
(1386, 1, 1, 3, 1, 3),
(1387, 13, 3, 3, 2, 3),
(1388, 8, 8, 3, 3, 3),
(1389, 5, 5, 3, 4, 3),
(1390, 7, 7, 3, 5, 3),
(1391, 8, 8, 3, 0, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `Topic`
--

CREATE TABLE `Topic` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Topic`
--

INSERT INTO `Topic` (`ID`, `Name`, `Description`) VALUES
(1, 'History', 'Subject Description 1'),
(2, 'Physics', 'Subject Description 2'),
(3, 'Maths', 'Subject Description 3'),
(4, 'Science', 'Subject Description 4'),
(5, 'Geography', 'Subject Description 5'),
(6, 'Art', 'Subject Description 6'),
(7, 'Music', 'Subject Description 7'),
(8, 'Literature', 'Subject Description 8'),
(9, 'Physical Education', 'Subject Description 9'),
(10, 'Philosophy', 'Subject Description 10');

-- --------------------------------------------------------

--
-- Struttura della tabella `TopicRecord`
--

CREATE TABLE `TopicRecord` (
  `ID` int(11) NOT NULL,
  `TeacherID` int(11) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Description` varchar(512) NOT NULL,
  `TopicID` int(11) NOT NULL,
  `SpecificClassID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `TopicRecord`
--

INSERT INTO `TopicRecord` (`ID`, `TeacherID`, `Timestamp`, `Description`, `TopicID`, `SpecificClassID`) VALUES
(3, 1, '2019-12-02 07:00:00', 'Italy enters the first world war ', 1, 3),
(5, 1, '2019-12-02 11:00:00', 'The Scientific Revolution ', 1, 3),
(9, 2, '2019-12-01 23:00:00', 'Italy enters the first world war', 1, 2),
(10, 1, '2019-12-02 10:00:00', 'Fluid dynamics', 2, 1),
(12, 1, '2019-12-03 09:00:00', 'angular momentum', 2, 1),
(13, 7, '2019-12-01 23:00:00', 'Atoms', 4, 3),
(14, 7, '2019-12-01 23:00:00', 'Lagrangean Relaxation', 3, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `TopicTeacherClass`
--

CREATE TABLE `TopicTeacherClass` (
  `ID` int(11) NOT NULL,
  `TeacherID` int(11) NOT NULL,
  `TopicID` int(11) NOT NULL,
  `SpecificClassID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `TopicTeacherClass`
--

INSERT INTO `TopicTeacherClass` (`ID`, `TeacherID`, `TopicID`, `SpecificClassID`) VALUES
(1, 1, 1, 1),
(8, 3, 3, 1),
(10, 4, 4, 1),
(11, 5, 5, 1),
(12, 6, 6, 1),
(13, 7, 7, 1),
(14, 8, 8, 1),
(17, 12, 2, 2),
(18, 13, 3, 2),
(19, 14, 4, 2),
(20, 15, 5, 2),
(21, 16, 6, 2),
(22, 17, 7, 2),
(23, 18, 8, 2),
(24, 7, 7, 3),
(25, 3, 4, 3),
(26, 2, 2, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `UploadedClassDocuments`
--

CREATE TABLE `UploadedClassDocuments` (
  `ID` int(11) NOT NULL,
  `FileName` varchar(255) NOT NULL,
  `DiskFileName` varchar(255) NOT NULL,
  `SpecificClassID` int(11) NOT NULL,
  `Description` text NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SubjectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `UploadedClassDocuments`
--

INSERT INTO `UploadedClassDocuments` (`ID`, `FileName`, `DiskFileName`, `SpecificClassID`, `Description`, `Date`, `SubjectID`) VALUES
(5, 'HistoryNotes.txt', '4147fc3ec062e49b5f19c5a4c9078329_HistoryNotes.txt', 1, 'History Notes', '2019-12-16 12:11:52', 1),
(9, 'Notes.txt', '5dc4c3e30a85be5a5099b423cd6361ac_Notes.txt', 2, 'notes ', '2019-12-17 14:51:39', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `User`
--

CREATE TABLE `User` (
  `ID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Surname` varchar(200) NOT NULL,
  `Email` text NOT NULL,
  `Password` text NOT NULL,
  `UserGroup` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `User`
--

INSERT INTO `User` (`ID`, `Name`, `Surname`, `Email`, `Password`, `UserGroup`) VALUES
(1, 'Mary', 'Smith', 'pns1a@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'parent'),
(2, 'Joseph', 'Geller', 'pns2a@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'parent'),
(3, 'Marco', 'Torchiano', 'marco.torchiano@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher'),
(4, 'Paolo', 'Montuschi', 'teach2@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher'),
(5, 'Renato', 'Ferrero', 'teach3@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher'),
(6, 'Elen', 'Baralis', 'teach4@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher'),
(7, 'Mauro', 'Morisio', 'teach5@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher'),
(8, 'Bartolo', 'Montrucchio', 'teach6@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher'),
(9, 'Tony', 'Lioy', 'tony.lioy@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher'),
(10, 'John', 'Price', 'john.price@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'officer'),
(11, 'Paul', 'MacMillan', 'paul.macmillan@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'officer'),
(44, 'Jude', 'surname', 'd1226143@urhen.com', '$2y$12$30A4FAueTEgqlQBS8tFsbeRcqpB6MNvkEfSk5odHdJHoEJkF7Z4h2', 'parent'),
(45, 'Elisabeth', 'surname', 'pns4@io.io', '$2y$12$30A4FAueTEgqlQBS8tFsbeRcqpB6MNvkEfSk5odHdJHoEJkF7Z4h2', 'parent'),
(46, 'System', 'Administrator', 'sysadmin@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'admin'),
(55, 'Tony', 'Lioy', 'tony.lioy@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'parent'),
(56, 'Fei Fei', 'Li', 'lifeifei@gmail.com', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'parent'),
(57, 'Antonio', 'Vetro', 'antonio.vetro@io.io', '$2y$12$wh/CWpnhPY/pQ2xzNLZMIemWcJ62UnNJv0omRDt5.Px8gFUp8rfim', 'teacher'),
(64, 'Mario', 'Baldi', 'mario.baldi@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher'),
(65, 'Lorenzo', 'Insigne', 'lorenzo.insigne@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher'),
(66, 'Luca', 'Ardito', 'luca.ardito@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher'),
(67, 'Rino', 'Gattuso', 'rino.gattuso@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher'),
(68, 'Marek', 'Hamsik', 'marek.hamsik@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher'),
(69, 'Maurizio', 'Rebaudengo', 'maurizio.rebaudengo@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher'),
(70, 'Paolo', 'Garza', 'paolo.garza@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher'),
(71, 'Bufalino', 'Stefania', 'stefania.bufalino@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher'),
(72, 'No', 'Teacher', 'NoTeacher@io.io', '$2y$12$ZOB4hLXsBQmRWwU7u0hP4e3GUbyOEg7Gll1ZJMEDd4d4sWiqDE8by', 'teacher');

-- --------------------------------------------------------

--
-- Struttura della tabella `YearClass`
--

CREATE TABLE `YearClass` (
  `ID` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `TotHours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `YearClass`
--

INSERT INTO `YearClass` (`ID`, `Year`, `TotHours`) VALUES
(1, 1, 25),
(2, 2, 27),
(3, 3, 30);

-- --------------------------------------------------------

--
-- Struttura della tabella `YearTopicHour`
--

CREATE TABLE `YearTopicHour` (
  `ID` int(11) NOT NULL,
  `YearClassID` int(11) NOT NULL,
  `TopicID` int(11) NOT NULL,
  `Hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `YearTopicHour`
--

INSERT INTO `YearTopicHour` (`ID`, `YearClassID`, `TopicID`, `Hours`) VALUES
(1, 1, 1, 2),
(2, 1, 2, 2),
(3, 1, 3, 7),
(4, 1, 4, 2),
(5, 1, 5, 2),
(6, 1, 6, 2),
(7, 1, 7, 2),
(8, 1, 8, 6),
(9, 2, 1, 2),
(10, 2, 2, 3),
(11, 2, 3, 8),
(12, 2, 4, 2),
(13, 2, 5, 2),
(14, 2, 6, 2),
(15, 2, 7, 2),
(16, 2, 8, 6),
(17, 3, 1, 2),
(18, 3, 2, 3),
(19, 3, 3, 10),
(20, 3, 4, 3),
(21, 3, 5, 2),
(22, 3, 6, 2),
(23, 3, 7, 2),
(24, 3, 8, 6);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Communication`
--
ALTER TABLE `Communication`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `OfficerID` (`OfficerID`);

--
-- Indici per le tabelle `FinalGrades`
--
ALTER TABLE `FinalGrades`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_finalgrades_studentID` (`StudentID`),
  ADD KEY `fk_finalgrades_topicID` (`TopicID`),
  ADD KEY `fk_finalgrades_termID` (`TermID`);

--
-- Indici per le tabelle `Homework`
--
ALTER TABLE `Homework`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SpecificClassID` (`SpecificClassID`),
  ADD KEY `TeacherID` (`TeacherID`),
  ADD KEY `HOMEWORK_TOPIC_INDEX` (`TopicID`);

--
-- Indici per le tabelle `MarksRecord`
--
ALTER TABLE `MarksRecord`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `TopicID` (`TopicID`);

--
-- Indici per le tabelle `MeetingReservation`
--
ALTER TABLE `MeetingReservation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `TeacherAvailabilityID` (`TeacherAvailabilityID`);

--
-- Indici per le tabelle `Note`
--
ALTER TABLE `Note`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `NoteRecord`
--
ALTER TABLE `NoteRecord`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `NotPresentRecord`
--
ALTER TABLE `NotPresentRecord`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `SpecificClassID` (`SpecificClassID`);

--
-- Indici per le tabelle `Officer`
--
ALTER TABLE `Officer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indici per le tabelle `Parent`
--
ALTER TABLE `Parent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indici per le tabelle `SpecificClass`
--
ALTER TABLE `SpecificClass`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CoordinatorTeacherID` (`CoordinatorTeacherID`);

--
-- Indici per le tabelle `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SpecificClassID` (`SpecificClassID`);

--
-- Indici per le tabelle `Teacher`
--
ALTER TABLE `Teacher`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indici per le tabelle `TeacherAvailability`
--
ALTER TABLE `TeacherAvailability`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TeacherID` (`TeacherID`);

--
-- Indici per le tabelle `Terms`
--
ALTER TABLE `Terms`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `Timetables`
--
ALTER TABLE `Timetables`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `TeacherID_2` (`TeacherID`,`DayOfWeek`,`HourSlot`),
  ADD KEY `TeacherID` (`TeacherID`),
  ADD KEY `TopicID` (`TopicID`),
  ADD KEY `SpecificClassID` (`SpecificClassID`);

--
-- Indici per le tabelle `Topic`
--
ALTER TABLE `Topic`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `TopicRecord`
--
ALTER TABLE `TopicRecord`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `TopicTeacherClass`
--
ALTER TABLE `TopicTeacherClass`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TeacherID` (`TeacherID`),
  ADD KEY `TopicID` (`TopicID`),
  ADD KEY `SpecificClassID` (`SpecificClassID`);

--
-- Indici per le tabelle `UploadedClassDocuments`
--
ALTER TABLE `UploadedClassDocuments`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `YearClass`
--
ALTER TABLE `YearClass`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `YearTopicHour`
--
ALTER TABLE `YearTopicHour`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `YearClassID` (`YearClassID`),
  ADD KEY `TopicID` (`TopicID`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Communication`
--
ALTER TABLE `Communication`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT per la tabella `FinalGrades`
--
ALTER TABLE `FinalGrades`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT per la tabella `Homework`
--
ALTER TABLE `Homework`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT per la tabella `MarksRecord`
--
ALTER TABLE `MarksRecord`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT per la tabella `MeetingReservation`
--
ALTER TABLE `MeetingReservation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT per la tabella `Note`
--
ALTER TABLE `Note`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT per la tabella `NoteRecord`
--
ALTER TABLE `NoteRecord`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT per la tabella `NotPresentRecord`
--
ALTER TABLE `NotPresentRecord`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT per la tabella `Officer`
--
ALTER TABLE `Officer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT per la tabella `Parent`
--
ALTER TABLE `Parent`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT per la tabella `SpecificClass`
--
ALTER TABLE `SpecificClass`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT per la tabella `Student`
--
ALTER TABLE `Student`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT per la tabella `Teacher`
--
ALTER TABLE `Teacher`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT per la tabella `TeacherAvailability`
--
ALTER TABLE `TeacherAvailability`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT per la tabella `Terms`
--
ALTER TABLE `Terms`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `Timetables`
--
ALTER TABLE `Timetables`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1392;
--
-- AUTO_INCREMENT per la tabella `Topic`
--
ALTER TABLE `Topic`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT per la tabella `TopicRecord`
--
ALTER TABLE `TopicRecord`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT per la tabella `TopicTeacherClass`
--
ALTER TABLE `TopicTeacherClass`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT per la tabella `UploadedClassDocuments`
--
ALTER TABLE `UploadedClassDocuments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT per la tabella `User`
--
ALTER TABLE `User`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT per la tabella `YearClass`
--
ALTER TABLE `YearClass`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT per la tabella `YearTopicHour`
--
ALTER TABLE `YearTopicHour`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Communication`
--
ALTER TABLE `Communication`
  ADD CONSTRAINT `fk_officerID2` FOREIGN KEY (`OfficerID`) REFERENCES `Officer` (`ID`);

--
-- Limiti per la tabella `FinalGrades`
--
ALTER TABLE `FinalGrades`
  ADD CONSTRAINT `fk_finalgrades_studentID` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`ID`),
  ADD CONSTRAINT `fk_finalgrades_termID` FOREIGN KEY (`TermID`) REFERENCES `Terms` (`ID`),
  ADD CONSTRAINT `fk_finalgrades_topicID` FOREIGN KEY (`TopicID`) REFERENCES `Topic` (`ID`);

--
-- Limiti per la tabella `Homework`
--
ALTER TABLE `Homework`
  ADD CONSTRAINT `FK_HOMEWORK_TOPIC` FOREIGN KEY (`TopicID`) REFERENCES `Topic` (`ID`),
  ADD CONSTRAINT `fk_specificClassID2` FOREIGN KEY (`SpecificClassID`) REFERENCES `SpecificClass` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_teacherID3` FOREIGN KEY (`TeacherID`) REFERENCES `Teacher` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `MarksRecord`
--
ALTER TABLE `MarksRecord`
  ADD CONSTRAINT `fk_student` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_topic` FOREIGN KEY (`TopicID`) REFERENCES `Topic` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `MeetingReservation`
--
ALTER TABLE `MeetingReservation`
  ADD CONSTRAINT `fk_parentID_MR` FOREIGN KEY (`ParentID`) REFERENCES `Parent` (`ID`),
  ADD CONSTRAINT `fk_teacherAvailabilityID_MR` FOREIGN KEY (`TeacherAvailabilityID`) REFERENCES `TeacherAvailability` (`ID`);

--
-- Limiti per la tabella `NotPresentRecord`
--
ALTER TABLE `NotPresentRecord`
  ADD CONSTRAINT `fk_specificClassID5` FOREIGN KEY (`SpecificClassID`) REFERENCES `SpecificClass` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_studentID3` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `Officer`
--
ALTER TABLE `Officer`
  ADD CONSTRAINT `fk_officerID` FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `Parent`
--
ALTER TABLE `Parent`
  ADD CONSTRAINT `fk_parentID` FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_studentID` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `SpecificClass`
--
ALTER TABLE `SpecificClass`
  ADD CONSTRAINT `fk_coordTeacherID` FOREIGN KEY (`CoordinatorTeacherID`) REFERENCES `Teacher` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `fk_specificClassID3` FOREIGN KEY (`SpecificClassID`) REFERENCES `SpecificClass` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `Teacher`
--
ALTER TABLE `Teacher`
  ADD CONSTRAINT `fk_teacherID` FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `TeacherAvailability`
--
ALTER TABLE `TeacherAvailability`
  ADD CONSTRAINT `fk_teacherID_TA` FOREIGN KEY (`TeacherID`) REFERENCES `Teacher` (`ID`);

--
-- Limiti per la tabella `Timetables`
--
ALTER TABLE `Timetables`
  ADD CONSTRAINT `fk_timetables_specificclass` FOREIGN KEY (`SpecificClassID`) REFERENCES `SpecificClass` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_timetables_teacher` FOREIGN KEY (`TeacherID`) REFERENCES `Teacher` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_timetables_topic` FOREIGN KEY (`TopicID`) REFERENCES `Topic` (`ID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `TopicTeacherClass`
--
ALTER TABLE `TopicTeacherClass`
  ADD CONSTRAINT `fk_specificclassID` FOREIGN KEY (`SpecificClassID`) REFERENCES `SpecificClass` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_teacherID2` FOREIGN KEY (`TeacherID`) REFERENCES `Teacher` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_topicID` FOREIGN KEY (`TopicID`) REFERENCES `Topic` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `YearTopicHour`
--
ALTER TABLE `YearTopicHour`
  ADD CONSTRAINT `fk_TopicID_YTH` FOREIGN KEY (`TopicID`) REFERENCES `Topic` (`ID`),
  ADD CONSTRAINT `fk_YearClassID_YTH` FOREIGN KEY (`YearClassID`) REFERENCES `YearClass` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
