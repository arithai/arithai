
//2026.08.30
C:\tools\mysql-5.0.96-winx64
最後進

mysql -h 127.0.0.1 -u root -p111111
mysqldump -h 127.0.0.1 -u root -p111111 mysql SpeciesMain SpeciesYoutube > Species.sql
sitemap-config.php
php gensmap.php a b c
/usr/sbin/apachectl restart
mysqldump -h 127.0.0.1 -u root -p111111 mysql SpeciesMain,SpeciesYoutube > Species.sql
mysqldump -h 127.0.0.1 -u root -p111111 mysql SpeciesYoutube  > SpeciesYoutube.sql
mysqldump -h 127.0.0.1 -u root -p111111 mysql SpeciesMain  > SpeciesMain.sql
cd "C:\Program Files\MySQL\MySQL Server 5.5\bin\"
https://www.youtube.com/watch?v=eqyhUwU95-E&t=727s

//species2.php
//sitemap-generator.php

use mysql;
ALTER DATABASE mysql DEFAULT COLLATE utf8_unicode_ci;
ALTER DATABASE mysql DEFAULT COLLATE utf8mb4;
ALTER DATABASE mysql DEFAULT COLLATE COLLATE big5_chinese_ci;
use mysql;
ALTER DATABASE mysql DEFAULT COLLATE utf8mb4;
DROP table SpeciesMain;
DROP table SpeciesYoutube;
CREATE table SpeciesMain(
cname VARCHAR(40),arithaiid int,youtubetext VARCHAR(512),youtubeid VARCHAR(40),vid VARCHAR(40));
CREATE table SpeciesYoutube(
cname VARCHAR(40),arithaino int,youtubeid VARCHAR(40),vid VARCHAR(40));
delete from SpeciesMain;
delete from SpeciesYoutube;

INSERT into SpeciesMain(cname,arithaiid,youtubetext,youtubeid,vid) values
('臺灣赤楠',322,'葉側脈於表裡兩面皆明顯可見
界：植物界 Plantae
演化支：維管束植物 Tracheophyta
演化支：被子植物 Angiosperms
演化支：真雙子葉植物 Eudicots
演化支：薔薇類植物 Rosids
目：桃金孃目 Myrtales
科：桃金孃科 Myrtaceae
屬：赤楠屬 Syzygium
種：臺灣赤楠 S. formosanum
二名法
Syzygium formosanum','YHx7RzAlbEw','VID20250614123229');
INSERT into SpeciesYoutube(cname,arithaino,youtubeid,vid) values
('臺灣赤楠',1,'YHx7RzAlbEw','VID20250614123229');
INSERT into SpeciesYoutube(cname,arithaino,youtubeid,vid) values
('臺灣赤楠',2,'nlbAm5d1HzY','VID20250614121019');


INSERT into SpeciesMain(cname,arithaiid,youtubetext,youtubeid,vid) values
('咖啡',17,'咖啡葉薄革質，光滑深綠色，卵狀披針形，長6—14釐米，寬3.5—5釐米
界：植物界 Plantae
演化支：維管束植物 Tracheophyta
演化支：被子植物 Angiosperms
演化支：真雙子葉植物 Eudicots
演化支：菊類植物 Asterids
目：龍膽目 Gentianales
科：茜草科 Rubiaceae
亞科：仙丹花亞科 Ixoroideae
族：咖啡族 Coffeeae
屬：咖啡屬 Coffea
咖啡','BMdmGhR6ooI','VID20250324112600');
INSERT into SpeciesYoutube(cname,arithaino,youtubeid,vid) values
('咖啡',1,'BMdmGhR6ooI','VID20250324112600');
INSERT into SpeciesYoutube(cname,arithaino,youtubeid,vid) values
('咖啡',2,'0nvNk6O5xn0','VID20231216111936');
INSERT into SpeciesYoutube(cname,arithaino,youtubeid,vid) values
('咖啡',3,'MuCTZjFzX6U','VID20231216111957');
INSERT into SpeciesYoutube(cname,arithaino,youtubeid,vid) values
('咖啡',4,'6gyVmjqD7Q4','VID20240901082357');
INSERT into SpeciesYoutube(cname,arithaino,youtubeid,vid) values
('咖啡',5,'ndeykI6spLU','VID20240926062957');

INSERT into SpeciesYoutube(
cname,youtubeid,vid) values('coffee','111','222');
delete from SpeciesYoutube  where cname='coffee';

FLUSH PRIVILEGES;
FLUSH TABLES;

