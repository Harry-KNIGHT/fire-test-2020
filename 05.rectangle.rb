if (ARGV.length != 2)
  puts "Le script #{File.basename(__FILE__)} prend 2 agruments, si ARGV[0] se trouve dans ARGV[1],
  le script renvoi la position du premier index de ARGV[0] dans ARGV[1]."
  exit
end

def import_file(file)
  i = 0
  res = [] 
  File.foreach(file) { |line| res[i] = []; res[i] += line.chomp.split('').map(&:to_i); i += 1 }
  #class file pour appeler les fichier c1, c2.
  return (res)
end

file1 = import_file(ARGV[0]) #<-- fait parti de la fonctinon import file qu'on mettra dans is_it_a_match?
file2 = import_file(ARGV[1])# pareil qu'en haut 

# gerer le cas des fichier vide ici.

def is_it_a_match?(file1, file2, line, column) 
  line2 = 0
  while (line2 < file1.count)# .count sert à donner le nombre de caractères dans le fichier
    column2 = 0 
    while (column2 < file1[line2].count)
      if (file1[line2][column2] != file2[line + line2][column + column2])
        return (false)
      end
      column2 += 1
    end
    line2 += 1
  end
  return (true)
end

def rectangle(file1, file2)
  line = 0
    while (line < file2.count)
    column = 0
      while (column < file2[line].count)
        if (file2[line][column] == file1[0][0])
          if (is_it_a_match?(file1, file2, line, column))
            puts "#{column},#{line}"
            return (true)
          end
        end
        column += 1
      end
      line += 1
    end
  puts "PAS DE MATCH"
end

rectangle(file1, file2)

=begin
Expliquation du code :
!!! RAPPEL !!! Ce code est UNE facon de faire et non pas LA facon de faire.

*Ce scripte prend 2 arguments : 2 fichier, de préférence text, avec des lignes de chiffre.
*Le but de ce script est de checker si les donné de ARGV[0] se trouve dans ARGV[1] ET avec la meme dispotion entre les chiffre, exemple:
123               930870
321               081235
123  ARGV[0]      973217
                  091230
                  883700  ARGV[1]

# Ici je peut voir que le rectangle du text1 est dans le text2, à la column 2; line 1

______________________

*Si text1 est dans text2, le shell renvoi la coordoné de text1[0(0] dans text2, Exemple : [ruby 05.rectangle.rb text1 text2] -> 2,1  (car le l'index [0][0] de text1 est le '1' et se trouve à l'index [2][1] de text2)

-> Pour commencer, je doit faire en sorte que les datas de mes fichiers sois transformé en array pour être parcouru et comparé index par index.
-> pour cela j'ai déclaré la fonction 'import_file(file)' qui aura pour effet de mettre les infos de mes fichiers, en array à 2 dimensions,
-> donc l'array princaple, avec pour index les line(ligne1 = index0, ligne2 = index1 etc), et chaques 'line' serra découpé aussi, chiffres par chiffres (d'ou les 'column'), pour les indexé, ce qui va ressembler à:
*
123
321
123                                   # fichier1 avant passage dans la fonction 'import_file(file)'
*
[[1, 2, 3],  [3, 2, 1],  [1, 2, 3]]   # fichier1 après passage dans la fonction 'import_file(file)'
.i0.i1.i2....i0.i1.i2....i0.i1.i2
....i0..........i1..........i2.....

______________________

-> Avant d'aller plus loins, pour + de clarté dans mes expliquations, je vais décrire l'array principal comme étant parent, et les arrays secondaire comme étant enfant.

-> Une fois mes fichiers transformé en array, ils sont pret a etre comparé (en fonction des index et de la valeur de ces indexs).
-> Il va falloir créer des boucles dans des boucles, qui vont suivre le principe de l'array dans un autre pour aller chercher l'info (pour voir si un bout de file1 commence à apparaitre dans file2)
-> A noté que si je boucle tout en un seul morceau de code, ce serra trop chargé et difficile à comprendre, c'est pourquoi je vais le séparer en deux fonctions.
-> 1) La première fonction va regarder sur les indexs enfant dans file2, si je trouve l'index le premier index enfant de file1 (donc le chiffre '1')
-> 2) La seconde fonction serra appelé au milieu de la première. Dans le cas ou justement je trouve un '1', donc la valeurs de file1[0][0] dans file2. (le premier index qui engagerais la potentialité de trouvé mon petit rectangle dans le grand)
-> Du coup, la seconde fonction a pour but de regarder index après index si chaques index de file1 sont dans file2 avec les meme dispostion, ce qui serrais notre rectangle (ou rectangle)

