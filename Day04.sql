--ALIASES


CREATE TABLE calisanlar9 (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);

INSERT INTO calisanlar9 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar9 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar9 VALUES(345678901, 'Mine Bulut', 'Izmir');
SELECT * FROM calisanlar9;

--Eğer iki sutunun verilerini birleştirmek istersek concat sembolu || kullanırız

SELECT calisan_id AS id, calisan_isim||' '||calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar9;


--2.Yol

SELECT calisan_id AS id, concat (calisan_isim,calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar9;



-- IS NULL CONDITION


CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');



CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

--NAME SUTUNUNDA NULL OLAN DEGERLERŞ LİSTELEYELİM.

select name from insanlar WHERE name IS NULL


--İnsanlar tablosunda sadece null olmayan degereleri listeleyiniz.

select name from insanlar WHERE name IS NOT NULL


--ınsanlar tablosunda null deger almıs verileri no name olarak degiştiriniz.

UPDATE insanlar
SET name='No Name'
WHERE name is null;


ORDER BY CLAUSE
/*
	ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	ORDER BY komutu sadece SELECT komutu Ile kullanilir
*/
/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/

drop table if exists insanlar

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar

--Insanlar tablosundaki datalari adres’e gore siralayin

select * from insanlar ORDER BY adres;

select * from insanlar ORDER BY soyisim;


--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
SELECT * FROM insanlar2 WHERE isim='Mine' ORDER BY ssn;
-- NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
-- Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
SELECT * FROM insanlar2 WHERE soyisim='Bulut' ORDER BY 4
-- Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
SELECT * FROM insanlar2 ORDER BY ssn DESC;
-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
SELECT * FROM insanlar2 ORDER BY isim ASC, soyisim DESC;
-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
/*
Eger sutun uzunluguna gore siralamak istersek LENGTH komutu kullaniriz
Ve yine uzunlugu buyukten kucuge siralamak istersek  sonuna DESC komutunu ekleriz
*/
SELECT isim,soyisim FROM insanlar2 ORDER BY LENGTH(soyisim) desc;

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
























































