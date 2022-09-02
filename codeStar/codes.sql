create database codestar;
--Codestar adli database olusturmak icin kullandik

create table isci (
isci_id int primary key,--Primary keyi isci_id'nin unique olmasini istedigim icin ve 
	                    --odeme tablosuyla iliskilendirebilmek icin primary key kullandim 
	                    --ama burada degerler ayni oldugu icin primary kullanmasak bile birbirleriyle iliskilendirebiliriz 
isimsoyisim varchar(30),
yaptigiis varchar(20),
ustalik varchar(20)		
);
insert into isci values (100,'Ismail Akdogan','Tesisatci','Kalfa');
insert into isci values (101,'Sedat Kurnali','Elektrikci','Usta');
insert into isci values (102,'Merve Culha','Boyaci','Usta');
insert into isci values (103,'Yunus Emre','Sivaci','Cirak');
insert into isci values (104,'Recep Kardes','Elektrikci','Kalfa');
insert into isci values (105,'Suleyman Sari','Tesisatci','Cirak');
select*from isci
select*from odeme

create table odeme(
odeme_id int,
maas int,
yolparasi int,
yemekparasi int,
constraint odeme_fk foreign key (odeme_id) references isci(isci_id)
on delete cascade  
);
insert into odeme values (100,6000,500,1500);
insert into odeme values (101,8000,600,1900);
insert into odeme values (102,9000,600,2000);
insert into odeme values (103,4000,500,1500);
insert into odeme values (104,6000,600,1800);
insert into odeme values (105,4500,500,1500);

select * from odeme
  
delete from odeme where  

alter table odeme drop maas-- Maas kolonunu siler
update odeme
set maas = null -- Maas kolonunu 