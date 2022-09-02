--create tablo oluşturma-
CREATE TABLE ogrenci(
ogr_no int,
	ogr_isimsoyisim varchar(30),
	notlar real,
	yas int,
	adres varchar(50)
	kayit_tarih date
);
--varolan tablodan yeni bir tablo oluşturma
CREATE TABLE ogr_notlari
as
select ogr_no, notlar from ogrenci;
SELECT * FROM ogrenci;
SELECT * FROM ogr_notlari;