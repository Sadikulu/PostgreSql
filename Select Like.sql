/*SELECT - LIKE koşulu
LIKE : Sorgulama yaparken belirli kalıp ifadeleri kullanabilmemizi sağlar
ILIKE : Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE :!~~*
% --> 0 veya daha fazla karakteri belirtir.
_ --> Tek bir karakteri belirtir*/

--ismi a harfi ile başlaya personeli listele
select * from personel where isim like 'A%';

--ismi t harfi ile biten personeli listele
select * from personel where isim like '%t';

--isminin 2. harfi e olan personeli listele
select * from personel where isim like '_e%';

--a ile başlayıp n ile biten personel isimlerini listele
select isim from personel where isim ~~* 'a%n';

-- ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
select isim from personel where isim ~~ '_a_u%';

-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
select isim from personel where isim ~~* '%e%' and isim ~~ '%r%';
select isim from personel where isim ~~* '%e%r%';

-- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
select * from personel where isim ~~* '_e%y%';

-- a harfi olmayan personeli listeleyin
select * from personel where isim !~~* '%a%';

-- 1. harfi A ve 7. harfi a olan personeli listeleyin
select * from personel where isim ~~* 'a_____a%'

--Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz.
select isim from personel where isim ~~* '%r_';










