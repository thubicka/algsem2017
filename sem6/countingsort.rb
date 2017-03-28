
def countingsort(a,b,k)
  c=Array.new(k+1,0)
  
  for j in 0 .. a.length-1
    c[a[j]] = c[a[j]]+1
  end
  
  for i in 1 .. k
    c[i] = c[i] + c[i-1]
  end
  
  j = a.length-1
  while j>=0
    b[c[a[j]]-1]=a[j]
    c[a[j]]=c[a[j]]-1
    j = j-1
  end

end

def generate_array(a)

  for i in 0 .. a.length-1
    a[i] = Random.new.rand(0..100000)
  end  

end

class Time
  def to_ms
    (self.to_f * 1000.0).to_i
  end
end

a=Array.new(100000)

generate_array(a)

b = []

start_time_q = Time.now
countingsort(a,b,100000)
end_time_q = Time.now

elapsed_time_q = end_time_q.to_ms - start_time_q.to_ms

puts "Elapsed time: #{elapsed_time_q}"

#puts "#{b}"
