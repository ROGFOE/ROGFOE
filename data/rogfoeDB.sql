
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
	`PostalCode` char(10),
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

INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Adrenal gland',82383.04,5,'2016-11-25','O','THIS GUY DID FRONTFLIPS FROM STANDING!!!','http://homepage.smc.edu/wissmann_paul/intranetstuff/dept/scienceLRC/wissmann_site/images/adrenals_whole2.jpg','Dr. Dre','Mayo Clinic Rochester Minn.','gland');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Appendix',65944.97,4,'2016-12-02','A','This ain''t the end of no book. ','http://hpbsurgery.net/Images/surgery/appendix/acute%20appendicitis.jpg','Dr. Payne ','Cleveland Clinic','middle body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Bladder',57106.07,42,'2016-11-29','B','So fresh. So organic. We bet you can''t wait to hold it.','http://th01.deviantart.net/fs41/PRE/i/2009/011/3/f/Canine_Urinary_Bladder_by_addonemore.jpg','Dr. Blood','Massachusetts General Hospital Boston','middle body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Brain',53990.15,1400,'2016-11-26','A','He thought, therefore, he was.','http://www.itvscience.com/wp-content/uploads/2016/06/Brain.jpg','Dr. Ricketts','Johns Hopkins Hospital Baltimore','upper body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Ear',57807.79,10,'2016-11-29','AB','Lend me your... chequebook, for this waxless beaut of a specimen.','http://www.pngall.com/wp-content/uploads/2016/04/Ear-PNG-Pic.png','Dr. Stump','UCLA Medical Center','upper body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Esophagus',32527.41,20,'2016-11-29','A','The poor sap who owned this fine gullet went to war and took a bullet. ','http://www.gastrolab.net/y0027x.jpg','Dr. Croke','New York-Presbyterian University Hospital of Columbia and Cornell','upper body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Eye',16758.53,12,'2016-11-25','B','Eye''m glad eye avoid eye puns.','https://i.ytimg.com/vi/UPyx0szdv0k/maxresdefault.jpg','Dr. Killie','UCSF Medical Center San Francisco','upper body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Gall bladder',74654.98,30,'2016-12-02','A','Has it been a while since you''ve had some bile?','http://img.medscapestatic.com/pi/meds/ckb/50/36250tn.jpg','Dr. Poke','Northwestern Memorial Hospital Chicago','middle body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Heart',280.5,130,'2016-11-26','O','This thing will look CRAZY on you.','https://s-media-cache-ak0.pinimg.com/564x/ae/08/0a/ae080ae83b9d4c8dac70dbbff00e4941.jpg','Dr. Young-Hyman','Hospitals of the University of Pennsylvania-Penn Presbyterian Philadelphia','upper middle body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Kidney',54590.32,365,'2016-11-29','O','I know what you''re thinking, but this came from an adult.','https://www.thesun.co.uk/wp-content/uploads/2016/04/2095975.main_image.jpg?strip=all','Dr. Fatterpaker','NYU Langone Medical Center','middle body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Large intestine',77926.3,2670,'2016-11-29','AB','Like Trump, it''s big and full of shit.','https://s-media-cache-ak0.pinimg.com/736x/d5/75/74/d575747e28a251bdf8af8a9c3e70fe6f.jpg','Dr. Acula','Barnes-Jewish Hospital/Washington University St. Louis','middle body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Liver',57564.23,2300,'2016-12-02','O','If this doesn''t get purchased soon we''re going to need to throw another pâté party.','http://supernaturalacnetreatment.com/wp-content/uploads/2016/02/does-toxic-liver-cause-acne.jpg','Dr. Frankenstein','UPMC Presbyterian Shadyside Pittsburgh','middle body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Lung',42048.76,1569,'2016-11-26','AB','Lifelong smoker. But only the good stuff.','http://hotphotosfree.com/sites/default/files/styles/large/public/field/image/b2faa4743fc119677f0e0d68f616346e.jpg?itok=Njk3qgkg','Dr. Pepper','Brigham and Women''s Hospital Boston','upper middle body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Mouth',83736.47,40,'2016-12-02','B','That''s right, the whole thing.','http://www.pngall.com/wp-content/uploads/2016/03/Mouth-PNG-Clipart.png','Dr. Bonar','Stanford Health Care-Stanford Hospital Stanford Calif.','upper body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Muscle',42524.26,975,'2016-11-27','A','A random assortment.','http://cdn.rsvlts.com/wp-content/uploads/2012/08/Arnold-Schwarzenegger-Young-Photos-28-930x1301.jpg','Dr. Blome','Mount Sinai Hospital New York','body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Nose',26576.71,540,'2016-11-29','A','It smelled REAL good. Not so much anymore.','http://www.sciencemag.org/sites/default/files/styles/article_main_large/public/images/cc_nose_16x9.jpg?itok=WXj7iPir','Dr. Doom','Duke University Hospital Durham N.C.','upper body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Pancreas',27952.65,985,'2016-11-29','AB','Pan crust pizza. Pancreas pizza. Coincidence?','http://partnersah.vet.cornell.edu/sites/default/files/avian_atlas_assets/Pancreas4%20x750.jpg','Dr. Dre','Cedars-Sinai Medical Center Los Angeles','middle body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Parathyroid gland',29185.23,46,'2016-11-28','O','Its name is kinda like being called "guy beside Ramon".','http://blog.parathyroid.com/wp-content/uploads/2013/08/adenoma-and-another-quarter-e1377708421605.jpg','Dr. Payne ','University of Michigan Hospitals and Health Centers Ann Arbor','gland');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Pineal gland',40558.53,4,'2016-11-27','O','It''s worth buying just so you can laugh hysterically at all the stupid hagfish.','http://previews.123rf.com/images/allison14/allison141204/allison14120400045/13331869-A-Single-Pea-and-a-Fork-on-a-White-Plate-Stock-Photo.jpg','Dr. Blood','Houston Methodist Hospital','gland');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Pituitary gland',1852.56,39,'2016-11-26','B','The size of a pea, but slightly more of a fee.','http://drarunlnaik.com/wp-content/uploads/2014/08/PituitaryGland.196230413_std.jpg','Dr. Ricketts','University of Colorado Hospital Aurora','gland');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Skin',1042.02,9800,'2016-11-29','B','Get this wrinkly old skin bag for half off if you buy now.','https://thumbs.dreamstime.com/x/wrinkled-skin-18040649.jpg','Dr. Stump','Mayo Clinic Rochester Minn.','body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Small intestine',39912.53,150,'2016-11-30','AB','Like Trump, it''s full of shit, and has a small mind.','http://hotphotosfree.com/sites/default/files/styles/medium/public/field/image/19ac1b2e54528aba2bbbc6a5dd3ff991.jpg?itok=NfChGaY1','Dr. Croke','Cleveland Clinic','lower middle body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Spleen',65015.09,65,'2016-11-30','AB','FAME ALERT! Straight from Charlie Sheen!  Warning: Sheen''s spleen is likely infected with syphilis.','http://www.humpath.com/IMG/jpg_spleen_04_1.jpg','Dr. Killie','Massachusetts General Hospital Boston','middle body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Stomach',69717.28,84,'2016-12-02','O','Barring serious crushing injuries, flat stomachs are a myth.','http://i.imgur.com/UHF8s0T.jpg','Dr. Poke','Johns Hopkins Hospital Baltimore','middle body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Thymus',33278.31,9,'2016-11-28','B','Enormous prepubescent A-Grade thymus literally oozing with T-killer cells. ','http://www.ctsnet.org/sites/default/files/graphics/experts/Thoracic/myers_transcerv/4989-thymus.jpg','Dr. Young-Hyman','UCLA Medical Center','unknown');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Thyroid gland',41520.44,29,'2016-12-02','A','Buy now and we''ll throw in Adam''s apple. ','http://patologia.gabeents.com/data/Pathologic/celk1/celk130.jpg','Dr. Fatterpaker','New York-Presbyterian University Hospital of Columbia and Cornell','upper body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Trachea',56133.86,60,'2016-11-25','O','Tttrrrrrrrr-aaaaaaaaaaaaaa-cccchhheeeeeeeeeaaaaaaaaaaa! Like the Ricola ads. Just buy it for crying out loud.','https://www.ucl.ac.uk/news/news-articles/1107/scaffold_crop.jpg','Dr. Acula','UCSF Medical Center San Francisco','upper body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Uterus',43303.47,900,'2016-12-01','AB','Young, fresh, premium quality.','http://library.med.utah.edu/WebPath/jpeg4/FEM082.jpg','Dr. Frankenstein','Northwestern Memorial Hospital Chicago','lower middle body');
INSERT INTO Organ(`OName`,`UnitPrice`,`Size`,`RemovalDate`,`OBloodType`,`Desc`,`Picture`,`CertDoctor`,`CertHospital`,`Category`) VALUES ('Vermiform appendix',13500.07,8,'2016-11-29','O','A solid ''B''. As in most boring organ ever.','http://ee_ce_img.s3.amazonaws.com/cache/ce_img/media/remote/ce_img/https_ee_channel_images.s3.amazonaws.com/article-figures/13805/article-g02_400_259.jpg','Dr. Pepper','Hospitals of the University of Pennsylvania-Penn Presbyterian Philadelphia','lower middle body');