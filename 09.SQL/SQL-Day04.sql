-- Subquery
-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin
-- isimlerini ve maaşlarini listeleyin.
SELECT * FROM calisanlar2;
SELECT * FROM markalar;

SELECT isim, maas, isyeri FROM calisanlar2 WHERE isyeri IN
(SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);

--AGGREGATION FUNKTIONS
-- Calisanlar2 tablosunda max maasi listeleyiniz
SELECT MAX(maas) AS max_maas FROM calisanlar2;

--Eger bir sorgu sonucu icin gecici olarak sorgu tablosuna baslık atamak istiyorsak 'Alias' kullanabiliriz.
-- Calisanlar2 tablosunda min maasi listeleyiniz
SELECT MIN(maas) AS min_maas FROM calisanlar2;

SELECT * FROM calisanlar2 WHERE maas=(SELECT MIN(maas) FROM calisanlar2);

-- Calisanlar2 tablosundaki maaslarin toplamini listeleyin
SELECT SUM(maas) FROM calisanlar2;

-- Calisanlar2 tablosundaki maaslarin ortalamasini listeleyin
SELECT AVG(maas) FROM calisanlar2; --2714.2857142857142857  cikti

-- AVG() icin ondalik kismi belirlemek icin round() kullanabiliriz
SELECT ROUND(AVG(maas), 2) FROM calisanlar2; --2714.29  cikti

-- Calisanlar2 tablosundaki maaslarin sayisini bulun
--COUNT() datalari kac tane oldugunu sayar
SELECT COUNT(maas) FROM calisanlar2;  --7 cikti
SELECT COUNT(*) FROM calisanlar2;  --burda 7 verdi, yani 7 kayit satir var demek

--AGGREGATE fonksiyonlarda SUBQUERY
-- Her markanin id’sini, ismini 
-- ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz. 

SELECT marka_id, marka_isim, (
(SELECT COUNT(sehir) FROM calisanlar2 WHERE isyeri=marka_isim)
	) AS sehir_sayisi FROM markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
-- maksimum maaşlari listeleyen bir Sorgu yaziniz.
SELECT 
	marka_isim, 
	calisan_sayisi, 
	(SELECT MAX(maas) FROM calisanlar2 WHERE isyeri=marka_isim) 
	FROM markalar;

-- VIEW Kullanımı
/*
Yaptığımız sorguları hafızaya alır ve tekrar bizden istenen sorgulama yerine
view'e atadığımız ismi SELECT komutuyla çağırırız
*/
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
-- maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
CREATE VIEW maxmin_maas
AS 
SELECT 
	marka_isim, 
	calisan_sayisi, 
	(SELECT max(maas) FROM calisanlar2 WHERE marka_isim = isyeri) as max_maas,
	(SELECT min(maas) FROM calisanlar2 WHERE marka_isim = isyeri) as min_maas
FROM markalar;

SELECT * FROM maxmin_maas;

-- EXISTS CONDITION

CREATE TABLE mart
(	
urun_id int,	
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(	
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart
select * from nisan
/*
--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  URUN_ID'lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 
*/
SELECT urun_id, musteri_isim, FROM mart WHERE exists (select urun_id FROM nisan WHERE mart.urun_id=nisan.urun_id);

/*
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/

SELECT urun_isim, musteri_isim FROM nisan WHERE EXISTS 
	(SELECT urun_isim From mart WHERE mart.urun_isim=nisan.urun_isim);

