-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2022 at 03:50 PM
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
-- Database: `jela_svijeta`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_en`
--

CREATE TABLE `category_en` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_en`
--

INSERT INTO `category_en` (`id`, `title`) VALUES
(1, 'Salad'),
(2, 'Soup'),
(3, 'Cake'),
(4, 'Main dish'),
(5, 'Pre-meal');

-- --------------------------------------------------------

--
-- Table structure for table `category_hr`
--

CREATE TABLE `category_hr` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `slug` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_hr`
--

INSERT INTO `category_hr` (`id`, `title`, `slug`) VALUES
(1, 'Salata', 'salata'),
(2, 'Juha', 'juha'),
(3, 'Kolac', 'kolac'),
(4, 'Glavno jelo', 'glavno-jelo'),
(5, 'Predjelo', 'predjelo');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_en`
--

CREATE TABLE `ingredient_en` (
  `title` varchar(45) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ingredient_en`
--

INSERT INTO `ingredient_en` (`title`, `id`) VALUES
('Mushrooms', 1),
('Chicken drums', 2),
('Potatoes', 3),
('Butter', 4),
('Milk', 5),
('Garlic', 6),
('Lemon', 7),
('Carrot', 8),
('Sunflower oil', 9),
('Paprika - fresh', 10),
('Paprika - ground', 11),
('Ground meat', 12),
('Cheese - shreded', 13),
('Pasta', 14),
('Bacon', 15),
('Water', 16),
('Tomato paste', 17);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_hr`
--

CREATE TABLE `ingredient_hr` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `slug` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ingredient_hr`
--

INSERT INTO `ingredient_hr` (`id`, `title`, `slug`) VALUES
(1, 'Šampinjoni', 'sampinjoni'),
(2, 'Pileći batci', 'pileci-batci'),
(3, 'Krumpir', 'krumpir'),
(4, 'Maslac', 'maslac'),
(5, 'Mlijeko', 'mlijeko'),
(6, 'Češnjak', 'cesnjak'),
(7, 'Limun', 'limun'),
(8, 'Mrkva', 'mrkva'),
(9, 'Suncokretovo ulje', 'suncokretovo-ulje'),
(10, 'Paprika svježa', 'paprika-svjeza'),
(11, 'Paprika mljevena', 'paprika-mljevena'),
(12, 'Mljeveno meso', 'mljeveno-meso'),
(13, 'Sir naribani', 'sir-naribani'),
(14, 'Tjestenina', 'tjestenina'),
(15, 'Špek', 'spek'),
(16, 'Voda', 'voda'),
(17, 'Pasirana rajčica', 'pasirana-rajcica');

-- --------------------------------------------------------

--
-- Table structure for table `lang`
--

CREATE TABLE `lang` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lang`
--

INSERT INTO `lang` (`id`, `title`) VALUES
(2, 'en'),
(1, 'hr');

-- --------------------------------------------------------

--
-- Table structure for table `meal_en`
--

CREATE TABLE `meal_en` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meal_en`
--

INSERT INTO `meal_en` (`id`, `title`) VALUES
(1, 'Chicken drums with mashed potatoes'),
(4, 'Fast časagna'),
(5, 'Mushrooms with garlic'),
(6, 'Bolagnese'),
(7, 'Chocolate pie'),
(8, 'Meal without category');

-- --------------------------------------------------------

--
-- Table structure for table `meal_has_ingredient`
--

CREATE TABLE `meal_has_ingredient` (
  `Meal_id` int(11) NOT NULL,
  `Ingredient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meal_has_ingredient`
--

INSERT INTO `meal_has_ingredient` (`Meal_id`, `Ingredient_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 11),
(4, 4),
(4, 6),
(4, 12),
(4, 14),
(4, 17),
(5, 1),
(5, 4),
(5, 6),
(5, 11),
(6, 12),
(6, 14),
(7, 4),
(7, 5),
(8, 3),
(8, 4),
(8, 10),
(8, 12);

-- --------------------------------------------------------

--
-- Table structure for table `meal_has_tag`
--

