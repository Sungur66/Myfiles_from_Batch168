do $$
declare
 film_turu film.type%type;
 uyarı_mesajı varchar(50);

begin

   select type from film
   into film_turu
   where id=2;
   
   if found then
      
	  case film_turu 
	      when 'Korku' then
		      uyarı_mesajı:='Cocuklar icin uygun degil';
 		  when 'Macera' then
		      uyarı_mesajı:='Cocuklar icin uygun';
		  when 'Animasyon' then
		      uyarı_mesajı:='Cocuklar icin uygun'; 
		  when 'Aksiyon' then
		      uyarı_mesajı:='Cocuklar icin uygun degil';  		  
    else 
	    uyarı_mesajı:= 'Tanımlamadı';
	end case;
	
	raise notice '%', uyarı_mesajı;
	
	end if;
	
end $$;




-- ********** For Loop ******************************

--syntax: 
[<<label>>]

for loop_counter in [reverse] from ...to[ by step] loop

		statement

end loop<<label>>;

-- Ornek: (in) 1 den 5 e kadar ekrana yazdırınız

do $$
begin

for counter in 1..5 loop

raise notice 'counter: %',counter;

end loop;
end $$;

--Ornek: (in) ve by ile for loop kullanımı
do $$
begin

for counter in 0..1000  by 5 loop

raise notice 'counter: %',counter;

end loop;
end $$;

do $$

declare 
	film_uzunlugu record;
	
begin
	for film_uzunlugu in select title, length  from film order by length desc limit 2 loop
		raise notice '% %', film_uzunlugu.title,film_uzunlugu.length;
	end loop;

end $$