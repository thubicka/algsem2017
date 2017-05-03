def hanoi(n,a,b,c)
  if(n > 0)
    hanoi(n-1,a,c,b)
    puts "Přenos: #{a} na #{b}";
    hanoi(n-1,c,b,a)
  end
end

hanoi(10,1,2,3)