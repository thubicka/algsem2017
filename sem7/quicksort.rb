
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

