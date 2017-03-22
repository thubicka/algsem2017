def bubblesort(a)
  for i in 1 .. a.length-1
    for j in (a.length-1).downto(i)
      if a[j] < a[j-1]
        swap(a,j,j-1)
      end
    end
  end
end

def swap(a,i,j)
  tmp=a[i]
  a[i]=a[j]
  a[j]=tmp
end

def shakersort(a)
  levy = 1
  pravy = a.length-1
  k=a.length-1

  begin
    for j in (pravy).downto(levy)
      if a[j-1] > a[j]
        swap(a,j-1,j)
        k=j
      end
    end

    levy = k+1

    for j in levy .. pravy
      if a[j-1] > a[j]
        swap(a,j-1,j)
        k=j
      end
    end
    pravy = k-1
  end  while (levy < pravy)
end

a = [1,2,4,2,3,1,6,9,3,2,3,0,8,1,3,2,5,4]

bubblesort(a)

puts "#{a}"