CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM workers;
--Tekrarsız isimleri çağırın.
select distinct name from workers;
--distinct clause çağırılan terimlerden tekrarlı olanların 
--sadece birincisini alır

--Name değerlerini company kelime uzunluklarına göre sıralayın.
select name, company from workers
order by length(company);

--Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun
--değerinin uzunluğuna göre sıralayın.
--1.yol
select concat (name, ' ', state) as name_and_state 
from workers order by length(concat (name, ' ', state));
--2.yol
select concat (name, ' ', state) as name_and_state 
from workers order by length(name)+length(state);
--3.yol
select name || ' ' || state || ' ' || length(name)+length(state) 
as "name_and_states"
from workers order by length(name)+length(state);
/*
--unıon operatör: 1)iki sorgu sonucunu birleştirmek için kullanılır
                  2)tekrarsız(unique) recordları (satırları) verir
				  3)tek bir sutuna çok sutun koyabiliriz
				  4)tek bir sutuna çok sutun koyarken mevcut data 
				  durumuna dikkat etmek gerekir*/
				  
--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den 
--küçük olan name değerlerini tekrarsız olarak bulun.
select state as name_and_state, salary
from workers
where salary>3000
union
select name, salary
from workers
where salary<2000;

--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den 
--küçük olan name değerlerini tekrarlı olarak bulun.
select state as name_and_state, salary
from workers
where salary>3000
union all-->union ile aynı işi yapar ancak tekrarlı değerleri de verir
select name, salary
from workers
where salary<2000

--salary değeri 1000'den yüksek, 2000'den 
--az olan "ortak" name değerlerini bulun.
select name from workers
where salary>1000
intersect----INTERSECT Operator: İki sorgu (query) sonucunun ortak(common) değerlerini verir. Unique(tekrarsız) recordları verir.
select name from workers
where salary<2000;

--salary değeri 2000'den az olan ve company değeri  
--IBM, APPLE yada MICROSOFT olan ortak "name" değerlerini bulun.
select name from workers
where salary<2000
intersect
select name from workers
where company in ('IBM','APPLE','MICROSOFT');

/*EXCEPT Operator : Bir sorgu sonucundan başka bir 
sorgu sonucunu çıkarmak için kullanılır. 
Unique(tekrarsız) recordları verir.*/

--salary değeri 3000'den az ve GOOGLE'da çalışmayan  
--name değerlerini bulun.
select name from workers
where salary<3000
except
select name from workers
where company='GOOGLE';




SELECT * FROM workers;








