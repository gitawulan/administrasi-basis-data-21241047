CREATE TABLE `employees` (
  `employeeNumber` int PRIMARY KEY,
  `lastname` varchar(255),
  `extantion` varchar(255),
  `email` varchar(255),
  `officeCode` int,
  `reportTo` varchar(255),
  `jobTime` varchar(255)
);

CREATE TABLE `offices` (
  `officeCode` int PRIMARY KEY,
  `city` varchar(255),
  `phone` int,
  `addressLine1` varchar(255),
  `addressLine2` varchar(255),
  `state` varchar(255),
  `country` varchar(255),
  `postalCode` varchar(255),
  `temitory` varchar(255)
);

CREATE TABLE `customers` (
  `customerNumber` int PRIMARY KEY,
  `customerName` varchar(255),
  `contactLastName` varchar(255),
  `contactFirstName` varchar(255),
  `phone` int,
  `addressLine1` varchar(255),
  `addressLine2` varchar(255),
  `city` varchar(255),
  `state` varchar(255),
  `postalCode` int,
  `country` varchar(255),
  `salesRepEmployeeNumber` int,
  `creditLimit` int
);

CREATE TABLE `payments` (
  `customerNumber` int PRIMARY KEY,
  `checkNumber` int,
  `paymentDate` int,
  `amount` int
);

CREATE TABLE `orders` (
  `orderNumber` int PRIMARY KEY,
  `orderDate` int,
  `requiredDate` int,
  `shippedDate` int,
  `status` varchar(255),
  `comments` varchar(255),
  `customerNumber` int
);

CREATE TABLE `orderdetails` (
  `orderNumber` int PRIMARY KEY,
  `productCode` varchar(255),
  `quantytyOrdered` int,
  `priceEarch` int,
  `orderLineNumber` int
);

CREATE TABLE `products` (
  `productCode` int PRIMARY KEY,
  `productName` varchar(255),
  `productLine` varchar(255),
  `productScale` varchar(255),
  `productVendor` int,
  `productDescription` varchar(255),
  `quantityInStock` int,
  `buyPrice` int,
  `MSRP` int
);

CREATE TABLE `productlines` (
  `productLine` int PRIMARY KEY,
  `textDescription` varchar(255),
  `htmlDescription` varchar(255),
  `image` varchar(255)
);

ALTER TABLE `employees` ADD FOREIGN KEY (`extantion`) REFERENCES `offices` (`city`);

ALTER TABLE `customers` ADD FOREIGN KEY (`contactLastName`) REFERENCES `employees` (`jobTime`);

ALTER TABLE `products` ADD FOREIGN KEY (`productLine`) REFERENCES `productlines` (`htmlDescription`);

ALTER TABLE `orderdetails` ADD FOREIGN KEY (`quantytyOrdered`) REFERENCES `products` (`productLine`);

ALTER TABLE `orders` ADD FOREIGN KEY (`orderNumber`) REFERENCES `orderdetails` (`orderLineNumber`);

ALTER TABLE `orders` ADD FOREIGN KEY (`status`) REFERENCES `customers` (`contactLastName`);

ALTER TABLE `payments` ADD FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`postalCode`);
