--Select-Similar to-Regex(Regular Expressions)--
/*
similar to:daha karmaşık pattern(kalıp) ile sotgulama işlemi için similar to kullanılabilir
sadece postgreSQL'de kullanılır. Büyük küçük harf önemlidir

Regex: herhangi bir kod, metin içerisinde istenen yazı veya kod parçasının 
aranıp bulunmasını sağlayan kendine ait bir söz dizimi olan bir yapıdır
MySql de (Regex_like) olarak kullanılır
PostGreSQL'de "~" karakteri ile kullanılır
*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
INSERT INTO kelimeler VALUES (1002, 'hat', 3);
INSERT INTO kelimeler VALUES (1003, 'hit', 3);
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler VALUES (1005, 'hct', 3);
INSERT INTO kelimeler VALUES (1006, 'adem', 4);
INSERT INTO kelimeler VALUES (1007, 'selim', 5);
INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
INSERT INTO kelimeler VALUES (1009, 'hip', 3);
INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);

select * from kelimeler;

--İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
--veya işlemi için | karakteri kullanılır
select * from kelimeler where kelime similar to '%(at|ot|Ot|oT|OT|At|aT|AT)%';
--like ile
select * from kelimeler where kelime ~~*'%at%' or kelime ~~* '%ot%';
--Regex ile
select * from kelimeler where kelime ~* 'ot' or kelime ~* 'at';

-- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
select * from kelimeler where kelime similar to 'ho%|hi%';
--likeile
select * from kelimeler where kelime ~~*'ho%' or kelime ~~* 'hi%';
--regex ile
select * from kelimeler where kelime ~* 'h[oi](.*)';
--regexte ".(nokta) bir karakteri temsil eder"
--Regex'de ikinci karakter için köşeli parantez kullanılır. * hepsi anlamında kullanılır

--Sonu 't' veya 'm' ile bitenleri listeleyeniz
select * from kelimeler where kelime similar to '%t|%m';
select * from kelimeler where kelime ~~*'%t' or kelime ~~* '%m';
select * from kelimeler where kelime ~* '(.*)[tm]$';--$ işareti bitir anlamında

-- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t';
select * from kelimeler where kelime ~~* 'h_t';
--regex ile
select * from kelimeler where kelime ~* 'h[a-z,A-Z,0-9]t';
select * from kelimeler where kelime ~*'(h.t)$';

--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 
--'a'dan 'e'ye herhangi bir karakter olan “kelime" değerlerini çağırın.
select kelime from kelimeler where kelime similar to 'h[a-e]%t';
select kelime from kelimeler where kelime ~* 'h[a-e](.*)t';
select kelime from kelimeler where kelime ~~* 'h%t' and kelime ~~*'_[a-e]';

--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
select kelime from kelimeler where kelime ~ '^[say](.*)';--^ başlangıç'ı temsl eder

--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın
select kelime from kelimeler WHERE kelime ~~* '%m' or kelime ~~*'%a' or kelime ~~*'%f';
select kelime from kelimeler where kelime ~ '(.*)[maf]$';

--İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini 
--sorgulayalım.
Select * from kelimeler where kelime similar to 'h[a|i]t';
select * from kelimeler where kelime ~* 'h[ai]t$';

--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup 
--üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
select kelime from kelimeler where kelime ~* '^[B-S].l(.*)';

--içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini 
--listeleyiniz.
SELECT * FROM kelimeler WHERE kelime similar to '%[o][o]%';
SELECT * FROM kelimeler WHERE kelime similar to '%[o]{2}%';
-- Süslü parantez içinde belirttiğimiz rakam bir önceki
--köşeli parantez içinde kaçtane olduğunu belirtir
SELECT * FROM kelimeler WHERE kelime ~~* '%o%o%';
SELECT * FROM kelimeler WHERE kelime ~'(.*)[o][o](.*)';

--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm 
--bilgilerini listeleyiniz.
SELECT * FROM kelimeler WHERE kelime similar to '%[o]{4}%';
SELECT * FROM kelimeler WHERE kelime ILIKE '%oooo%';
SELECT * FROM kelimeler WHERE kelime ~'(.*)[o]{4}(.*)';

--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten 
"kelime" değerlerini çağırın.
select kelime from kelimeler where kelime ~ '^[say](.*)[mf]$';




