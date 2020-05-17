def facto(n)
  if n < 1
    return 1
  end
    return n * facto(n - 1) #POUR QUE LE CHIFFRE PERDE UNE UNITÉ À CHAQUE BOUCLE
  end

y     puts facto(number)
