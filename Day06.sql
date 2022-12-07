CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota'); 
INSERT INTO sirketler VALUES(101, 'Honda'); 
INSERT INTO sirketler VALUES(102, 'Ford'); 
INSERT INTO sirketler VALUES(103, 'Hyundai');


CREATE TABLE siparisler  (
siparis_id int,  sirket_id int,  siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17'); 
INSERT INTO siparisler VALUES(22, 102, ' 2020-04-18'); 
INSERT INTO siparisler VALUES(33, 103, ' 2020-04-19');  
INSERT INTO siparisler VALUES(44, 104, ' 2020-04-20');  
INSERT INTO siparisler VALUES(55,  105, ' 2020-04-21');

SELECT * FROM sirketler
SELECT * FROM siparisler

--SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun

SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi 
FROM sirketler INNER JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id

--                   LEFT JOINS

/*
 NOT :
1) Left Join’de ilk tablodaki tum record’lar gosterilir.
2) Ilk tablodaki datalara 2.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir ancak
ortak olmayan datalar icin o kisimlar bos kalir
3) Ilk yazdiginiz Tablonun tamamini aldigi icin hangi tabloyu istedigimize karar verip once onu yazmaliyiz
 */


--SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun

SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi 
FROM sirketler LEFT JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id


--           RİGHT JOİN
/*
	NOT :
	1)Right Join’de ikinci tablodaki tum record’lar gosterilir.
	2)Ikinci tablodaki datalara 1.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir
	ancak ortak olmayan datalar icin o kisimlar bos kalir
 */
 SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi 
FROM sirketler RIGHT JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id



--              FULL JOINS

SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi 
FROM sirketler FULL JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id;

--NOT :
--1) FULL Join’de iki tabloda var olan tum record’lar gosterilir.
--2) Bir tabloda olup otekinde olmayan data’lar bos kali
 
--  INNER KESİŞİMİ VERİR
--	LENF SOL TARAFI VERİR
--  RIGHT SAĞ TARAFI VERİR
--	FULL HEPSİNİ VERİR

--                SELF JOINS

--soru 2) : Her personelin yanina yonetici ismini yazdiran bir tablo olusturun

CREATE TABLE personel 
(
id int,
isim varchar(20), 
title varchar(60), 
yonetici_id int);


INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);


SELECT p1.isim AS personel_ismi, p2.isim AS yonetici_ismi
FROM personel p1 INNER JOIN personel p2
ON p1.yonetici_id = p2.id;


--           LIKE Condition

/*
	LIKE condition WHERE ile kullanilarak SELECT, INSERT, UPDATE, veya DELETE
	statement ile calisan wildcards’a(özel sembol) izin verir.. Ve bize pattern matching yapma
	imkani verir.
*/

drop table musteriler
CREATE TABLE musteriler 
(
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);

INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'ahmet', 82000); 
--1) % => 0 veya birden fazla karakter belirtir

--SORU : Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin

SELECT * FROM musteriler
WHERE isim LIKE 'A%';

--LIKE 'A%';   Like tan sonra tirnak isareti icinde A% demek a ile baslayan ve sonunda
                        -- ne olursa olsun getir demek

SELECT * FROM musteriler
WHERE isim ILIKE 'A%'

SELECT * FROM musteriler
WHERE isim ~~*'A%'
-- ALT GR Ü 2 KERE BASLR 
/*
LIKE kullanımında büyük küçük harf gözetmeksizin sonuç almak istersek ILIKE kullanırız
LIKE yerine ~~ sembollerini kullanabiliriz
*/

--SORU : Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin

SELECT isim,gelir FROM musteriler 
WHERE isim LIKE '%e';

--SORU : Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
SELECT isim,gelir FROM musteriler
WHERE isim LIKE '%er%'

--2) _ => sadece bir karakteri gosterir.
--SORU : Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT *FROM musteriler
WHERE isim LIKE '_atma';

--Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin

SELECT * FROM musteriler 
WHERE isim LIKE '_a%'


--SORU : Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin

SELECT *FROM musteriler
WHERE isim LIKE '__s%'


--3) REGEXP_LIKE =>Daha karmaşık sorgular için herhangi bir kod, metin icerisinde istenilen yazi
--veya kod parcasinin aranip bulunmasini saglayan kendine ait soz dizimi olan bir yapidir.
--(REGEXP_LIKE) PostgreSQL de ‘’ ~ ‘’ karekteri ile kullanilir


CREATE TABLE kelimeler 
(
id int UNIQUE,
kelime varchar(50) NOT NULL, 
Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3); 
INSERT INTO kelimeler VALUES (1002, 'hat', 3); 
INSERT INTO kelimeler VALUES (1003, 'hit', 3); 
INSERT INTO kelimeler VALUES (1004, 'hbt', 3); 
INSERT INTO kelimeler VALUES (1008, 'hct', 3); 
INSERT INTO kelimeler VALUES (1005, 'adem', 4); 
INSERT INTO kelimeler VALUES (1006, 'selim', 5); 
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);

--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran
--       QUERY yazin

SELECT *FROM kelimeler
WHERE kelime ~ 'h[ai]t'

--SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini 
--yazdiran QUERY yazin
SELECT *FROM kelimeler
WHERE kelime ~ 'h[a-k]t';


--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler
WHERE kelime ~ '^[as]';

--SORU : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler
WHERE kelime ~ '[mf]$';

--^ baslayan  $ biten


--                UPPER – LOWER - INITCAP

-- Kelimeler tablosundaki kelime sütunundaki verileri önce hepsini büyük harf, sonra küçük harf ve ilk harfleri
-- büyük olucak şekilde yazdıralım

SELECT UPPER(kelime) FROM kelimeler
SELECT LOWER(kelime) FROM kelimeler
SELECT INITCAP(kelime) FROM kelimeler


-- Musteriler tablosundan  butun isimleri buyuk harf yapiniz
SELECT UPPER(isim) FROM musteriler


/*
Eğer birden fazla sütundaki verileri büyük küçük harf yapmak istersek
select lower(title),UPPER(isim) from personel şekilde yapabiliriz
*/
select lower(title),UPPER(isim) from personel
