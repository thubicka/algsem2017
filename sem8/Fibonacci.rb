def fib1(n)
  
  if (n==0 || n==1)
    return n
  else
    return fib1(n-1)+fib1(n-2)
  end

end

def fib2(n,f)
  
  if (f[n] == nil)
    f[n] = fib2(n-1,f)+fib2(n-2,f)  
  end
  return f[n]
end

def fib3(n)
 if(n==0)
  return 0
 else
   i = 1
   x = 1
   y = 0
   
   while(i<n)
    i = i+1
    z = y
    y = x
    x = y + z
   end 
   return x
 end
end

f=Array.new(100,nil)
f[0] = 0
f[1] = 1

#x1 = fib1(35)
x2 = fib2(99,f)

puts "#{x2}"

x3 = fib3(99)

puts "#{x3}"