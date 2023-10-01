class HarfSayaci:
    def __init__(self):
        self.sesli_harfler = 'aeiuo'
        self.sayac = 0

    def kelime_sor(self):
        return input("Bir Kelime Giriniz: ").lower()

    def seslidir(self, harf):
        return harf in self.sesli_harfler

    def artir(self):
        for harf in self.kelime:
            if self.seslidir(harf):
                self.sayac += 1
        return self.sayac

    def ekrana_goster(self):
        sesli_harf_sayisi = self.artir()
        mesaj = f"'{self.kelime}' kelimelerinde {sesli_harf_sayisi} sesli harf vardir"
        print(mesaj)
        
    def calistir(self):
        self.kelime = self.kelime_sor()
        self.ekrana_goster()
        
if __name__ == '__main__':
    harfinisayayim = HarfSayaci()
    harfinisayayim.calistir()