Create table codestar (
TC int ,
isimsoyisim varchar,
dogumTraihi date,
cinsiyet varchar(10),
dogumYeri varchar(20),
adresSehir varchar(20)			
);

insert into codestar values(101,'Yunus Emre Kolbasar' ,'05.11.2002' ,'E' ,'Istanbul' ,'LEVERKUSEN');
insert INTO codestar values(102,'Sedat Kurnali' ,'07.08.1980' ,'E' ,'Ankara','LEVERKUSEN');
INSERT INTO codestar values(103, 'Recep Kardes' ,'09.11.1986' ,'E' ,'Istanbul' ,'KAYSERI');
INSERT INTO codestar values(104, 'Nur Basaaslan' ,'06.08.1990 ','K' ,'Zonguldak' ,'KAYSERI');
INSERT INTO codestar values(105, 'Bilgehan Comert' ,'07.03.1995' ,'E' ,'Trabzon' ,'ZONGULDAK');
INSERT INTO codestar values(106, 'Merve Culha' ,'09.05.1993' ,'K' ,'Trabzon' ,'ZONGULDAK');
select * from acikadres
CREATE table acikadres(
adres_TC int,	
ilce varchar(30),
mahalle varchar(20),
cadde varchar(25),
sokak varchar(20)
)
insert into acikadres values(101,'Opladen','Şirintepe' ,'ALİBEYKÖY','KAÇKAR');
insert INTO acikadres values(102,'Opladen' ,'Şirintepe' ,'ALİBEYKÖY', 'KAÇKAR');
INSERT INTO acikadres values(103, 'Pınarbaşı' ,'Hürriyet' ,'BAĞLAR CD.','KARAMEŞE');
INSERT INTO acikadres values(104, 'Pınarbaşı' ,'Hürriyet','BAĞLAR CD.','KARAMEŞE');
INSERT INTO acikadres values(105, 'Kilimli.' ,'Yahya Kemal' ,'ÇOBANÇEŞME','KAYALAR');
INSERT INTO acikadres values(106, 'Kilimli.' ,'Yahya Kemal' ,'ÇOBANÇEŞME','KAYALAR');

-- Cinsiyeti E olanlarin sokagini Cigirtkan Sokak olarak degistriniz

update acikadres
set sokak = 'CIGIRTKAN'
WHERE adres_tc IN (select tc from codestar where cinsiyet = 'E')

SELECT * from acikadres
select *from codestar



-- Dogum tarihi 1987den sonra olanlarin dogum tarihini 01/01/1999 olarak degistirniz

update codestar
set dogumtraihi = '01.01.1999'
where dogumtraihi > '01.01.1987'



-- Mahallesi Hurriyet olanlarin sehirlerini Istanbul olarak degistiniz

update codestar
set adressehir = 'ISTANBUL'
WHERE tc IN (select adres_tc from acikadres where mahalle = 'Hürriyet')



-- Ismi M, N veya R ile baslayip cinsiyeti K olanlari yazdiriniz
select * from codestar where isimsoyisim ~~* 'm%' or isimsoyisim ~~* 'n%' or isimsoyisim ~~* 'r%' and cinsiyet = 'K'
select * from codestar where isimsoyisim ~* '^[m|n|r](.*)' and cinsiyet = 'E'

-- DogumYeri t ile baslayip n ile bitenleri yazdiriniz

select * from codestar where dogumyeri ~~* 't%n'

-- SOKAK Kay ile baslayip ayni zamanda cinsiyeti E olanlari yazdirniz

select * from codestar
where tc IN (SELECT adres_tc from acikadres WHERE sokak ~~* 'kay%') and cinsiyet = 'E'

-- TC'si 103'ten buyuk ve ismi B ile baslayanlari yazdirniz