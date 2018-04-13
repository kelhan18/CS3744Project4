-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 13, 2018 at 09:34 PM
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
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(10) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `profile_id`, `description`) VALUES
(4, 6, 'you followed kelhan18'),
(5, 5, 'campbel1 followed you'),
(18, 6, 'you followed tonym301'),
(19, 8, 'campbel1 followed you'),
(20, 6, 'you unfollowed tonym301'),
(21, 8, 'campbel1 unfollowed you'),
(22, 6, 'you followed tonym301'),
(23, 8, 'campbel1 followed you'),
(24, 6, 'you followed staciw93'),
(25, 7, 'campbel1 followed you'),
(38, 6, 'you created the topic: '),
(39, 5, 'you unfollowed A'),
(40, 21, 'kelhan18 unfollowed you'),
(53, 6, 'you followed mpuck'),
(54, 25, 'campbel1 followed you'),
(55, 6, 'you created the topic \'What changed after the battle?\''),
(56, 26, 'you followed kelhan18'),
(57, 5, 'mturktest followed you'),
(58, 26, 'you unfollowed kelhan18'),
(59, 5, 'mturktest unfollowed you'),
(60, 26, 'you created the topic \'Mturktest post here.\''),
(61, 26, 'you added a post in the topic \'Mturktest post here.\''),
(62, 26, 'you added a post in the topic \'Mturktest post here.\''),
(63, 26, 'you followed staciw93'),
(64, 7, 'mturktest followed you'),
(65, 26, 'you unfollowed staciw93'),
(66, 7, 'mturktest unfollowed you'),
(67, 26, 'you added a post in the topic \'Mturktest post here.\''),
(68, 26, 'you followed campbel1'),
(69, 6, 'mturktest followed you'),
(70, 26, 'you unfollowed campbel1'),
(71, 6, 'mturktest unfollowed you');

-- --------------------------------------------------------

--
-- Table structure for table `activityhome`
--

CREATE TABLE `activityhome` (
  `id` int(10) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activityhome`
--

INSERT INTO `activityhome` (`id`, `description`) VALUES
(1, 'campbel1 followed A'),
(2, 'campbel1 unfollowed A'),
(3, 'campbel1 unfollowed kelhan18'),
(4, 'campbel1 unfollowed tonym301'),
(5, 'campbel1 followed tonym301'),
(6, 'campbel1 followed kelhan18'),
(7, 'campbel1 followed mpuck'),
(8, 'The topic \'What changed after the battle?\' was created'),
(9, 'mturktest followed kelhan18'),
(10, 'mturktest unfollowed kelhan18'),
(11, 'The topic \'Mturktest post here.\' was created'),
(12, 'mturktest followed staciw93'),
(13, 'mturktest unfollowed staciw93'),
(14, 'mturktest followed campbel1'),
(15, 'mturktest unfollowed campbel1');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` int(10) NOT NULL,
  `username` varchar(40) NOT NULL,
  `follower` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `username`, `follower`) VALUES
(14, 'prof', 'kelhan18'),
(15, 'tonym301', 'kelhan18'),
(16, 'staciw93', 'kelhan18'),
(17, 'McGrathT', 'kelhan18'),
(18, 'kelhan18', 'C'),
(19, 'kelhan18', 'tonym301'),
(20, 'prof', 'tonym301'),
(21, 'kelhan18', 'prof'),
(25, 'kelhan18', 'mpuck'),
(47, 'staciw93', 'campbel1'),
(49, 'tonym301', 'campbel1'),
(50, 'kelhan18', 'campbel1'),
(51, 'mpuck', 'campbel1');

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
(54, 'Ooops, I apologize.', '2018-04-02', 33, 5),
(55, 'test', '2018-04-05', 32, 12),
(56, 'test1', '2018-04-05', 32, 12),
(68, '**** thus class', '2018-04-12', 32, 25),
(74, 'test', '2018-04-13', 39, 26),
(75, 'alksj', '2018-04-13', 39, 26),
(76, 'blah', '2018-04-13', 39, 26);

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
  `role` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `address` varchar(40) NOT NULL,
  `timezone` varchar(120) NOT NULL,
  `number_posts` int(10) DEFAULT '0',
  `number_following` int(10) NOT NULL DEFAULT '0',
  `number_followers` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`profile_id`, `firstname`, `lastname`, `username`, `password`, `role`, `email`, `address`, `timezone`, `number_posts`, `number_following`, `number_followers`) VALUES
(5, 'Keller', 'Han', 'kelhan18', 'gui', 'Owner', 'kelhan18@vt.edu', '1800 Main Street', '(GMT -5:00) Eastern Time (US & Canada), Bogota, Lima', 5, 4, 5),
(6, 'Campbell', 'johnson', 'campbel1', 'gui', 'Owner', '', '', '', 9, 4, 0),
(7, 'Staci', 'Williams', 'staciw93', 'gui', 'Owner', '', '', '', 15, 0, 2),
(8, 'Anthony', 'Medovar', 'tonym301', 'gui', 'Owner', '', '', '', 9, 2, 2),
(12, 'Professor', 'cs3744', 'prof', 'gui', 'Admin', '', '', '', 2, 1, 2),
(13, 'Thomas', 'McGrath', 'McGrathT', 'Freedom21!', 'Admin', '', '', '', 0, 0, 1),
(21, 'Ty', 'Jones', 'A', 'Y', 'Normal User', 'jonesta@gmail.com', 'No Thanks', '(GMT -5:00) Eastern Time (US & Canada), Bogota, Lima', 0, 0, 0),
(24, 'A', 'B', 'C', 'D', 'Normal User', 'asdih@yahoo.com', 'N/A', '(GMT -5:00) Eastern Time (US & Canada), Bogota, Lima', 0, 1, 0),
(25, 'Marley', 'Puckett', 'mpuck', 'gui', 'Normal User', 'ihijn@fejiu.com', 'ihbijnmk', '(GMT -5:00) Eastern Time (US & Canada), Bogota, Lima', 1, 1, 1),
(26, 'Mturk', 'Test', 'mturktest', 'test', 'Normal User', 'blahblah@blah.com', 'N/A', '(GMT -5:00) Eastern Time (US & Canada), Bogota, Lima', 3, 0, 0);

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
(32, 'What was the battle like and who were the countries that were involved?', '2018-04-02', 5),
(33, 'What kind of technology has developed since then?', '2005-05-10', 3),
(34, 'What were some of the experiences from the battle? (From both sides)', '2018-03-30', 1),
(38, 'What changed after the battle?', '2018-04-13', 0),
(39, 'Mturktest post here.', '2018-04-13', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activityhome`
--
ALTER TABLE `activityhome`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `activityhome`
--
ALTER TABLE `activityhome`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `profile_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `topic_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
