def left(i)
  return 2*i+1
end

def right(i)
  return 2*i+2
end

def max_heapify(a,i,hsize)

  l = left(i)
  r = right(i)
  
  if ((l<= hsize-1) && (a[l] > a[i]))
    largest = l
  else
    largest = i
  end

  if ((r<= hsize-1) && (a[r] > a[largest]))
    largest = r
  end

  if largest != i
    swap(a,i,largest)
    max_heapify(a,largest,hsize)
  end

end

def build_heap(a)
  for i in ((a.length/ 2)-1).downto(0)
    max_heapify(a,i,a.length)
  end
  
end


def heapsort(b)
  build_heap(b)
  heapsize = b.length
  for i in (b.length-1).downto(1)
    swap(b,0,i)
    heapsize = heapsize - 1
    max_heapify(b,0,heapsize)
  end
end

#------------------------------ 
 
def quicksort(a,l,r)
  if l<r
    q=partition(a,l,r)
    quicksort(a,l,q-1)
    quicksort(a,q+1,r)
  end
end

def partition(a,l,r)
  x = a[r]
  i = l-1
  for j in l .. r-1
    if a[j] <= x then
      i = i+1
      swap(a,i,j)
    end
  end
  swap(a,i+1,r)
  return i+1
end

def swap(a,i,j)
  tmp=a[i]
  a[i]=a[j]
  a[j]=tmp
end

def quicksort_insert(a,l,r)
  if r-l > 100
    q=partition(a,l,r)
    quicksort(a,l,q-1)
    quicksort(a,q+1,r)
  else
    insertsort(a,l,r)
  end  
end

def insertsort(pole,l,r)
  
  for i in l .. r-1
    j=i+1
    tmp = pole[j]
    while (j>l) && (tmp < pole[j-1])
      pole[j] = pole[j-1]
      j = j-1
    end
    
    pole[j] = tmp
  end
end

def randomized_partition(a,p,r)
 i = Random.new.rand(p..r)
 swap(a,r,i)
 partition(a,p,r)
end

def randomized_quicksort(a,p,r)
  if p<r then
    q = randomized_partition(a,p,r)
    randomized_quicksort(a,p,q-1)
    randomized_quicksort(a,q+1,r)
  end
end
 
def hoare_quicksort(a,p,r)
  
  x = a[p]
  i = p
  j = r
  
  
   begin 
    while (a[i] < x) 
      i = i+1
    end 
    
    while (a[j] > x) 
      j = j-1
    end 
    
    if i < j then
      swap(a,i,j) 
      i = i+1
      j = j-1 
    else if i == j then
      i = i+1
      j = j-1
    end     
    end
  end while i <= j
  
if p<j then hoare_quicksort(a,p,j) end
if i < r then hoare_quicksort(a,i,r) end  
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

#for i in 1 .. 10
  
a=Array.new(100000)

generate_array(a)

#puts "START: #{a}"

start_time_q = Time.now
#quicksort(a,0,a.length-1)
#heapsort(a)
quicksort_insert(a,0,a.length-1)
#insertsort(a,0,a.length-1)
#randomized_quicksort(a,0,a.length-1)
#hoare_quicksort(a,0,a.length-1)

end_time_q = Time.now

elapsed_time_q = end_time_q.to_ms - start_time_q.to_ms

puts "Elapsed time: #{elapsed_time_q}"
#puts "END: #{a}"

#end