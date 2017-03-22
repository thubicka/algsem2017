def left(i)
  return 2*i+1
end

def right(i)
  return 2*i+2
end

def max_heapify(a,i,hsize)

  l = left(i)
  r = right(i)

  puts ("Max heapify: #{i}, left: #{l}, right #{r}")
  
  if ((l<= hsize-1) && (a[l] > a[i]))
    largest = l
  else
    largest = i
  end

  if ((r<= hsize-1) && (a[r] > a[largest]))
    largest = r
  end

  puts("Largest: #{largest}")
  
  if largest != i
    swap(a,i,largest)
    puts("rec: #{a}")
    max_heapify(a,largest,hsize)
  end

end

def build_heap(a)
  for i in ((a.length/ 2)-1).downto(0)
    puts ("#{i}")
    max_heapify(a,i,a.length)
  end
  
  puts ("Heap: #{a}")
end

def swap(a,i,j)
  tmp = a[i]
  a[i] = a[j]
  a[j] = tmp
end

def heapsort(b)
  puts("Build a heap...")
  build_heap(b)
  
  puts("Extract max...")
  
  puts("heap before extract max: #{b}")
  heapsize = b.length
  for i in (b.length-1).downto(1)
    swap(b,0,i)
    heapsize = heapsize - 1
    max_heapify(b,0,heapsize)
  end
end

a = [1,2,4,2,3,1,6,9,3,2,3,0,8,1,3,2,5,4]


heapsort(a)

puts "#{a}"