-> La première fonction va checker les index de parent(premier while) puis enfant(second while) de file2, donc les 'line' et 'column', pour voir si un '1' commence a apparaitre
-> Et la seconde fonction va checker les indexs parents(premier while) puis enfant(second while), pour voir si après avoir trouvé un '1', les autres index concorde entre file1 et file2 pour formé le rectangle file1, dans file2.

-> Je commence par une boucle. Je lui defini une var = 0 pour itérérer. je l'appel 'line' Cette boucle dit :
-> Tant que line < le nombre d'index de file2, je boucle  (simplement pour parcourire tout les index parent) (stop si un rectangle est trouvé avant d'avoir parcouru tout les index parents de fils2)

-> Dans cette boucle, j'en créer un autre qui va faire exactement la meme chose MAIS une dimenssion plus profonde, donc avec les index enfant de file2 (check 1 par 1 les index enfant de file2, voir si un '1' apparait)
-> Je defini sont itérateur avec 'column = 0'

line = 0                                                # itérateur de la première boucle : line = 0
  while (line < file2.count)                            # condition : tant que la valeur de line plus petit que le nombre d'index parent de file2, alors.. Nouvelle condition, tant que..
  column = 0                                            # itérateur de la seconde boucle : column = 0
    while (column < file2[line].count)                  # condition : tant que la valeur de column plus petit que le nombre d'index enfant de file2 ([parent][enfant])

        ...                                             # ici je défini l'action que je veux effectuer tant si les while sont encore en mouvement arrivé a ce point

      column += 1                                       # J'ajoute + 1 à la valeur de column chaques tours
    end
    line += 1                                           # J'ajoute + 1 à la valeur de line chaques tours
  end

  -> Ca ressembleras a quelque chose comme ca (la forme que va prendre les tours dans la 'machine'):
  * Rappel, je cherche un index avec la valeur de file[0][0], c'est à dire '1'
  (en prenant comme exemple rect1.txt et rect2.txt comme étant ARGV[0] ET ARGV[1])
 ————— tour1 : file2[0][0] == file1[0][0] ? ... non     # Tour 1 de ma boucle principale + Tour 1 de ma boucle secondaire
  tour2 : file2[0][1] == file1[0][0] ? ... non     # Tour 2 de ma boucle secondaire
  tour3 : file2[0][2] == file1[0][0] ? ... non     # Tour 3 de ma boucle secondaire
  tour4 : file2[0][3] == file1[0][0] ? ... non     # Tour 4 de ma boucle secondaire
  tour5 : file2[0][4] == file1[0][0] ? ... non     # Tour 5 de ma boucle secondaire
  tour6 : file2[0][5] == file1[0][0] ? ... non     # Tour 6 de ma boucle secondaire (car 6 index au total). ok, pas de 1 dans ma première 'line', je check la seconde :
  tour7 : file2[1][0] == file1[0][0] ? ... non     # Tour 2 de ma boucle principale + Tour 1 de ma boucle secondaire
  tour8 : file2[1][1] == file1[0][0] ? ... non     # Tour 2 de ma boucle secondaire
  tour9 : file2[1][2] == file1[0][0] ? ... OUI !! C'EST UN '1' !! donc j'applique ma nouvelle condition

______________________

