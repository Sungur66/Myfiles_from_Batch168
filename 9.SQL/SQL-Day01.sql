-- Database olusturma
CREATE database Batch168;

--Tablo olusturma
CREATE TABLE ogrenciler(
	ogrenci_no char(7),
    isim varchar(20),
	soyisim varchar(30),
	not_ort real, --Ondalikli sayilari belirtmek icin kullanilir
	kayit_tarihi date
);

SElECT * FROM ogrenciler;
--SQL de bir tabloyu olusturmanın 2 yolu vardır.İlki sıfırdan tablo olusturmaktır ve ikincisi de baska bir tablodan belirlenmis
--"field" leri kopyalayarak yeni bir tablo olusturmaktır.

-- Var olan tablodan yeni bir tablo olusturma
CREATE TABLE ogrenci_notlari
AS
SELECT isim, soyisim, not_ort FROM ogrenciler;

SELECT * FROM ogrenci_notlari;

-- DML (Data Manipulation Language) --> veri yi tablo icine yerlestirme

CREATE TABLE ogrenciler(
	ogrenci_no char(7),
    isim varchar(20),
	soyisim varchar(30),
	not_ort real, --Ondalikli sayilari belirtmek icin kullanilir
	kayit_tarihi date
);

INSERT INTO ogrenciler VALUES('1234567', 'Tom', 'Hanks', 85.5, '2023-08-01');
INSERT INTO ogrenciler VALUES('1474567', 'Veli', 'Sam', 52.5, '2023-04-01');
INSERT INTO ogrenciler VALUES('1474567', 'Ayse', 'Tel', 72.5, now()); -- default format __> yyyy/mm/dd

-- Bir tabloya parcali veri ekleme
INSERT INTO ogrenciler (isim, soyisim) VALUES ('Brad', 'Pitt');

SElECT * FROM ogrenciler;

-- CONSTRAINTS / KISITLAMALAR / BELIRLEYICILER

-- UNIQUE
-- NOT NULL

CREATE TABLE ogrenciler2(
	ogrenci_no char(7) UNIQUE,	-- benzersiz olmali
    isim varchar(20) NOT NULL,
	soyisim varchar(30) NOT NULL, -- BURASI BOS BIRAKILAMAZ DEMEK ICIN
	not_ort real, 
	kayit_tarihi date
);

SELECT * FROM ogrenciler2;

INSERT INTO ogrenciler2 VALUES('7654321', 'Ali','Can', 76.45, now());
INSERT INTO ogrenciler2 VALUES('7254321', 'Koc','Ram', 69.45, '2023/07/01');
INSERT INTO ogrenciler2 (ogrenci_no, isim, soyisim) Values ('7256321', 'Asi','Kan');
INSERT INTO ogrenciler2 (isim, soyisim) Values ('Aci','biber');


