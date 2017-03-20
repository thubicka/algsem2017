def insertSort(pole)
  
  for i in 0 .. pole.length-2
    j=i+1
    tmp = pole[j]
    while (j>0) && (tmp < pole[j-1])
      pole[j] = pole[j-1]
      j = j-1
    end
    
    pole[j] = tmp
  end
end

p=[6,5,4,3,2,1,0]

insertSort(p)

for i in 0..p.length-1
puts "#{p[i]},"
end
