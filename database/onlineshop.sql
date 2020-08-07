-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 08 2020 г., 18:16
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `onlineshop`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@mail.ru', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Структура таблицы `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Apple'),
(2, 'Samsung'),
(3, 'Xiaomi'),
(4, 'Sony');

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(53, 2, '::1', 14, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1),
(149, 2, '::1', 12, 1),
(152, 2, '::1', 27, 1),
(154, 5, '::1', 27, 1),
(155, 22, '::1', 27, 1),
(156, 8, '::1', 27, 1),
(157, 4, '::1', 27, 1),
(189, 2, '::1', 29, 1),
(190, 3, '::1', 29, 1),
(192, 71, '::1', 30, 1),
(193, 73, '::1', 30, 1),
(194, 75, '::1', 30, 1),
(195, 4, '::1', 30, 1),
(217, 62, '::1', 26, 1),
(218, 64, '::1', 26, 1),
(220, 47, '::1', -1, 1),
(221, 39, '::1', -1, 1),
(222, 38, '::1', -1, 1),
(223, 35, '::1', -1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Ноутбуки'),
(2, 'Телефоны'),
(3, 'Аудио- и видеотехника'),
(4, 'Портативная техника');

-- --------------------------------------------------------

--
-- Структура таблицы `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@mail.ru'),
(6, 'alexey.0994@mail.ru'),
(7, 'ivanov@mail.ru'),
(8, 'dmitriev@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 1, 1, '07M47684BS5725041', 'Completed'),
(2, 26, 73, 1, '83L74263B5543785', 'Completed');

-- --------------------------------------------------------

--
-- Структура таблицы `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) NOT NULL,
  `country` varchar(255) CHARACTER SET utf8 NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `country`, `address`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Ян Артемьев', 'yan@mail.ru', 'Россия', 'Волгоград', 560074, 'Artemiev', '4321 2345 6788 7654', '12/25', 3, 77000, 1234),
(3, 26, 'Алексей Ермолаев', 'alexey.0994@mail.ru', 'Россия', 'Волгоград, ', 400000, 'Ermolaev Aleksey', '4276 1100 1234 4321', '12/22', 2, 11700, 123),
(4, 28, 'Арсений Эдуардович', 'ars@mail.ru', 'Россия', 'Волгоград, ул. Ткачева', 400000, 'Arseniy Eduaardovich', '4276 1100 4327 8723', '09/21', 3, 161000, 123);

-- --------------------------------------------------------