CREATE TABLE `meal_has_tag` (
  `Meal_id` int(11) NOT NULL,
  `Tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meal_has_tag`
--

INSERT INTO `meal_has_tag` (`Meal_id`, `Tag_id`) VALUES
(1, 1),
(1, 4),
(4, 5),
(5, 3),
(5, 5),
(6, 5),
(7, 4),
(7, 7),
(7, 8),
(8, 6);

-- --------------------------------------------------------

--
-- Table structure for table `meal_hr`
--

CREATE TABLE `meal_hr` (
  `id` int(11) NOT NULL,
  `Category_id` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meal_hr`
--

INSERT INTO `meal_hr` (`id`, `Category_id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 'Pileći batci s pire krumpirom', '2022-07-06', NULL, NULL),
(4, NULL, 'Brzinske lazanje', '2022-07-07', NULL, NULL),
(5, 5, 'Šampinjoni sa češnjakom', '2022-07-07', NULL, NULL),
(6, 4, 'Bolanjez', '2022-07-05', NULL, NULL),
(7, 3, 'Čokoladna pita', '2022-07-05', NULL, NULL),
(8, NULL, 'Jelo bez kategorije', '2022-07-07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tag_en`
--

CREATE TABLE `tag_en` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag_en`
--

INSERT INTO `tag_en` (`id`, `title`) VALUES
(1, 'Chicken'),
(2, 'Pork'),
(3, 'Salad'),
(4, 'Oven'),
(5, 'Fast made'),
(6, 'Soup'),
(7, 'Dessert'),
(8, 'Chocolate');

-- --------------------------------------------------------

--
-- Table structure for table `tag_hr`
--

CREATE TABLE `tag_hr` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `slug` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag_hr`
--

INSERT INTO `tag_hr` (`id`, `title`, `slug`) VALUES
(1, 'Piletina', 'piletina'),
(2, 'Svinjetina', 'svinjetina'),
(3, 'Salata', 'salata'),
(4, 'Pećnica', 'pecnica'),
(5, 'Brza priprema', 'brza-priprema'),
(6, 'Juha', 'juha'),
(7, 'Desert', 'desert'),
(8, 'Čokoladno', 'cokoladno');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_en`
--
ALTER TABLE `category_en`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Category_hr_id_UNIQUE` (`id`),
  ADD KEY `fk_Category_en_Category_hr1_idx` (`id`);

--
-- Indexes for table `category_hr`
--
ALTER TABLE `category_hr`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `slug_UNIQUE` (`slug`);

--
-- Indexes for table `ingredient_en`
--
ALTER TABLE `ingredient_en`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Ingredient_en_Ingredient_hr1_idx` (`id`);

--
-- Indexes for table `ingredient_hr`
--
ALTER TABLE `ingredient_hr`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `lang`
--
ALTER TABLE `lang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `title_UNIQUE` (`title`);

--
-- Indexes for table `meal_en`
--
ALTER TABLE `meal_en`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Meal_en_Meal_hr1_idx` (`id`);

--
-- Indexes for table `meal_has_ingredient`
--
ALTER TABLE `meal_has_ingredient`
  ADD PRIMARY KEY (`Meal_id`,`Ingredient_id`),
  ADD KEY `fk_Meal_has_Ingredient_Ingredient1_idx` (`Ingredient_id`),
  ADD KEY `fk_Meal_has_Ingredient_Meal1_idx` (`Meal_id`);

--
-- Indexes for table `meal_has_tag`
--
ALTER TABLE `meal_has_tag`
  ADD PRIMARY KEY (`Meal_id`,`Tag_id`),
  ADD KEY `fk_Meal_has_Tag_Tag1_idx` (`Tag_id`),
  ADD KEY `fk_Meal_has_Tag_Meal1_idx` (`Meal_id`);

--
-- Indexes for table `meal_hr`
--
ALTER TABLE `meal_hr`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Meal_Category_idx` (`Category_id`);

--
-- Indexes for table `tag_en`
--
ALTER TABLE `tag_en`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Tag_hr_id_UNIQUE` (`id`),
  ADD KEY `fk_Tag_en_Tag_hr1_idx` (`id`);

--
-- Indexes for table `tag_hr`
--
ALTER TABLE `tag_hr`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `slug_UNIQUE` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_hr`
--
ALTER TABLE `category_hr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ingredient_hr`
--
ALTER TABLE `ingredient_hr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `lang`
--
ALTER TABLE `lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meal_hr`
--
ALTER TABLE `meal_hr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tag_hr`
--
ALTER TABLE `tag_hr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_en`
--
ALTER TABLE `category_en`
  ADD CONSTRAINT `fk_Category_en_Category_hr1` FOREIGN KEY (`id`) REFERENCES `category_hr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ingredient_en`
--
ALTER TABLE `ingredient_en`
  ADD CONSTRAINT `fk_Ingredient_en_Ingredient_hr1` FOREIGN KEY (`id`) REFERENCES `ingredient_hr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `meal_en`
--
ALTER TABLE `meal_en`
  ADD CONSTRAINT `fk_Meal_en_Meal_hr1` FOREIGN KEY (`id`) REFERENCES `meal_hr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `meal_has_ingredient`
--
ALTER TABLE `meal_has_ingredient`
  ADD CONSTRAINT `fk_Meal_has_Ingredient_Ingredient1` FOREIGN KEY (`Ingredient_id`) REFERENCES `ingredient_hr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Meal_has_Ingredient_Meal1` FOREIGN KEY (`Meal_id`) REFERENCES `meal_hr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `meal_has_tag`
--
ALTER TABLE `meal_has_tag`
  ADD CONSTRAINT `fk_Meal_has_Tag_Meal1` FOREIGN KEY (`Meal_id`) REFERENCES `meal_hr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Meal_has_Tag_Tag1` FOREIGN KEY (`Tag_id`) REFERENCES `tag_hr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `meal_hr`
--
ALTER TABLE `meal_hr`
  ADD CONSTRAINT `fk_Meal_Category` FOREIGN KEY (`Category_id`) REFERENCES `category_hr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tag_en`
--
ALTER TABLE `tag_en`
  ADD CONSTRAINT `fk_Tag_en_Tag_hr1` FOREIGN KEY (`id`) REFERENCES `tag_hr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
