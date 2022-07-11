-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2022 at 09:05 PM
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
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `slug` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `slug`) VALUES
(1, 'Salata', 'salata'),
(2, 'Juha', 'juha'),
(3, 'Kolac', 'kolac'),
(4, 'Glavno jelo', 'glavno-jelo'),
(5, 'Predjelo', 'predjelo');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `slug` varchar(45) NOT NULL,
  `title_en` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`id`, `title`, `slug`, `title_en`) VALUES
(1, 'Šampinjoni', 'sampinjoni', 1),
(2, 'Pileći batci', 'pileci-batci', 2),
(3, 'Krumpir', 'krumpir', 3),
(4, 'Maslac', 'maslac', 4),
(5, 'Mlijeko', 'mlijeko', 5),
(6, 'Češnjak', 'cesnjak', 6),
(7, 'Limun', 'limun', 7),
(8, 'Mrkva', 'mrkva', 8),
(9, 'Suncokretovo ulje', 'suncokretovo-ulje', 9),
(10, 'Paprika svježa', 'paprika-svjeza', 10),
(11, 'Paprika mljevena', 'paprika-mljevena', 11),
(12, 'Mljeveno meso', 'mljeveno-meso', 12),
(13, 'Sir naribani', 'sir-naribani', 13),
(14, 'Tjestenina', 'tjestenina', 14),
(15, 'Špek', 'spek', 15),
(16, 'Voda', 'voda', 16),
(17, 'Pasirana rajčica', 'pasirana-rajcica', 17);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_en`
--

CREATE TABLE `ingredient_en` (
  `id` int(11) NOT NULL,
  `title_en` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ingredient_en`
--

INSERT INTO `ingredient_en` (`id`, `title_en`) VALUES
(1, 'Mushrums'),
(2, 'Drum sticks'),
(3, 'Potatoes'),
(4, 'Butter'),
(5, 'Milk'),
(6, 'Garlic'),
(7, 'Lemon'),
(8, 'Carrot'),
(9, 'Oil'),
(10, 'Fresh paprika'),
(11, 'Ground paprika'),
(12, 'Ground meat'),
(13, 'Cheese shreded'),
(14, 'Pasta'),
(15, 'Bacon'),
(16, 'Water'),
(17, 'Tomatoes');

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
(1, 'hr'),
(2, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `meal`
--

CREATE TABLE `meal` (
  `id` int(11) NOT NULL,
  `Category_id` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'created',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `title_en_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meal`
--

INSERT INTO `meal` (`id`, `Category_id`, `title`, `status`, `created_at`, `updated_at`, `deleted_at`, `title_en_id`) VALUES
(1, 4, 'Pileći batci s pire krumpirom', 'created', '2022-07-06', NULL, NULL, 1),
(4, NULL, 'Brzinske lazanje', 'deleted', '2022-07-07', NULL, '2022-07-09', 2),
(5, 5, 'Šampinjoni sa češnjakom', 'created', '2022-07-07', NULL, NULL, 3),
(6, 4, 'Bolanjez', 'deleted', '2022-07-05', NULL, '2022-07-12', 4),
(7, 3, 'Čokoladna pita', 'created', '2022-07-05', NULL, NULL, 5),
(8, NULL, 'Jelo bez kategorije', 'created', '2022-07-07', NULL, NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `meal_en`
--

CREATE TABLE `meal_en` (
  `id` int(11) NOT NULL,
  `title_en` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meal_en`
--

INSERT INTO `meal_en` (`id`, `title_en`) VALUES
(1, 'Chicken drumsticks with mashed potatoes'),
(2, 'Fast lasagna'),
(3, 'Mushrooms with garlic'),
(4, 'Bolagnese'),
(5, 'Chocolate pie'),
(6, 'Meal without category');

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
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `slug` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `title`, `slug`) VALUES
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
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `slug_UNIQUE` (`slug`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_ing_title_en` (`title_en`);

--
-- Indexes for table `ingredient_en`
--
ALTER TABLE `ingredient_en`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lang`
--
ALTER TABLE `lang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meal`
--
ALTER TABLE `meal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Meal_Category_idx` (`Category_id`),
  ADD KEY `fk_title_en` (`title_en_id`);

--
-- Indexes for table `meal_en`
--
ALTER TABLE `meal_en`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `slug_UNIQUE` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ingredient_en`
--
ALTER TABLE `ingredient_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `lang`
--
ALTER TABLE `lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meal`
--
ALTER TABLE `meal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `meal_en`
--
ALTER TABLE `meal_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `fk_ing_title_en` FOREIGN KEY (`title_en`) REFERENCES `ingredient_en` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meal`
--
ALTER TABLE `meal`
  ADD CONSTRAINT `fk_Meal_Category` FOREIGN KEY (`Category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_title_en` FOREIGN KEY (`title_en_id`) REFERENCES `meal_en` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meal_has_ingredient`
--
ALTER TABLE `meal_has_ingredient`
  ADD CONSTRAINT `fk_Meal_has_Ingredient_Ingredient1` FOREIGN KEY (`Ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Meal_has_Ingredient_Meal1` FOREIGN KEY (`Meal_id`) REFERENCES `meal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `meal_has_tag`
--
ALTER TABLE `meal_has_tag`
  ADD CONSTRAINT `fk_Meal_has_Tag_Meal1` FOREIGN KEY (`Meal_id`) REFERENCES `meal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Meal_has_Tag_Tag1` FOREIGN KEY (`Tag_id`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