--
-- Структура таблицы `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(102, 3, 79, 1, 1200),
(103, 3, 78, 1, 10500),
(104, 4, 1, 1, 45000),
(105, 4, 6, 1, 96200),
(106, 4, 35, 1, 19800);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text CHARACTER SET utf8 NOT NULL,
  `product_image` text CHARACTER SET utf8 NOT NULL,
  `product_keywords` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 2, 2, 'Смартфон Samsung Galaxy S10 Lite 6/128GB синий', 45000, 'Смартфон с Android 10\r\nПоддержка двух SIM-карт\r\nЭкран 6.7\", разрешение 2400x1080\r\nТри камеры 48 МП/12 МП/5 МП, автофокус', 'product07.png', 'samsung galaxy s10 телефоны'),
(6, 2, 1, 'Смартфон Apple iPhone 11 Pro 256GB', 96200, 'Смартфон с iOS 13\r\nПоддержка двух SIM-карт (nano SIM+eSIM)\r\nЭкран 5.8\r\nТри камеры 12 МП/12 МП/12 МП, автофокус', 'iphone12.jpg', 'iphone apple телефоны'),
(12, 2, 4, 'Смартфон Sony Xperia Z3 (черный)', 11600, 'Диагональ (дюйм): 5.2\r\nРазрешение (пикс): 1920x1080 (Full HD)\r\nФотокамера (Мп): 20.7\r\nПроцессор: Qualcomm MSM8974AC Snapdragon 801\r\nКоличество ядер: 4\r\nВсе характеристики', 'sony_xperia_z.png', 'sony xperia z3 телефоны'),
(15, 2, 3, 'Смартфон Xiaomi Redmi 8 3/32GB', 8400, 'Смартфон с Android 9.0\r\nПоддержка двух SIM-карт\r\nЭкран 6.22\r\nДвойная камера 12 МП/2 МП, автофокус', 'redmi1.jpg', 'xiaomi redmi телефоны'),
(16, 2, 1, 'Apple iPhone 7 Plus 32GB черный', 34000, 'Смартфон с iOS 10\r\nЭкран 5.5\r\nДвойная камера 12 МП/12 МП, автофокус', 'iphone7.jpg', 'iphone aplle телефоны'),
(17, 2, 6, 'Смартфон BlackBerry KEYone (Silver)', 22000, 'Смартфон с Android 7.1\r\nQWERTY-клавиатура\r\nЭкран 4.5\r\nКамера 12 МП, автофокус\r\nПамять 32 ГБ, слот для карты памяти', 'blackberry1.jpg', 'blackberry телефоны'),
(18, 2, 6, 'Смартфон Nokia 7.2 64GB графит', 15000, 'Смартфон с Android 9.0\r\nПоддержка двух SIM-карт\r\nЭкран 6.3\r\nТри камеры 48 МП/5 МП/8 МП, автофокус', 'nokia1.jpg', 'nokia телефоны'),
(35, 1, 6, 'Ноутбук ASUS X540MA-GQ947 (Intel Pentium N5000)', 19800, 'Процессор: Intel Pentium Silver N5000 (1100 МГц)\r\nОбъем оперативной памяти: 4 ГБ\r\nНакопитель: 128 ГБ\r\nВстроенная видеокарта: Intel UHD Graphics 605', 'product08.png', 'asus ноутбуки'),
(38, 1, 6, 'Ноутбук HP EliteBook 8570p (H5E33EA) ', 76000, 'процессор: Intel Core i7, Intel Core i7 3540M (3000 МГц)\r\nобъем оперативной памяти: 4 ГБ\r\nнакопитель: 256 ГБ\r\nвстроенная видеокарта: AMD Radeon HD 7570M, Intel HD Graphics 4000 (1 ГБ)\r\nматовый экран: 15.6\" (1366x768, 1600x900)', 'product03.png', 'HP i7 laptop ноутбуки'),
(39, 1, 2, 'Ноутбук Samsung R series RV415', 27000, 'Дисплей: 14 дюймов , 1366x768\r\nПроцессор: E-350\r\nПамять: 2048 Мб\r\nЖесткий диск: 320 Гб\r\nРазмеры: 346x238x34 мм\r\nВес: 2.1 кг\r\n', 'Samung_laptop1.png', 'samsung laptop ноутбуки'),
(47, 1, 1, 'Ноутбук Apple MacBook Pro\r\n', 135000, 'Процессор: Intel Core i9 (2300 МГц)\r\nОбъем оперативной памяти: 16 ГБ\r\nНакопитель: 1024 ГБ\r\nДискретная видеокарта: AMD Radeon Pro 5500M (4 ГБ)', 'macbook-pro.jpg', 'Apple Macbook Ноутбук'),
(55, 1, 6, 'Ноутбук Lenovo Ideapad L340-15API', 24000, 'Процессор: AMD Athlon 300U (2400 МГц)\r\nОбъем оперативной памяти: 4 ГБ\r\nНакопитель: 256 ГБ\r\nВстроенная видеокарта: AMD Radeon Vega 3', 'lenovo1.jpg', 'lenovo ноутбуки'),
(61, 1, 6, 'Ноутбук ASUS VivoBook 15 X540NA-GQ008', 17000, 'Процессор: Intel Pentium N4200 (1100 МГц)\r\nОбъем оперативной памяти: 4 ГБ\r\nНакопитель: 500 ГБ\r\nВстроенная видеокарта: Intel HD Graphics 505', 'asus1.jpg', 'asus ноутбуки'),
(62, 1, 6, 'Ноутбук Acer Aspire 3 (4gb RAM)', 44000, 'Процессор: AMD Ryzen 3 3200U (2600 МГц)\r\nОбъем оперативной памяти: 4 ГБ\r\nНакопитель: 128 ГБ\r\nДискретная видеокарта: AMD Radeon 540X (2 ГБ)', 'acer1.jpg', 'acer ноутбуки'),
(63, 3, 6, 'Экшн-камера GoPro HERO7 (silver edition)', 31000, 'Экшн-камера GoPro HERO7 Silver Edition прекрасно подойдёт любителям съёмки своих приключений. Камера понравится как тем, кто только начинает свой путь с GoPro, так и тем, кто давно увлекается экшн-съёмкой. Компактная и лёгкая камера станет незаменимым спутником в поездках и поможет запечатлеть удивительные истории вашей жизни. Водонепроницаемый корпус позволит снимать в бассейне и при развлечениях на открытой воде, а также в дождливую погоду. С камерой можно погружаться на глубину до 10 метров.\r\n    Разрешение фото 10 Мп позволит вам получить яркие и красочные фотографии с расширенным динамическим диапазоном (WDR). Даже если вы снимаете в сложных условиях и в кадре одновременно находятся затенённые и яркие световые участки, камера скорректирует изображение автоматически. Максимальное разрешение 4К с FPS30 позволит создавать отличные видеоролики профессионального качества. Встроенная стабилизация убережёт ваши кадры от дрожания даже при активном беге и ходьбе. Сенсорный дисплей быстро реагирует на прикосновения, позволит легко менять настройки и управлять режимами съёмки. Видеорежим «таймлапс» с интервалом 0,5 секунд предназначен для съёмки с эффектом ускорения времени. А замедленная съёмка, напротив, сделает акцент на самых интересных моментах и значимых кадрах.', 'gopro.jpg', 'gopro камера '),
(64, 3, 3, 'Сетевая камера Xiaomi Mi Home Security Camera 360°', 5400, 'Стандарт видеокамеры: IP\r\nПоворотная\r\nМатрица 4 МП\r\nМакс. разрешение 1920x1080\r\nНочной режим\r\nИК-подсветка\r\nWi-Fi, Bluetooth\r\nПоддержка Wi-Fi 2.4 ГГц', 'webcam1.jpg', 'webcam камера вебкамера'),
(65, 3, 6, 'Фотоаппарат Canon EOS 5D Mark IV Bodyter', 18000, 'Разрешение матрицы (Мп): 30.4\r\nРазмер матрицы: 36 x 24 мм\r\nСенсорный экран: да\r\nВес (г): 800', 'canon1.jpg', 'camera canon'),
(73, 4, 4, 'Беспроводные наушники Sony', 4800, 'Накладные\r\nДинамические\r\nВремя работы 20 ч\r\nРазъем mini jack 3.5 mm с отсоединяемым кабелем', 'product05.png', 'Sony Headphones наушники '),
(77, 4, 6, 'Умная колонка Яндекс.Станция Мини', 3400, 'Голосовой помощник: Алиса\r\nЯзык голосового помощника: русский\r\nПитание от сети\r\nСуммарная мощность 3 Вт\r\nBluetooth, Wi-Fi, аудиовыход\r\nДиапазон частот 20 Гц - 20 кГц', 'yandexcolonka.jpg', 'колонка яндекс '),
(78, 4, 1, 'Беспроводные наушники Apple AirPods 2 ', 10500, 'Вкладыши\r\nBluetooth 5.0\r\nДинамические\r\nВремя работы 5 ч (от аккумулятора в кейсе 24 ч)', 'airpods1.jpg', 'airpods наушники apple '),
(79, 4, 3, 'Беспроводные наушники Xiaomi Redmi AirDots', 1200, 'Внутриканальные\r\nBluetooth 5.0\r\nДинамические\r\nВремя работы 4 ч (от аккумулятора в кейсе 12 ч)\r\nИмпеданс 32 Ом\r\nЗащита от воды', 'airdots.jpg', 'airdots xiaomi наушники'),
(85, 4, 3, 'Аккумулятор Xiaomi Mi Power Bank 3 Pro 20000', 1390, 'Аккумулятор 20000 мА⋅ч (74 Вт⋅ч)\r\nЗарядка ноутбуков\r\nМаксимальный ток 3 А\r\nДва разъема USB\r\nБыстрая зарядка\r\nВес 440 г', 'powerbank1.jpg', 'powerbank аккумулятор ');

-- --------------------------------------------------------

--
-- Структура таблицы `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `address1` varchar(50) CHARACTER SET utf8 NOT NULL,
  `address2` varchar(300) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Ян ', 'Артемьев', 'yan@mail.ru', '12345', '9448121558', 'Россия', 'Краснодар'),
