c1 = ARGV[0]
c2 = ARGV[1]

carre = []
position = 0
File.foreach(c1) { |line| carre[position] = []; carre[position] = line.chomp.split('').map(&:to_i) ; position += 1 }
data = []
position = 0
File.foreach(c2) { |line| data[position] = []; data[position] = line.chomp.split('').map(&:to_i) ; position += 1 }

def match?(carre, data, line, colonne)
  line2 = 0
   while(line2 < carre.count)
      colonne2 = 0
      while(colonne2 < carre[line2].count)
        if (carre[line2][colonne2] != data[line + line2][colonne + colonne2])
          return(false)
        end  
        colonne2 += 1 
      end
      line2 += 1
   end
    return (true)
end

def rectangle(carre, data)
  line = 0
  while (line < data.count) 
     colonne = 0  
     while (colonne < data[line].count)
       if  data[line][colonne] == carre[0][0]
          if match?(carre, data, line, colonne)
            puts "#{line},#{colonne}"
            return (true)
          end 
       end
       colonne += 1
     end
     line += 1 

   end
    return (false)
end 


rectangle(carre, data)
