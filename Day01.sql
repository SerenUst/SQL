--DATABASE (veritabanı)Oluşturma
Create database aysan;


-- DDL - DATA DEFINITION LANG.
--CREATE -TABLO OLUŞTURMA
CREATE TABLE ogrenciler2
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real, -- Ondalıklı sayılar için kullanılır(Double gibi)
kayit_tarih date
);


--VAROLAN TABLODAN YENİ BİR TABLO OLUŞTURMA
CREATE TABLE ogrenci_notları
AS -- Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için
--normal tablo oluştururken ki parantezler yerine AS kullanıp Select komutuyla almak 
istediğimiz verileri alırız
SELECT isim,soyisim,not_ort from ogrenciler2;

--DML - DATA MANUPULATION LANG.
-- INSERT (DATABASE E VERİ EKLEME)
INSERT INTO ogrenciler2 Values ('123457', 'said','ILHAN',85.5,now());
INSERT INTO ogrenciler2 Values ('123457', 'said','ILHAN',85.5,'2020-12-11');

--BIR TABLOYA PARCALI VERİ EKLEMEK İSTERSEK

INSERT INTO ogrenciler2 (isim,soyisim) VALUES ('SEREN','AYSAN');


--DQL -DATA QUERT LANG.
--SELECT 

SELECT * FROM ogrenciler2;





bbbb



