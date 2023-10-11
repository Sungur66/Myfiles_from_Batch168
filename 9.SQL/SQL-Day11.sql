-- ************ TABLODAN DATA TYPE KOPYALAMA ******************
--kendimiz tablodan /column dan alabiliriz
do $$
declare                              --dinamik olarak data type larını db den alabiliriz. 
								     --Neden? cunku gonderilecek data ya sahip degiskenin tablodan data cekecegi header ın data type ı ne ise onu 
								     --dondurecek degiskenin de data type ını onun aynısı ile dinamik bir sekilde atarım
      film_type film.type%type;   --film tablosundaki title column ın data type ne ise onu film title data type ne ise onu ata demis olduk.
	  film_length film.length%type;  --film tablosundaki column data type i degisirse buradaki kod onu otomatik gorup degisecek dinamik koddur. 
begin
     --task: name i Shrek olan filmin type getirelim
	 select type 
	 from film
	 into film_type
	 where title='Shrek';
	 raise notice 'Adi Shrek olan filmin türü %  dur', film_type;
end $$;

-- ********************** ROW TYPE/ (SATIR DATA TYPE) DATA TYPE KOPYALAMA ***********
--PL/PGSQL bize db de var olan datalarla aynı bir OOP de oldugu gibi dataları sanki onlar bir objectmis gibi ve hatta
--bir object i map lermis gibi istedigimiz islemleri yapmamıza olanak tanır. Arka planda header/column degil row icindeki 
--data nin bilgilerini direkt alabiliriz


--Task: id si 1 olan actor ile ilgili tum datayı ekrana yazdırınız.

do $$
declare
   selected_actor actor%rowtype;
begin
   select * 
   from actor
   into selected_actor
   where id=1;
       
	   raise notice 'The actor name is: % %', -- cikti: The actor name is: Cüneyt Arkin
	   selected_actor.first_name,
	   selected_actor.last_name;
end $$;

---*************** RECORD TYPE (KAYIT/TABLE daki DATA KISMI) ****************************
--RECORD TYPE data type i declare edildiginde bildirilen tablonun bazı yada butun field data type lerine uygun veri yi tutabilecek
--bir degisken deklare edilmis olur.

--TASK: id si 1 olan filmin title, type ekrana yazdırınız.

do $$
declare
    	rec record;
begin
    select title, type
	from film
	into rec
	where id=1;
	raise notice '% - %', rec.title, rec.type;  -- cikti: Kuzularin Sessizligi - Korku
end $$;



-- ************************* İC İCE BLOK YAPISI ***************************
--Simdiye kadar 1 blok lu yani 1 do 1 declare 1 begin ve 1 end keywordune sahip ve tek satetment ile data query leri yaptık.
--Artık PL/SQL de ic ice girmis bloklar halinde birden fazla action ı db ye yaptırabiliriz.

do $$
--dış blok /outer blok
<<outer_blok>>
declare 
       counter integer :=0;
	begin
	  counter := counter +1;
	  raise notice 'Counter in degeri: %', counter;
	  
	declare --ic blok /inner blok
	     counter2 integer:=0;
	
	begin
	     counter2:= counter2+10;
		 raise notice 'Counter2 in degeri: %', counter2;  --aynı isimlerde degiskenler aynı blok icerisinde kullanılırsa bu degiskenin
		                                                   --hangi blokta oldugunu belirtip onu kullanmamız gerekir.
		 raise notice 'Counter in degeri: %', outer_blok.counter; 
    end;

end $$;
