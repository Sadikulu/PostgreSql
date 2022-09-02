create table yazilimci(
id int primary key,
isimsoyisim varchar(30),
meslek varchar(30),	
sirket varchar(25), 
tecrubeyil int,
maas int
);
INSERT INTO yazilimci VALUES(101,'Ali Seker','Developer','Apple',10,50000);
INSERT INTO yazilimci VALUES(102,'Ayse Gul','Developer','Apple',6,35000);
INSERT INTO yazilimci VALUES(103,'Ismail Sancak','QA','Google',5,20000);
INSERT INTO yazilimci VALUES(104,'Sinan Cetin','Developer','Google',3,14000);
INSERT INTO yazilimci VALUES(105,'Ali Yilmaz','QA','Vestel',6,20000);
INSERT INTO yazilimci VALUES(106,'Fatma Tas','Developer','Tesla',5,25000);
INSERT INTO yazilimci VALUES(107,'Fatma Yasa','QA','Tesla',3,9000);

create table sirketadres(
 id int,	
sehir varchar(30),
ilce varchar(20),
mahalle varchar(20),
sokak varchar(30),
CONSTRAINT sirketadres_fk FOREIGN KEY (id) REFERENCES yazilimci(id)	
ON delete cascade	
);
insert into sirketadres values(101,'Leverkusen','Opladen','Şirintepe' ,'KAÇKAR');
insert INTO sirketadres values(102,'Leverkusen','Opladen','Şirintepe','KAÇKAR');
INSERT INTO sirketadres values(103,'Istanbul','Pınarbaşı','Hürriyet','YILDIRIM');
INSERT INTO sirketadres values(104,'Istanbul','Pınarbaşı','Hürriyet ','YILDIRIM');
INSERT INTO sirketadres values(105,'Koln','Mulheim','Gültepe','CIGIRTKAN');
INSERT INTO sirketadres values(106,'Zonguldak','Kilimli','Yahya Kemal','KAYALAR');
INSERT INTO sirketadres values(107,'Zonguldak','Kilimli','Yahya Kemal','KAYALAR');

create table qa (
id int,
programlamadil varchar(50),
sorgulama varchar(20),
CONSTRAINT qa FOREIGN KEY (id) REFERENCES yazilimci(id)	
ON delete cascade	
);
insert into qa values(107,'Java','PostgreSql');
insert INTO qa values(105,'Java','MySql');
INSERT INTO qa values(103,'C++','Oracle');
 
create table developer(
id int,
programlamadil varchar(30),
sorgulama varchar(30),
CONSTRAINT developer FOREIGN KEY (id) REFERENCES yazilimci(id)	
ON delete cascade	
);
insert into developer values(101,'Java','PostgreSql');
insert INTO developer values(102,'Java','MySql');
INSERT INTO developer values(104,'C++','Oracle');
INSERT INTO developer values(106,'C++','PostgreSql');
 
select * from developer
select *from qa
select * from sirketadres
select *from yazilimci

-- Maasi en yuksek developeri listele


-- Maasi en dusuk 2. QA'i listele


-- Istanbul'da calisan developerlari listele


-- Java bilen qa'lerin maaslarini listele


-- 'PostgreSql' bilen developerlarin maaslarini listele


-- 'CIGIRTKAN' sokakta calisanlarin maaslarini 38000 yap


-- 'C++' bilen QA'lerin sirketlerini 'Samsung' yap


-- Tesla'da calisanlarin maaslrinin ortalamasini al


-- Apple'da calisanlarin en yuksek maasini listele






