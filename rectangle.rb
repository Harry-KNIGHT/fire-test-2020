def index(tab, res, x, y)            # fonction qui permet de trouver des 1

   while x < tab.length              # tant que x est inferieur a 5

     while (y < tab[x].length)       # tant que y est inferieur au nombre de chiffre des index de tab (6)

       if res[0][0] == tab[x][y]     # si le premier chiffre du premiere index de res est egale a x et y alors
         return [x, y]               # alors arreter le script et retourner les coordonee de x et y

       end
       y += 1                        #tant que le premier chiffre du premiere index de res nest pas trouvé alors augmenter y de 1 a chaque fois

     end
        x += 1                        #si a la fin du premiere index de tab le 1 nest pas trouvé alors augmenter x de 1 pour changer dindex
        y = 0                         #et remettre y a zero pour repartir du premier chiffre de nouvelle index
   end
   return false                       # si tout ca ne fonctionne pas cest quil que le premier chiffre du premiere index de res  nest pas present parmis les chiffres de tab
end
def comparer(tab, res, x, y)                  #fonction qui permet de definir si tout les chiffre de res si bien tous au bon endroit
   a = 0                                      #variable
   b = 0                                      #variable
   z = y                                      #

   if tab.length - x < res.length             # x defini dans la fonction rectangle comme tab[0] si 5 - x < 3 alors
      return false                            # arreter le script et retouner false                                              -----------------------------------------------
   end

   while a < res.length && x < tab.length     #
      b = 0
      y = z                                   #-----------------------------------------------
      while b < res[a].length
          if res[a][b] == tab[x][y]
              b += 1
              y += 1
          else
            return false
          end

      end
      x += 1
      a += 1
   end


   return true
end
def rectangle()
   tab = [["9", "3", "0", "8", "7", "0"], ["0", "8", "1", "2", "3", "5"], ["9", "7", "3", "2", "1", "7"], ["0", "9", "1", "2", "3", "0"], ["8", "8", "3", "7", "0", "0"]]
   res = [["1", "2", "3"], ["3", "2", "1"], ["1", "2", "3"]]
   tab_index = index(tab, res, 0, 0)
   x = tab_index[0]
   y = tab_index[1]
   while comparer(tab, res, x, y) == false
     tab_index = index(tab, res, x, y + 1)
     x = tab_index[0]
     y = tab_index[1]
   end
   if comparer(tab, res, x, y) == true
      puts "#{tab_index.join(', ')}"
   else
      puts 'il ny a pas de rectangle'

   end
end

rectangle()
