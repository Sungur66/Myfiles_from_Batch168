def tekleri_ayikla(* x):
    
    """Bu fonksiyon tek sayilari ayiklar"""

    return [i for i in x if i % 2]

def ciftleri_ayikla(* x):
    
    """Bu fonksiyon ciftleri sayilari ayiklar"""

    return [i for i in x if i % 2 == 0]