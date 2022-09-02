--Is null,Is not null,coalesce--
/*is null ve is not null boolean operatörleridir.
Bir ifadenin null olup olmadığını kontrol eder
COALESCE(yani birleştirme) ise bir fonksiyondur ve
içerisindeki parametrelerden null olmayan ilk ifadeyi döndürür*/

CREATE TABLE insanlar (	
	ssn CHAR(9), -- Social Security Number	
	isim VARCHAR(50), 	
	adres VARCHAR(50) 
);
INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');

select * from insanlar;

--ismi null olanları sorgula
select * from insanlar where isim is null;

--ismi null olmayanları sorgula
select * from insanlar where isim is not null;

--ismi null olan kişilerin ismine NO NAME atayınız
update insanlar set isim='NO NAME' where isim is null;

--tabloyu bir önceki soruyu çözmeden önceki haline getirme
update insanlar set isim=null where isim='NO NAME';

--Not: çoklu değişimde her değişim için set ... where isim is null gibi
--ifade yazmamak için Coalesce (yani birleştirme) kullanılır

/*isim 'i NULL olanlara 'Henuz isim girilmedi'
adres 'i NULL olanlara 'Henuz adres girilmedi'
ssn 'i NULL olanlara ' no ssn' atayalım.*/
update insanlar
set isim=coalesce(isim,'Henüz isim girilmedi'),
adres=coalesce(adres,'Henüz adres girilmedi'),
ssn=coalesce(ssn,'No SSN');





