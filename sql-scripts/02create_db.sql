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


DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(45) DEFAULT NULL,
    
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `property`;

CREATE TABLE `property` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_stocks` int(11) NOT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,

  PRIMARY KEY (`id`),
  
  
  FOREIGN KEY (`user_id`) 
  REFERENCES `user` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  FOREIGN KEY (`stock_id`) 
  REFERENCES `stock` (`id`)
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


INSERT INTO `user` VALUES 
  (1,'David','Adams','david@colorado.edu', 10000.00),
  (2,'John','Doe','john@colorado.edu',10000.00),
  (3,'Ajay','Rao','ajay@colorado.edu', 10000.00),
  (4,'Mary','Public','mary@colorado.edu',10000.00),
  (5,'Maxwell','Dixon','max@lcolorado.edu',10000.00);

INSERT INTO `stock` VALUES 
  (1, 'FACEBOOK'),
  (2, 'AMAZON'),
  (3, 'GOOGLE');

INSERT INTO `property` VALUES 
  (1, 10, 1, 1),
  (2, 50, 1, 2),
  (3, 60, 2, 3),
  (4, 50, 2, 4),
  (5, 20, 3, 5);

SET FOREIGN_KEY_CHECKS = 1;
