require 'quicksort.rb'
require 'generate_array.rb'

def interpolate_search(a, x)
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
    if l == p then
      k = l
    else
      k = l+(p-l)*(x-a[l])/(a[p] - a[l])
    end

    if k<l then
      return -1
    end

    if k>p then
      return -1
    end

    if x == a[k] then
      return k
    else
      if x < a[k] then
        p = k-1
      else
        l = k+1
      end
    end
  end
  return -1
end



a=Array.new(100000)
  
  generate_array(a)
  
  quicksort(a,0,a.length-1)

  puts "#{a}"
k = interpolate_search(a,9999)

puts "#{k}"


