CREATE DATABASE IF NOT EXISTS threaderz_store;
USE threaderz_store;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------
-- Tabla: cart
-- --------------------------------------------------------
CREATE TABLE `cart` (
  `products_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `c_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Tabla: category
-- --------------------------------------------------------
CREATE TABLE `category` (
  `cat_id` int(10) NOT NULL,
  `cat_title` text NOT NULL,
  `cat_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `category` (`cat_id`, `cat_title`, `cat_desc`) VALUES
(1, 'Hombres', 'Las últimas y mejores prendas para hombres.'),
(2, 'Mujeres', 'Moda moderna y de alta calidad para mujeres.'),
(3, 'Niños', 'Ropa cómoda, colorida y divertida para niños.');

-- --------------------------------------------------------
-- Tabla: customer
-- --------------------------------------------------------
CREATE TABLE `customer` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_pass` varchar(50) NOT NULL,
  `customer_address` varchar(400) NOT NULL,
  `customer_contact` text NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_email`, `customer_pass`, `customer_address`, `customer_contact`, `customer_image`, `customer_ip`) VALUES
(31, 'Esteban', 'yo@gmail.com', '123', 'Callejón Añejo', '03002291527', 'foto esteban.png', 0);

-- --------------------------------------------------------
-- Tabla: orders
-- --------------------------------------------------------
CREATE TABLE `orders` (
  `order_id` int(10) NOT NULL,
  `order_qty` int(10) NOT NULL,
  `order_price` int(10) NOT NULL,
  `c_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Tabla: products
-- --------------------------------------------------------
CREATE TABLE `products` (
  `products_id` int(10) NOT NULL,
  `p_cat_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_title` text NOT NULL,
  `product_img1` text NOT NULL,
  `product_img2` text NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_keywords` text NOT NULL,
  `product_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `products` (`products_id`, `p_cat_id`, `cat_id`, `date`, `product_title`, `product_img1`, `product_img2`, `product_price`, `product_keywords`, `product_desc`) VALUES
(1, 4, 1, '2025-06-15 16:03:55', 'Joggers de Hombre', 'men-3.png', 'men-3.png', 14000, 'Joggers', '<p>Joggers cómodos y con estilo.</p>'),
(2, 3, 2, '2025-06-15 16:58:29', 'Jeans Anchos', 'women-2.png', 'women-2.png', 18000, 'Jeans', '<p>Muy elegantes y fáciles de combinar.</p>'),
(3, 2, 2, '2025-06-15 16:59:47', 'Camiseta Estampada', 'woman-4.png', 'woman-4.png', 8000, 'Camiseta', '<p>Moderna, fresca y cómoda.</p>'),
(4, 3, 1, '2025-06-15 17:01:07', 'Jean Ajustado para Hombre', 'men-2.png', 'men-2.png', 22000, 'Jean Skinny', '<p>Estilo y comodidad en uno solo.</p>'),
(6, 2, 3, '2025-06-16 05:24:19', 'Camiseta Sin Mangas Niño', 'kid-1.png', 'kid-1-b.png', 8000, 'Camiseta Niño', '<p>Fresca y con estilo.</p>'),
(7, 2, 2, '2025-06-16 05:26:50', 'Enterizo Negro Mujer', 'women-5.png', 'won-5-b.png', 22000, 'Enterizo', '<p>Elegante y muy cómodo.</p>'),
(9, 1, 3, '2025-06-16 05:53:51', 'Chaqueta Negra', 'boys-Puffer-Coat-With-Detachable-Hood-1.jpg', 'boys-Puffer-Coat-With-Detachable-Hood-1.jpg', 21000, 'Chaqueta', '<p>Muy abrigada y confortable.</p>'),
(10, 1, 3, '2025-06-16 05:54:30', 'Chaqueta Roja de Paracaídas', 'boys-Puffer-Coat-With-Detachable-Hood-2.jpg', 'boys-Puffer-Coat-With-Detachable-Hood-2.jpg', 23000, 'Chaqueta Roja', '<p>Suave y cálida para el frío.</p>'),
(11, 2, 2, '2025-06-16 12:51:34', 'Camiseta Blanca Estampada', 'g-polos-tshirt-1.png', 'g-polos-tshirt-2.png', 7500, 'Camiseta Blanca', '<p>Ligera, cómoda y fresca.</p>'),
(12, 1, 2, '2025-06-18 04:12:25', 'Abrigo Marrón', 'brown-jacket.jpg', 'brown-jacket.jpg', 27000, 'Abrigo', '<p>Ideal para días fríos.</p>'),
(13, 1, 2, '2025-06-21 01:31:10', 'Chaqueta Rosada Suave', 'pink jacket.jpg', 'pink jacket.jpg', 32000, 'Chaqueta Rosada', '<p>Muy cálida y moderna.</p>'),
(14, 4, 2, '2025-06-18 04:20:20', 'Tacones Negros', 'blackheels.jpg', 'blackheels.jpg', 23000, 'Tacones', '<p>Elegantes y cómodos.</p>'),
(15, 1, 1, '2025-06-16 11:49:45', 'Chaqueta Gris Royal', 'Man-Geox-Winter-jacket-1.jpg', 'Man-Geox-Winter-jacket-2.jpg', 35000, 'Chaqueta Gris', '<p>Moderna, elegante y abrigada.</p>'),
(16, 4, 2, '2025-06-18 04:15:28', 'Tacones Blancos Brillantes', 'whiteheels.jpg', 'whiteheels.jpg', 19000, 'Tacones Blancos', '<p>Estilo y glamour al máximo.</p>'),
(17, 5, 1, '2025-06-16 11:56:59', 'Buzo Thrashers', 'hoodie-2.png', 'hoodie-2.png', 19000, 'Buzo Gris', '<p>Muy cálido, moderno y cómodo.</p>'),
(18, 3, 2, '2025-06-16 11:57:49', 'Jean Negro Roto', 'jeanss.png', 'jeanss.png', 18000, 'Jean Negro', '<p>Juvenil y con estilo urbano.</p>'),
(19, 5, 3, '2025-06-16 11:58:49', 'Buzo Colorido', 'hoodie-4.png', 'hoodie-4.png', 23000, 'Buzo Colorido', '<p>Diseño alegre y moderno.</p>'),
(20, 1, 3, '2025-06-16 11:59:35', 'Chaqueta Negra Polo', 'boys-Puffer-Coat-With-Detachable-Hood-3.jpg', 'boys-Puffer-Coat-With-Detachable-Hood-3.jpg', 31000, 'Chaqueta Negra', '<p>Suave, cálida y cómoda.</p>'),
(21, 5, 3, '2025-06-16 12:03:43', 'Buzo Puma Negro', 'hoodie-3.png', 'hoodie-3.png', 19000, 'Buzo Negro', '<p>Deportiva y cómoda.</p>'),
(22, 5, 1, '2025-06-16 12:04:32', 'Buzo Blanco y Negro', 'hoodie-1.png', 'hoodie-1.png', 23000, 'Buzo Anime', '<p>Ideal para fanáticos del anime.</p>'),
(23, 2, 1, '2025-06-21 01:25:39', 'Camiseta Blanco y Negro', 'B&W Tee Shirt.jpg', 'B&W Tee Shirt.jpg', 13000, 'Camiseta', '<p>Simple, moderna y casual.</p>');

-- --------------------------------------------------------
-- Tabla: product_categories
-- --------------------------------------------------------
CREATE TABLE `product_categories` (
  `p_cat_id` int(10) NOT NULL,
  `p_cat_title` text NOT NULL,
  `p_cat_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `product_categories` (`p_cat_id`, `p_cat_title`, `p_cat_desc`) VALUES
(1, 'Chaquetas', 'Chaquetas personalizadas y casuales de buena calidad.'),
(2, 'Camisetas', 'Camisetas suaves, cómodas y modernas.'),
(3, 'Jeans', 'Denim y jeans de cuero de alta calidad.'),
(4, 'Zapatos', 'Zapatos resistentes y de suela cómoda.'),
(5, 'Buzos', 'Buzos coloridos y personalizados.');

-- --------------------------------------------------------
-- Tabla: slider
-- --------------------------------------------------------
CREATE TABLE `slider` (
  `slide_id` int(10) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_image` text NOT NULL,
  `slide_heading` varchar(100) NOT NULL,
  `slide_text` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `slider` (`slide_id`, `slide_name`, `slide_image`, `slide_heading`, `slide_text`) VALUES
(1, 'Slide 1', 'slide_1.jpg', 'Oferta de Verano', 'Entra por la moda, quédate por el estilo.'),
(2, 'Slide 2', 'slide_2.jpg', 'Black Friday', 'Todo lo que quieres, en un solo lugar.');

-- Índices
ALTER TABLE `category` ADD PRIMARY KEY (`cat_id`);
ALTER TABLE `customer` ADD PRIMARY KEY (`customer_id`);
ALTER TABLE `orders` ADD PRIMARY KEY (`order_id`);
ALTER TABLE `products` ADD PRIMARY KEY (`products_id`);
ALTER TABLE `product_categories` ADD PRIMARY KEY (`p_cat_id`);
ALTER TABLE `slider` ADD PRIMARY KEY (`slide_id`);

-- Auto Increment
ALTER TABLE `category` MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
ALTER TABLE `customer` MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
ALTER TABLE `orders` MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT;
ALTER TABLE `products` MODIFY `products_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
ALTER TABLE `product_categories` MODIFY `p_cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
ALTER TABLE `slider` MODIFY `slide_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

COMMIT;
