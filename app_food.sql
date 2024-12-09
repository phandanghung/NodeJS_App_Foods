CREATE DATABASE app_foods

USE app_foods

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(1, 'Phở Bò', 'pho_bo.jpg', 50, 'Món ăn truyền thống Việt Nam', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(2, 'Bún Chả', 'bun_cha.jpg', 45, 'Món nướng đặc sản Hà Nội', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(3, 'Pizza Hải Sản', 'pizza_hai_san.jpg', 120, 'Pizza với hải sản tươi ngon', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(4, 'Burger Phô Mai', 'burger_pho_mai.jpg', 80, 'Bánh burger với phô mai tan chảy', 2),
(5, 'Salad Trái Cây', 'salad_trai_cay.jpg', 60, 'Salad mix trái cây tươi', 3),
(6, 'Gà Rán', 'ga_ran.jpg', 70, 'Gà rán giòn thơm ngon', 2),
(7, 'Cơm Chiên Hải Sản', 'com_chien_hai_san.jpg', 65, 'Cơm chiên với hải sản phong phú', 1),
(8, 'Bánh Mì Việt Nam', 'banh_mi.jpg', 25, 'Bánh mì kẹp thịt truyền thống', 1),
(9, 'Mì Ý Carbonara', 'mi_y_carbonara.jpg', 95, 'Mì Ý với sốt kem và thịt xông khói', 2),
(10, 'Chè Thái', 'che_thai.jpg', 40, 'Chè với thạch và trái cây', 3);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Món chính');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Món khai vị');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Món tráng miệng');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Đồ uống');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 2, '2024-12-09 14:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 3, '2024-12-09 15:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(3, 4, '2024-12-09 16:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(4, 1, '2024-12-09 17:00:00'),
(1, 2, '2024-12-09 14:00:00'),
(2, 3, '2024-12-09 15:00:00'),
(3, 4, '2024-12-09 16:00:00'),
(4, 1, '2024-12-09 17:00:00'),
(5, 2, '2024-12-09 17:00:00'),
(6, 3, '2024-12-09 17:00:00'),
(7, 2, '2024-12-09 17:00:00'),
(2, 1, '2024-12-09 17:00:00'),
(3, 2, '2024-12-09 17:00:00'),
(4, 4, '2024-12-09 17:00:00'),
(3, 4, '2024-12-09 17:00:00'),
(2, 3, '2024-12-09 17:00:00');

INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 'CODE123', '1,2');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 3, 1, 'CODE456', '3');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 4, 3, 'CODE789', '4');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(4, 5, 1, 'CODE101', '2,3'),
(5, 3, 2, 'CODE101', '5'),
(6, 3, 4, 'CODE101', '6'),
(2, 5, 1, 'CODE101', '1,5'),
(3, 2, 3, 'CODE101', '2,4'),
(4, 5, 1, 'CODE101', '4,6');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 5, '2024-12-09 10:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 4, '2024-12-09 11:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 3, 3, '2024-12-09 12:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 4, 5, '2024-12-09 13:00:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(1, 'Nhà hàng 1', 'image1.jpg', 'Nhà hàng nổi tiếng với các món ăn truyền thống');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(2, 'Nhà hàng 2', 'image2.jpg', 'Nhà hàng chuyên phục vụ đồ ăn nhanh và tiện lợi');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(3, 'Nhà hàng 3', 'image3.jpg', 'Nhà hàng cao cấp với không gian sang trọng');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(4, 'Nhà hàng 4', 'image4.jpg', 'Nhà hàng ven biển với các món hải sản tươi ngon');

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Siu 1', 'siu1@gmail.com', '1234');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Siu 2', 'siu2@gmail.com', '12345');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Siu 3', 'siu3@gmail.com', '12346');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Siu 4', 'siu4@gmail.com', '12347'),
(5, 'Siu 5', 'siu5@gmail.com', '12348'),
(6, 'Siu 6', 'siu6@gmail.com', '12349'),
(7, 'Siu 7', 'siu7@gmail.com', '123410'),
(8, 'Siu 8', 'siu8@gmail.com', '123411');