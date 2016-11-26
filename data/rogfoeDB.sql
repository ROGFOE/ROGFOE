
CREATE TABLE `User` (
	`UID` int NOT NULL AUTO_INCREMENT,
	`AccType` ENUM('Customer', 'Doctor', 'Admin') NOT NULL,
	`fName` varchar(50) NOT NULL,
	`mName` varchar(50),
	`lName` varchar(50) NOT NULL,
	`UphoneH` varchar(15) NOT NULL,
	`UphoneC` varchar(15),
	`UphoneW` varchar(15),
	`Uemail` varchar(100) NOT NULL,
	`Password` varchar(100) NOT NULL,
PRIMARY KEY (`UID`)
);

CREATE TABLE `Warehouse` (
	`WID` int NOT NULL AUTO_INCREMENT,
	`WName` varchar(50) NOT NULL,
	`WPhone` varchar(10) NOT NULL,
	PRIMARY KEY (`WID`)
);

CREATE TABLE `Address` (
	`AddID` int NOT NULL AUTO_INCREMENT,
	`UID` int,
	`WID` int,
	`AddressType` ENUM('Warehouse', 'Practice', 'Shipping', 'Home', 'Billing', 'Other') NOT NULL,
	`Street` varchar(50) NOT NULL,
	`City` varchar(50) NOT NULL,
	`Province` varchar(50),
	`Country` varchar(3) NOT NULL,
	`State` varchar(50),
	`PostalCode` char(6),
	`ZipCode` char(5),
PRIMARY KEY (`AddID`),
FOREIGN KEY (`UID`) REFERENCES `User`(`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (`WID`) REFERENCES `Warehouse`(`WID`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `Admin` (
	`UID` int NOT NULL AUTO_INCREMENT,
	`Title` varchar(40) NOT NULL,
PRIMARY KEY (`UID`),
FOREIGN KEY (`UID`) REFERENCES `User`(`UID`) ON DELETE CASCADE ON UPDATE CASCADE
);

--PaymentType Table
CREATE TABLE `PaymentType` (
	`Type` ENUM('Visa', 'BankTransfer', 'PayPal') NOT NULL,
PRIMARY KEY (`Type`)
);

CREATE TABLE `Order` (
	`OID` bigint NOT NULL AUTO_INCREMENT,
	`ShipAddID` int NOT NULL,
	`BillAddID` int NOT NULL,
	`Date` DATE NOT NULL,
	`OrderTotal` DECIMAL(12,2) NOT NULL,
	`ShippingFee` DECIMAL(12,2),
	`Status` ENUM('Ordered', 'InTransit', 'Delivered') NOT NULL,
	`GrandTotal` DECIMAL(12,2) NOT NULL,
	`PayBy` ENUM('Visa', 'BankTransfer', 'PayPal') NOT NULL,
	`UID` int NOT NULL,
PRIMARY KEY (`OID`),
FOREIGN KEY (`ShipAddID`) REFERENCES `Address`(`AddID`) ON DELETE NO ACTION ON UPDATE CASCADE,
FOREIGN KEY (`BillAddID`) REFERENCES `Address`(`AddID`) ON DELETE NO ACTION ON UPDATE CASCADE,
FOREIGN KEY (`PayBy`) REFERENCES `PaymentType`(`Type`) ON DELETE NO ACTION ON UPDATE CASCADE,
FOREIGN KEY (`UID`) REFERENCES `User`(`UID`) ON DELETE CASCADE ON UPDATE CASCADE
);

--Payment Type Subclasses
CREATE TABLE `Visa` (
	`CardNum` char(16) NOT NULL,
	`Expiry` DATE NOT NULL,
	`CVV` int(3) NOT NULL,
	`UID` int NOT NULL,
PRIMARY KEY (`CardNum`),
FOREIGN KEY (`UID`) REFERENCES `User`(`UID`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `PayPal` (
	`AccountNum` bigint NOT NULL UNIQUE,
	`UID` int NOT NULL,
PRIMARY KEY (`AccountNum`),
FOREIGN KEY (`UID`) REFERENCES `User`(`UID`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `BankTransfer` (
	`AccountNum` bigint NOT NULL UNIQUE,
	`BankName` varchar(50) NOT NULL,
	`BranchNum` int NOT NULL,
	`UID` int NOT NULL,
PRIMARY KEY (`AccountNum`),
FOREIGN KEY (`UID`) REFERENCES `User`(`UID`) ON DELETE CASCADE ON UPDATE CASCADE
);

--Cart
CREATE TABLE `Cart` (
	`CartID` int NOT NULL AUTO_INCREMENT,
	`UID` int,
PRIMARY KEY (`CartID`),
FOREIGN KEY (`UID`) REFERENCES `User`(`UID`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `Donor` (
	`DMedID` int NOT NULL AUTO_INCREMENT,
	`DFName` varchar(50) NOT NULL,
	`DMName` varchar(50) NOT NULL,
	`DLName` varchar(50) NOT NULL,
	`Health` varchar(50),
	`DSex` ENUM('Male', 'Female'),
	`DAge` int(3) NOT NULL,
	`Deceased` bool NOT NULL,
PRIMARY KEY (`DMedID`)
);

CREATE TABLE `Customer` (
	`MedID` int NOT NULL AUTO_INCREMENT,
	`UID` int NOT NULL,
	`CBloodType` ENUM('A', 'B', 'AB', 'O') NOT NULL,
	`CSex` ENUM('Male', 'Female'),
PRIMARY KEY (`MedID`),
FOREIGN KEY (`UID`) REFERENCES `User`(`UID`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `Doctor` (
	`UID` int NOT NULL AUTO_INCREMENT,
	`PracticeName` varchar(50) NOT NULL,
PRIMARY KEY (`UID`),
FOREIGN KEY (`UID`) REFERENCES `User`(`UID`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `Organ` (
	`OrgID` int NOT NULL AUTO_INCREMENT,
	`WID` int,
	`CartID` int,
	`DMedID` int,
	`OID` bigint,
	`OName` varchar(100) NOT NULL,
	`UnitPrice` DECIMAL(12,2) NOT NULL,
	`Size` int NOT NULL,
	`RemovalDate` DATE NOT NULL,
	`OBloodType` ENUM('A', 'B', 'AB', 'O') NOT NULL,
	`Desc` varchar(500) NOT NULL,
	`Picture` varchar(500) NOT NULL,
	`CertDoctor` varchar(100) NOT NULL,
	`CertHospital` varchar(100) NOT NULL,
	`Category` varchar(100) NOT NULL,
PRIMARY KEY (`OrgID`),
FOREIGN KEY (`WID`) REFERENCES `Warehouse`(`WID`) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (`CartID`) REFERENCES `Cart`(`CartID`) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (`DMedID`) REFERENCES `Donor`(`DMedID`) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (`OID`) REFERENCES `Order` (`OID`) ON DELETE SET NULL ON UPDATE CASCADE
);