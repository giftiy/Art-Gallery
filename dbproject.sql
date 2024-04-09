create database art_gallery;
use art_gallery;

 #Art Gallery management
 #software Engineering, section 1
 #Bontu Emana	
 #Koket Mamo	
 #Sifhoran Regasa	
 #Sonte Adamu 	
 #Gifti Bulti
 
create table Artist(
ArtistID INT NOT NULL PRIMARY KEY,
Name VARCHAR(20),
Age INT,
StyleOfArt VARCHAR(20)
);
create table ArtType(
ArtTypeID VARCHAR(20) NOT NULL PRIMARY KEY,
TypeName VARCHAR(20)
);
create table Gallery(
GalleryCode INT NOT NULL PRIMARY KEY,
Gallerylocation VARCHAR(20)
);
create table Customer(
CustomerID INT NOT NULL PRIMARY KEY,
Name VARCHAR(20),
Address INT,
TotalSpent INT
);
create table ArtWork(
ArtistID INT,
ArtId INT NOT NULL PRIMARY KEY,
Title VARCHAR(20),
ArtTypeID VARCHAR(20),
Price INT,
FOREIGN KEY(ArtistID) REFERENCES Artist(ArtistID),
FOREIGN KEY(ArtTypeID) REFERENCES ArtType(ArtTypeID)
);
create table BoughtArt(
CustomerID int,
ArtId int,
FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
FOREIGN KEY(ArtID) REFERENCES ArtWork(ArtID)
);

create table Manager(
ManagerNumber INT NOT NULL PRIMARY KEY,
ManagerName VARCHAR(20),
GalleryCode INT,
FOREIGN KEY(GalleryCode) REFERENCES Gallery(GalleryCode)
);

INSERT INTO Artist VALUES
(101,'Da vinchi',30,'Abstract'),
(102,'cala',20,'nature'),
(103,'Pablo Picasso',70,'modern art'),
(104,'Henri Matisse',45,'geometric art'),
(105,'Jean-Antoine Watteau',50,'arcylic art'),
(106,'Raphael',28,'Abstract');
SELECT* FROM Artist;
INSERT INTO ArtType VALUES
('11a', 'abstract'),
('11b', 'nature'),
('11c', 'modern art'),
('11d', 'geometric art'),
('11e', 'arcylic art'),
('11f', 'historic art');
SELECT* FROM ArtType;
INSERT INTO Gallery VALUES
(234, 'Franco'),
(345, 'College'),
(456, 'Post office');
SELECT* FROM Gallery;
INSERT INTO Customer VALUES
(121,'tola',30,2),
(122,'bona',20,5),
(123,'Hawi',70,3),
(124,'Seble',45,8),
(125,'Abel',50,4),
(126,'Sara',28,1);
SELECT* FROM Customer;
INSERT INTO ArtWork VALUES
(101,771,'in my dream ','11a', 2300),
(102,772,'the sky is blue ','11b',5450),
(103,773,'in reality ','11c', 4320),
(104,774,'it is also blue ','11d',7500),
(105,775,'star gaze ','11e', 9800);
INSERT INTO BoughtArt VALUES
(121,771),
(122,772),
(123,773),
(124,774),
(125,775),
(126,776);
SELECT* FROM BoughtArt;

