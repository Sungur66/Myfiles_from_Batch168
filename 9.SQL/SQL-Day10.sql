--uzun yorumlar icin
/*
daha uzun yorumlar icin
*/

-- ****  PL/pgSQL de degisken tanimlama

    -- do ile anonim(ismi belliolmayan, genel) bir prosedur uygula diyoruz. 
	-- $ ile syntax icinde kullanilacak degiskenlerin sorun cikarmadan calismasini saglarmis
	-- yani degiskenler(varchar, text) kullanirken tirnak isaretini kendi belirleyecek

DO $$
DECLARE
	counter integer :=1; -- degisken adi counter ve degeri  1
	firs_name varchar(50) :='Ahmet';
	last_name varchar(50) :='Gok';
	payment numeric(4, 2) :=20.5;
BEGIN
	RAISE NOTICE '% % % has paid % USD',
				counter,
				firs_name,
				last_name,
				payment;
	
    -- Her bir % işareti yer tutucu olarak, yukarıdaki sıralı değişkenlere karışılık gelir.
	-- Konsolda - 1 Ahmet Gok has paid 20.5 USD - yazmak istersek böyle yazariz  
END $$;

-- **************** DEGİSKEN TANIMLAMA **************************
--do ile anonymous(ismi olmayan,genel) bir prosedur uygula diyoruz 
               --dolar sign ile syntax iceriisnde kullanılacak (varchar, text gibi) 
			   --degiskenlerin tırnak isaretlerini pgAdmin ekleyecek demis oluyoruz

do $$ 
declare 
    counter integer :=1;  --counter isminde bir degisken olusturuldu ve 1 deger olarak atandı.
	first_name varchar(50) :='Ahmet';
	last_name varchar(50) := 'Gok';
	payment numeric(4, 2) := 20.5;
	
begin                       --1 Ahmet Gok has paid 20.5 USD
     raise notice '% % % has paid % USD',
	                counter,
					first_name,
					last_name,
					payment;
end $$;

--TASK 1:Degiskenler olusturarak ekrana "Ahmet ve Mehmet beyler 120 TL ye bilet aldilar. " cumlesini yazdırınız.
do $$ 
declare 
   	first_person varchar(50) :='Ahmet';
	second_person varchar(50) := 'Mehmet';
	odeme numeric(3) := 120;
	
begin                      
     raise notice '% ve % beyler % TL ye bilet aldilar.',
	                first_person,
					second_person,
					odeme;
end $$;
----------------- bekletme komutu ------------------------
do $$
DECLARE
	created_at time :=now(); --local/db de olan simdiki zaman degerini created_at degiskenine atadik
BEGIN
	raise notice '%', created_at;
	perform pg_sleep(5); -- 5 saniye bekle diye yazdik
	raise notice '%', created_at;
end $$;

do $$
DECLARE
	created_at_1 time :=now();
	created_at_2 time :=now();
BEGIN   -- yyukardan gelirken 1 ve 2. zaman icin ayni degeri belirler, onun icin sonuc ayni 
	raise notice '%', created_at_2;
	perform pg_sleep(5); -- 5 saniye bekle diye yazdik
	raise notice '%', created_at_1;
end $$;

----------------------- tablodan data type ini kopyalama --------
do $$
declare
	film_title film.title%type;
	
	

