-- 3) Primary Key: eger bir field "primary key" olarak deklare edilmisse, field datalari "unique", "not null" olmali
-- bir tabloda sadece bir tane primary key olabilir

-- Primary key atamasi icin 1.yol: istedigimiz field in yanina yazabiliriz
CREATE TABLE ogrenciler3(
	ogrenci_no char(7) PRIMARY KEY,	
    isim varchar(20) NOT NULL,
	soyisim varchar(30) NOT NULL, 
	not_ort real, 
	kayit_tarihi date
);

SELECT * FROM ogrenciler3;

-- Primary key atamasi icin 2.yol: en sona belirtilir

CREATE TABLE ogrenciler4(
	ogrenci_no char(7),	
    isim varchar(20) NOT NULL,
	soyisim varchar(30) NOT NULL, 
	not_ort real, 
	kayit_tarihi date,
	CONSTRAINT ogrenci_numarasi PRIMARY KEY (ogrenci_no)
	-- ogrenci_no yu PK olarak ata ve PK nin adini ogrenci_numarasi olarak ata
);

SELECT * FROM ogrenciler4;

INSERT INTO ogrenciler4 VALUES('7654321', 'Ali','Can', 76.45, now());
INSERT INTO ogrenciler4 VALUES('7254321', 'Koc','Ram', 69.45, '2023/07/01');
INSERT INTO ogrenciler4 (ogrenci_no, isim, soyisim) Values ('7256321', 'Asi','Kan');
INSERT INTO ogrenciler4 Values ('7254391','Aci','biber');

SELECT * FROM ogrenciler4;

-- FOREIGN KEY : referans olan parent tabldan baska bir tabloyla olan baglandisini saglayan key, 
-- tablolar arasinda iliskilendirme istiyorsak kullaniriz, köprü olusturmak yani
--2)Foreign Key:Tablolar arasında ilişki oluşturmak içindir.
-- Değer olarak "null" kabul eder
-- Tekrarlanan verileri kabul eder
-- Bir tablo birden çok "Foreign Key" alanına sahip olabilir.

/*
"tedarikciler3" isimli bir tablo olusturun. Tabloda "tedarikci_id", "tedarikci_ismi",  
"iletisim_isim" field'lari olsun ve "tedarikci_id" yi Primary Key yapin.
"urunler" isminde baska bir tablo olusturun "tedarikci_id" ve "urun_id" field'lari olsun ve
"tedarikci_id" yi Foreign Key yapin.
*/

CREATE TABLE tedarikciler3(
	tedarikci_id char(10) PRIMARY KEY,
	tedarikci_ismi varchar(20),
	iletisim_isim varchar(50)
);
SELECT * FROM tedarikciler3;

CREATE TABLE urunler(
	tedarikci_id char(10),
	urun_id char (5),
	
	FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id) 
);

SELECT * FROM urunler;

CREATE TABLE urunler2(
	tedarikci_id char(10),
	urun_id char (5),
	
	CONSTRAINT urn_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id) 
);

SELECT * FROM urunler2;

/*
"calisanlar" isimli bir Tablo olusturun. Icinde "id", "isim", "maas", "ise_baslama"  
field'lari olsun. "id" yi Primary Key yapin, "isim" i Unique, "maas" i Not Null yapın. 
"adresler" isminde baska bir tablo olusturun.Icinde "adres_id", "sokak", "cadde" ve 
"sehir" fieldlari olsun.  "adres_id" field'i ile Foreign Key oluşturun.
*/

CREATE TABLE calisanlar(
	id varchar(15) PRIMARY KEY,
	calisan_isim varchar(50) UNIQUE,
	maas smallint NOT NULL,
	ise_baslama date
);
SELECT * FROM calisanlar;

CREATE TABLE adresler(
	adres_id varchar(50),
	sokak varchar (50),
	cadde varchar (50),
	sehir varchar (50),
	FOREIGN KEY (adres_id) REFERENCES calisanlar(id) 
);

SELECT * FROM adresler;

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');--error verir cunku isim field 
--icin "Unique" constraint atanmis.
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaz', NULL, '2019-04-12'); -- not null error. maas null olamaz demistik
INSERT INTO calisanlar VALUES('10003', 'Can', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10203', 'CAN', 5000, '2018-04-14');

--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--error verir cunku isim field i icin "Unique" constraint
--atamasi var.

--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--error verir cunku maas field i icin belirlenen smallint
--data type icin char/varchar dastasi insert ettigimiz icin
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');

--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--error verir cunku PK daha once bos deger
--'' olarak atanmıstı

--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--error verir cunku PK daha once ayni degerde id kullanilmis.

SELECT * FROM calisanlar;

--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--error verir cunku PK 

SELECT * FROM calisanlar;

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Aga Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
--INSERT INTO adresler VALUES('10012','Aga Sok', '30.Cad.','Antep');

INSERT INTO adresler VALUES(NULL,'Aga Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Aga Sok', '30.Cad.','Maras'); -- null olabiliyor ama reference  de olmayan bir değer olamıyor

SELECT * FROM adresler;

-- 5) CHECK CONSTRAINT : girilen veriler icin koydugumuz kosullari kontrol eder.

CREATE TABLE calisanlar2
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000) NOT NULL,
ise_baslama date    
);

INSERT INTO calisanlar2 VALUES('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14');
-- INSERT INTO calisanlar2 VALUES('10003', 'Ali Yılmaz' ,9000, '2018-04-14'); -- new row for relation "calisanlar2" violates check constraint

SELECT * FROM calisanlar2;

-- DQL -- WHERE KULLANIMI

SELECT * FROM calisanlar;

SELECT calisan_isim FROM calisanlar;
SELECT calisan_isim, maas FROM calisanlar;

-- calisanlar tablosundan maasi 5000 den fazla olanlari listelemek icin
SELECT calisan_isim FROM calisanlar Where maas>5000;
SELECT calisan_isim, maas FROM calisanlar Where maas>5000;

-- calisanlar tablosundan ismi Veli Han olan tüm verileri listelemek icin
SELECT * FROM calisanlar Where calisan_isim='Veli Han';

-- calisanlar tablosundan maasi 5000 olanlarin tüm verileri listelemek icin
SELECT * FROM calisanlar Where maas = 5000;


-- DML -- DELETE KOMUTU
DELETE FROM calisanlar;
DELETE From adresler; -- be sekilde tablo icindeki verileri siler, table kalir
DROP TABLE adresler;  -- tabloyu komple siler, tablo falan kalmaz

-- Adresler tablosundan sehiri Antep olan verileri silelim
DELETE From adresler WHERE sehir= 'Antep';

SELECT * FROM adresler;