INSERT INTO Manager VALUES
(331,'Beka',234),
(332,'Robi',345),
(333,'Sifo',456);
SELECT* FROM Manager;
create table receptor(
cid int not null primary key,
Rname varchar(20),
task varchar(20),
CustomerID int,
foreign key(CustomerID) references Customer(CustomerID) 
);
insert into receptor values
(12,'blen','wellcome',121),
(13,'feben','ask information',122),
(14,'saron','have a nice day',123),
(15,'meron','good morning',124),
(16,'tina','good afternoon',125),
(17,'redy','good evening',126);
/*alter table receptor
#add task varchar(20);
SET SQL_SAFE_UPDATES = 0;
update receptor set task="welcome" where Rname='blen'; 
update receptor set task="ask information" where Rname='feben'; 
update receptor set task="have a nicee day" where Rname='saron'; 
update receptor set task="welcome " where Rname='meron'; 
update receptor set task="good afternoon" where Rname='tina'; 
update receptor set task="good morning" where Rname='redy';
SET SQL_SAFE_UPDATES = 1;*/
/*SELECT* FROM receptor;
Alter table BoughtArt
add column award decimal(10,2) after ArtId;
DELETE FROM BoughtArt
where price=2345;
DELETE FROM BoughtArt
where price=20000;
SELECT* FROM BoughtArt;
Alter table BoughtArt
add column price int after ArtId;
SELECT* FROM BoughtArt;
/*update BoughtArt
set price= 2450 where ArtId=771;
SELECT* FROM BoughtArt;
update BoughtArt
set price= 5450 where ArtId=772;
SELECT* FROM BoughtArt;
update BoughtArt
set price= 4320 where ArtId=773;
SELECT* FROM BoughtArt;
update BoughtArt
set price= 7500 where ArtId=774;
SELECT* FROM BoughtArt;
update BoughtArt
set price= 9800 where ArtId=775;
SELECT* FROM BoughtArt;
set price= 1400 where ArtId=776;
SELECT* FROM BoughtArt;*/
SET SQL_SAFE_UPDATES = 0;
update BoughtArt
set award= price*25/100;
SELECT* FROM BoughtArt;
update BoughtArt
set price= price+1000;
SELECT* FROM BoughtArt;
INSERT into BoughtArt
values(NULL,NULL,20000,NULL);
SELECT* FROM BoughtArt;

create Trigger calculate_Award
before INSERT
on BoughtArt
for each row
set New.award=(New.price*25/100);
SHOW TRIGGERS;
drop table total_Income;
create table total_Income(
Rno int NOT NULL primary key,
Iname varchar(20),
icut varchar(20),
total1 decimal(10,2),
total2 decimal(10,2),
profit decimal(10,2)
);
insert into total_Income values
(1,'price','award',0.00,0.00,0.00);
select* from total_Income; 
update total_income
set total1=(select SUM(price) from BoughtArt)
where iname="price";
update total_income
set total2=(select SUM(award) from BoughtArt)
 where icut="award";
 update total_income
set profit=total1-total2;
select* from total_Income;
create trigger calculate_profit
before update
on total_income
for each row
set NEW.profit=(NEW.total1-total2);
SHOW TRIGGERS;

START TRANSACTION;
INSERT INTO Artist(ArtistID, Name, Age, StyleofArt)
VALUES (1107,'Lema Guya',90,'painter');
COMMIT;

START TRANSACTION;
INSERT INTO Artist(ArtistID, Name, Age, StyleofArt)
VALUES (1108,'Afewerk Tekle',90,'painter');
ROLLBACK;

SELECT * FROM Artist;

create user 'ceo'@'localhost'
identified by 'qwerty';

create user 'consumer'@'localhost'
identified by 'abcdefg';

create user 'artist'@'localhost'
identified by 'wxyz';

grant select, update, lock tables on art_gallery.*
to 'ceo'@'localhost';
grant  insert on art_gallery.Gallery
to 'ceo'@'localhost';
grant  insert on art_gallery.ArtType
to 'ceo'@'localhost';
grant  insert on art_gallery.BoughtArt
to 'ceo'@'localhost';
grant insert on art_gallery.Manager
to 'ceo'@'localhost';

grant select on art_gallery.Artist 
to 'consumer'@'localhost';
grant select on art_gallery.ArtWork 
to 'consumer'@'localhost';
grant select on art_gallery.Gallery 
to 'consumer'@'localhost';
grant insert on art_gallery.Customer 
to 'consumer'@'localhost';

grant insert on art_gallery.Artist
to 'artist'@'localhost';
grant insert on art_gallery.ArtWork
to 'artist'@'localhost';
grant select on art_gallery.Gallery
to 'artist'@'localhost';
grant select on art_gallery.ArtWork
to 'artist'@'localhost';
grant select on art_gallery.ArtType
to 'artist'@'localhost';
grant select on art_gallery.BoughtArt
to 'artist'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'consumer'@'LOCALHOST';
SHOW GRANTS FOR 'ceo'@'LOCALHOST';
SHOW GRANTS FOR 'artist'@'LOCALHOST';


