--Kentler isminde bir tablo oluşturalım

CREATE TABLE kentler(
	plaka_id int,
	kent_ad varchar(30),
	kent_yemekler varchar (30),
	kent_simge varchar(20),
	kent_kurtulus date,
	kent_radyosu real,
	kent_postakodu int
	
	);
	
	SELECT * from kentler;
	
	select plaka_id, kent_ad from kentler;
	
	--Tabloya veri ekleme
	INSERT into kentler VALUES (69,'BAYBURT','GALACOŞ','saat kulesi', '21/02/1918',97.6,69000);
	INSERT into kentler VALUES (15,'BURDUR','BURDUR ŞİŞ','SAGALASOS', '06/05/1920',98.1,15000);
	INSERT into kentler VALUES (61,'TRABZON','KUYMAK','BOZ TEPE', '15/08/1461',93.6,61000);
	INSERT into kentler VALUES (36,'KARS','HANGER','KARS KALESİ', '23/10/1918',103.8,36000);
	
	 DELETE FROM KENTLER WHERE kent_ad='BAYBURT';
	 
SELECT * FROM kentler where kent_kurtulus='23/10/1918';
delete FROM kentler where kent_kurtulus>='23/10/1918';
insert into kentler VALUES (67, 'ZONGULDAK');

insert into kentler (kent_kurtulus) VALUES ('21/06/1920');
alter table kentler ADD kentler_meshur VARCHAR(30);

UPDATE kentler set kent_yemekler='corba', kent_kurtulus='26/06/1935' WHERE plaka_id=67;
UPDATE kentler SET kent_ad='SUVAZ',plaka_id=58 WHERE kent_kurtulus='1920-06-21';



	 
	 