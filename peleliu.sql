-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 02, 2018 at 02:05 AM
-- Server version: 5.6.39
-- PHP Version: 7.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peleliu`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(10) NOT NULL,
  `description` mediumtext NOT NULL,
  `date_posted` date NOT NULL,
  `topic_id` int(10) NOT NULL,
  `profile_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `description`, `date_posted`, `topic_id`, `profile_id`) VALUES
(49, 'The countries involved were the Unites states and Japan!', '2018-04-02', 32, 8),
(50, 'Nuclear bombs!!', '2018-04-02', 33, 8),
(51, 'The battle was very gruesome and lasted a while.', '2018-04-02', 32, 5),
(52, 'The us and japanese lost many soldiers.', '2018-04-02', 34, 5),
(53, 'They turn everything to **** ', '2018-04-02', 33, 5),
(54, 'Ooops, I apologize.', '2018-04-02', 33, 5);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `profile_id` int(10) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `photo` varchar(40) DEFAULT NULL,
  `number_posts` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`profile_id`, `firstname`, `lastname`, `username`, `password`, `photo`, `number_posts`) VALUES
(5, 'Keller', 'Han', 'kelhan18', 'gui', NULL, 5),
(6, 'Campbell', 'johnson', 'campbel1', 'gui', NULL, 0),
(7, 'Staci', 'Williams', 'staciw93', 'gui', NULL, 15),
(8, 'Anthony', 'Medovar', 'tonym301', 'gui', NULL, 9),
(12, 'Professor', 'cs3744', 'prof', 'gui', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `topic_id` int(10) NOT NULL,
  `topic` varchar(400) NOT NULL,
  `date_posted` date DEFAULT NULL,
  `number_posts` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`topic_id`, `topic`, `date_posted`, `number_posts`) VALUES
(32, 'What was the battle like and who were the countries that were involved?', '2018-04-02', 2),
(33, 'What kind of technology has developed since then?', '2005-05-10', 3),
(34, 'What were some of the experiences from the battle? (From both sides)', '2018-03-30', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`topic_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `profile_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `topic_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