(15, 'Эдуард', 'Рекитинский', 'edik123@mail.ru', '24680', '536487276', 'Россия', 'Киров'),
(16, 'Александр', 'Севастьянов', 'sevastianov@mail.ru', '123454321', '9877654334', 'Россия', 'Владикавказ'),
(19, 'Тимур', 'Юсупов', 'timur@mail.ru', '1236789', '9871236534', 'Россия', 'Волгоград'),
(22, 'Дмитрий', 'Харатьян ', 'haratian@mail.ru', '1234534', '9877654334', 'Россия', 'Волгоград'),
(23, 'Андрей', 'Рыбаков', 'ribakov@mail.ru', 'andrey12345', '9876543234', 'Россия', 'Волгоград'),
(24, 'Павел', 'Носов', 'nosov@mail.ru', 'nosov123', '9535688928', 'Россия', 'Волгоград'),
(25, 'Николай', 'Селиванов', 'selivanov@mail.ru', '1234567', '9535688928', 'Россия', 'Волгоград'),
(26, 'Алексей', 'Ермолаев', 'alexey.0994@mail.ru', '12345', '+792754369', 'Россия', 'Волгоград, '),
(27, 'Alex', 'Smith', 'smith11111111@mail.ru', '123456789', '9225434436', 'Россия', 'Калининград'),
(28, 'Арсений', 'Эдуардович', 'ars@mail.ru', '12345', '+792755556', 'Россия', 'Волгоград');

--
-- Триггеры `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(50) CHARACTER SET utf8 NOT NULL,
  `address2` varchar(300) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(30, 'Михаил', 'Кондратьев', 'kondrat@mail.ru', '12345', '8924543343', 'Россия', 'Москва');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Индексы таблицы `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Индексы таблицы `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT для таблицы `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