-> Ensuite, je continu a rentrer en pronfondeur dans mes boucles, a la place des '...' je défini une nouvelle condition qui dit :
-> Si l'index enfant de file2 (index validé au tour 9), est == a l'index [0][0] de file1 (donc dans notre exemple, l'index [0][0] de file1 est bien le numéro '1'), ce qui annoncerais un potentiel debut de rectangle,
-> ALORS, je défini une autre condtion... :
-> Si toute ces conditions sont juste, je fait appliquer la fonction is_it_a_match?
-> La fonction 'is_it_a_match?' va finaliser la comparaison des index pour savoir si oui ou non, file1 est dans file2

if (file2[line][column] == file1[0][0])           # donc la au tour 9, la valeur de file2[line][column] (c'est à dire file2[1][2]) = '1' (valeur 'file2[line][column]' dépend donc toujours des tours de boucle de 'rectangle')
  if (is_it_a_match?(file1, file2, line, column)) # alors, je rentre dans ma seconde fonction qui va aller inspecté (index enfant de file1) par rapport à (index enfant de file2) et voir si ils sont les meme au bont endroit pour formé mon rectangle. Si c'est le cas, c'est que mon petit rectangle est dans le grand.
    puts "#{column},#{line}"                      # Et alors (file1 est dans file2), je renvoi dans le shell, la coordoné de file1[0][0], dans mon grand rectangle. Si pendant cette boucle, deux valeur d'index de chaques file ne sont pas identiques, alors je continue mes boucle de la fonction 'rectangle' jusqu'a trouver un autre debut de rectangle (donc jusqu'a trouver un '1' dans file2).
    return (true)                                 # du coup, je return true pour signifier que mon code s'est conclu positivement
  end
end

______________________

-> Ma fonction 'rectangle' toute assemblé ressemble a ceci :

def rectangle(file1, file2)                               # Prend en parametre mes 2 fichiers a insecter
  line = 0                                                # Je défini que mon itérateur 'line' part de 0
    while (line < file2.count)                            # Tant que la valeur de line est plus petite que, la valeur de la somme des index parent de file2 (donc 5 indexs enfant dans file2 si je prend rect2.txt comme exemple), alors je boucle
    column = 0                                            # Je defini que mon itérateur 'colone' part de 0
      while (column < file2[line].count)                  # Dans ma première boucle, tant que la valeur de column est plus petite que, la valeur de la somme des indexs enfant de file2 (donc 6 index enfant dans file2 si je prend rect2.txt comme exemple), alors j'applique la condition
        if (file2[line][column] == file1[0][0])           # Si l'index enfant file2 est  =  au premier index enfant de file1 (toujours '1' dans mon exemple avec rect1.txt) , alors je rentre dans ma fonction 'is_it_a_match?' qui va voir si les autres index concorde, pour formé mon rectangle (qui est file1) dans file2
          if (is_it_a_match?(file1, file2, line, column)) # ET dans ce cas, si le premier if est vrai, j'applique la methode 'is_it_a_match?'. Et si cette dernière fonction return true
            puts "#{column},#{line}"                      # Alors je renvois la coordoné du premier chiffre de mon rectangle ( la coordoné de file1[0][0] dans tout les cas) dans file2
            return (true)                                 # Dans ce cas, ca stop les boucles evidement
          end
        end
        column += 1                                       # Incrémentation de +1 à column pour le tour suivant
      end
      line += 1                                           # Incrémentation de +1 à line pour le tour suivant
    end
  puts "PAS DE MATCH"                                     # Renvoi ceci si 'rectangle' n'as pas trouvé mon petit rectangle dans le grand, donc si il n'as pas trouvé de '1', ou si les index après le '1' ne correspondais pas.
end
______________________

-> Je vais détailler la fonction 'is_it_a_match?'.
-> Cette dernière va donc s'appliquer seulement dans le cas ou la première fonction 'rectangle' trouve un '1' dans file2
-> Elle prend en paramètre file1 et file2. ET line et column qui prendrons comme valeurs celles avec les quels elles (ces variables) sont rentré dans cette fonction
-> 'is_it_a_match?' va avoir comme utilité, de regarder si après le '1' trouvé dans file2, si les autres chiffres de files1 qui suivent notre '1' apparaissent aussi dans file2 ET si ils sont disposé de manière a formé file1 (voir exemple plus haut a la 5e ligne après le debut de mon expliquation)
-> (je parle du '1' qui colle au fichier utiliser mainteant pour etre claire, mais ce que le script regrade vraiment c'est file1[0][0])

-> Je vais donc dire sous forme de code, tant que de chaques index enfant de file1 se trouve dans file2, dispoé de facon a formé file1 tel quel, alors je boucle. Jusqu'a passer sur chaques index enfant de file1
-> Dans le cas ou tout les index enfant de file1 sont bouclé, c'est que file1 est dans file2
-> Ceci etant checké index par index, puis, ligne par ligne. Je doit definir un itérateur qui commence a zéro pour commencer par l'index 0 de file1 (pour les index parent). je vais l'appeler 'line2'
-> Et je defini 'column2' = 0 pour boucler les index enfants
-> Et l'étape final (j'ai eu beaucoup de mal a comprendre ca), la condition qui dit :

-> Si les index parents et enfants de file1 (valeurs d'index selon le tour de boucle) | ne sont pas égale |
-> à (ces meme valeur selon le tour) + la valeur des index de file2 qui créer le décalage du rectangle,
-> c'est a dire ce pourquoi file1 n'est pas collé sur la gauche de file2 ( dans notre cas 'file2[1][2]')
-> alors je retorune faut et je reppart dans ma boucle rectangle

-> if (file1[line2][column2] != file2[line + line2][column + column2]), je return false qui me renvoi à 'rectangle' à la recherhce d'un file1[0][0] (donc d'un ptit '1')

def is_it_a_match?(file1, file2, line, column)
  line2 = 0                                                                 # Je defini line2, un itérateur = 0 pour boucler les indexs parents de file1 un par un
  while (line2 < file1.count)  # donc la, 0, 1, 2 stop                      # Tant que la valeur de line2 est plus petite que la valeurs de la somme des index parent de file1 alors je rentre dans une nouvelle boucle qui dit :
    column2 = 0                                                             # Je defini colum2, un itérateur = 0 pour boucler les indexs enfant de file1 un par un
    while (column2 < file1[line2].count)                                    # Tant que la valeur de column2 est plus petite que la valeurs de la somme des index enfant de file1
      if (file1[line2][column2] != file2[line + line2][column + column2])   # si ... expliqué juste au dessus.
        return (false)                                                      # donc si a un seul moment ca ne match pas, ca return false a la fonction 'rectangle', et donc ca continu dans de boucler dans 'rectangle' a la recherche d'un '1'
      end
      column2 += 1                                                          # sinon en gros tant que c'est vrai, la boucle tourne et incrémente += 1 à column2 pour la sous-boucle
    end
    line2 += 1                                                              # et pour la grande boucle += 1 si la condition if ne s'applique pas
  end
  return (true)                                                             # ce true la signie que si j'arrive jusque la, c'est que tout mes index sont passé dans la fonction, DONC que chaques index a été validé dans le grand rectangle, donc que mon petit rectangle est dans le grand                                                       # a la toute fin de cette methode, si il n'y a pas ue de false, c'est que mon file1 est présen dans mon file2
end

______________________

-> Exemple visuel des 2 boucles boucles while sans les if :

tour1 : (line2 = 0) + (column2 = 0) == (file1[0][0]) ? ... oui    # Tour 1 de ma boucle principal (check les index parents) + Tour 1 de ma boucle secondaire (check les index enfants)
                                *column2 += 1
tour2 : (line2 = 0) + (column2 = 1) == (file1[0][1]) ? ... oui    # Tour 2 de ma boucle secondaire
                                *column2 += 1
tour3 : (line2 = 0) + (column2 = 2) == (file1[0][2]) ? ... oui    # Tour 3 de ma boucle secondaire. J'ai checker tout les index enfant de la première ligne, je passe a la ligne suivante et effectue les meme tahes
                                *line2 += 1
tour4 : (line2 = 1) + (column2 = 0) == (file1[1][0]) ? ... oui    # Tour 2 de ma boucle principal + Tour 1 de ma boucle secondaire
                                *column2 += 1
tour5 : (line2 = 1) + (column2 = 1) == (file1[1][1]) ? ... oui    # Tour 2 de ma boucle secondaire
                                *column2 += 1
tour6 : (line2 = 1) + (column2 = 2) == (file1[1][2]) ? ... oui    # Tour 3 de ma boucle secondaire. Fin de boucle pour ma deuxième ligne (rappel il n'y a que 3 index par ligne dans mon file1)
                                *line2 += 1
tour7 : (line2 = 2) + (column2 = 0) == (file1[2][0]) ? ... oui    # Tour 3 de ma boucle principal + Tour 1 de ma boucle secondaire
                                *column2 += 1
tour8 : (line2 = 2) + (column2 = 1) == (file1[2][1]) ? ... oui    # Tour 2 de ma boucle secondaire
                                *column2 += 1
tour9 : (line2 = 2) + (column2 = 2) == (file1[2][2]) ? ... oui    # Tour 3 de ma boucle secondaire

______________________

-> Donc, la j'ai écrit chaques étape car c'est un petit fichier a traité pour le coup, donc idéal pour montrer l'exemple
-> Dans ce cas la, tout les indexs enfant de file1 (les 9 chiffres), on été traité, ce qui veux dire que les if on aussi été true tout le long et qu'on a file1 dans file2

______________________

-> Maintenant, voila ce qui se passe dans les if a chaques tours de boucle :

*Est-ce que la valeur de file1 = la valeur de file2 a ce tour ? : si oui je continu sinon, je return false et goback yo 'rectangle'

tour1 : est-ce que :(file1[0][0] == file2[1 + 0][2 + 0]) ???  ... oui, je continue,
                             *1*                    *1*
tour2 : est-ce que :(file1[0][1] == file2[1 + 0][2 + 1]) ???  ... oui, je continue,
                             *2*                    *2*
tour3 : est-ce que :(file1[0][2] == file2[1 + 0][2 + 2]) ???  ... oui, je continue,
                             *3*                    *3*
tour4 : est-ce que :(file1[1][0] == file2[1 + 1][2 + 0]) ???  ... oui, je continue,
                             *3*                    *3*
tour5 : est-ce que :(file1[1][1] == file2[1 + 1][2 + 1]) ???  ... oui, je continue,
                             *2*                    *2*
tour6 : est-ce que :(file1[1][2] == file2[1 + 1][2 + 2]) ???  ... oui, je continue,
                             *1*                    *1*
tour7 : est-ce que :(file1[2][0] == file2[1 + 2][2 + 0]) ???  ... oui, je continue,
                             *1*                    *1*
tour8 : est-ce que :(file1[2][1] == file2[1 + 2][2 + 1]) ???  ... oui, je continue,
                             *2*                    *2*
tour7 : est-ce que :(file1[2][2] == file2[1 + 2][2 + 2]) ???  ... oui, alors c'est ok, je renvoie les coordoné dans mon shell !!!
                             *3*                    *3*

______________________

Le code assemblé + exemple d'argument :

ruby 05.rectangle.rb rect1.txt rect2.txt    # Ce que je rentre dans mon shell
*                                           # Entre les étoiles, ce qui mon code effectue
file1 = import_file(ARGV[0])
file2 = import_file(ARGV[1])

def is_it_a_match?(file1, file2, line, column)
  line2 = 0
  while (line2 < file1.count)
    column2 = 0
    while (column2 < file1[line2].count)
      if (file1[line2][column2] != file2[line + line2][column + column2])
        return (false)
      end
      column2 += 1
    end
    line2 += 1
  end
  return (true)
end

def rectangle(file1, file2)
  line = 0
    while (line < file2.count)
    column = 0
      while (column < file2[line].count)
        if (file2[line][column] == file1[0][0])
          if (is_it_a_match?(file1, file2, line, column))
            puts "#{column},#{line}"
            return (true)
          end
        end
        column += 1
      end
      line += 1
    end
  puts "PAS DE MATCH"
end

rectangle(file1, file2)
*

2,1  # Ce que mon input me revoi après avoir comparé mes arguments (ARGV)
=end
































# quand je vais faire au propre, je vais definir les index principaux comme 'parents' et les sous index comme 'enfant' pour etre bien compréhenssible.
# voir si remplacer column2 et line2 par i et j  et x et y si besoin, serrais pas plus simple finalement .. et meme les juste line et column
# 40 min 50, debut expliquation du code.
