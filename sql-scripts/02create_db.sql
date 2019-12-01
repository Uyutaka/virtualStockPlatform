DROP SCHEMA IF EXISTS `stock_platform`;

CREATE SCHEMA `stock_platform`;

use `stock_platform`;

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `property`;

CREATE TABLE `property` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_stocks` int(11) NOT NULL,
  `stock_name` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,

  PRIMARY KEY (`id`),
  
  
  FOREIGN KEY (`user_id`) 
  REFERENCES `user` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


INSERT INTO `user` VALUES 
  (1,'David','Adams','david@colorado.edu', 10000.00),
  (2,'John','Doe','john@colorado.edu',10000.00),
  (3,'Ajay','Rao','ajay@colorado.edu', 10000.00),
  (4,'Mary','Public','mary@colorado.edu',10000.00),
  (5,'Maxwell','Dixon','max@lcolorado.edu',10000.00);

INSERT INTO `property` VALUES 
  (1, 10, 'GOOG', 1),
  (2, 50, 'GOOG', 2),
  (3, 60, 'AMZN', 3),
  (4, 50, 'AMZN', 4),
  (5, 30, 'NKE', 1),
  (6, 40, 'AAPL', 3),
  (7, 15, 'NVDA', 4),
  (8, 25, 'NKE', 5);

SET FOREIGN_KEY_CHECKS = 1;
