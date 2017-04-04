def binary_search(a, x)
  if a.length == 0 then
    return -1
  end

  l = 0
  p = a.length-1

  if x < a[l] then
    return -1
  end

  if x > a[p] then
    return -1
  end

  while l <= p
    s = (l + p)/2

    if x == a[s] then
      return s
    else
      if x < a[s] then
        p = s-1
      else
        l = s+1
      end
    end
  end
  return -1
end

a =  [1,2,3,4,5,6,7,8,9,10,12]

k = binary_search(a, 1)

puts "#{k}"

