-- AGGREGATE METHOD KULLANIMI --
/*
-Aggregate Methodları (SUM(Topla),COUNT(Say),MIN(EN küçük değer),
MAX(En büyük değer),AVG(Ortalama))
-Subquery icinde de kullanilir
-Ancak, sorgu tek bir deger donduruyor olmalidir.
SYNTAX: sum() seklinde olmali sum () arasinda bosluk olmamali
*/

select * from calisanlar2;

--çalışanlar2 tablosundaki en yüksek maaş değerini listeleyiniz
select max(maas) from calisanlar2;

--çalışanlar tabolsundaki maaşların toplamını listeleyiniz
select sum(maas) from calisanlar2;

--çalışanlar tablosundaki maaş ortalamalarını listeleyiniz
select avg(maas) from calisanlar2;
select round(avg(maas)) from calisanlar2;--değeri virgülsüz getirir
select round(avg(maas),2) from calisanlar2;--virgülden sonra 2 karakter

--çalışanlar tablosundan en düşük maaşı listele
select min(maas) from calisanlar2;

--çalışanlar tablosundaki kaç kişinin maaş aldığını listeleyiniz
select count(maas) from calisanlar2;
select * from markalar;
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
--toplam maaşini listeleyiniz
select marka_isim, calisan_sayisi,
(select sum(maas) from calisanlar2 where marka_isim=isyeri) 
AS toplam_maas from markalar;
--AliAs(AS) tabloda gecici ism vermek istersek koşuldan sonra
--AS sutun_isim olarak kullanılır

--Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
--maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
select marka_isim, calisan_sayisi,
(select max(maas) from calisanlar2 where marka_isim=isyeri) AS max_maas, 
(select min(maas) from calisanlar2 where marka_isim=isyeri) as min_maas from markalar;

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id, marka_isim,(select count(sehir) from calisanlar2 where marka_isim=isyeri) 
as sehir_sayisi from markalar;

--Interview Question: En yüksek ikinci maas değerini çağırın.
select max(maas) as enyuksek_ikinci_maas from calisanlar2
where maas < (select max(maas) from calisanlar2);

--Interview Question: En düşük ikinci maas değerini çağırın.
select min(maas) as endusuk_ikinci_maas from calisanlar2
where maas > (select min(maas) from calisanlar2);

--en yüksek üçüncü maas
select max(maas)as enyuksek_ucuncu_maas from calisanlar2 where
maas<(select max(maas) from calisanlar2 where maas<(select max(maas) from calisanlar2));

--en düşük üçüncü maas değerini bulunuz
--Interview Question: En dusuk ucuncu maas değerini çağırın.
select min(maas)as endusuk_ucuncumaas from calisanlar2 where maas>
(select min(maas) from calisanlar2 where maas>(select min(maas) from calisanlar2));





