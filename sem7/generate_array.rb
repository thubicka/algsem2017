def generate_array(a)

  for i in 0 .. a.length-1
    a[i] = Random.new.rand(0..100000)
  end  

end