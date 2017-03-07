class HashtableItem
  attr_accessor :object,:key
  def initialize(key, object)
    @object = object
    @key = key
  end
end

class HashingWithOpenAddressing

  attr_accessor :size
  def initialize(size)
    @size = size
    @inner =  Array.new(@size)
  end

  def insert(key,object)

    i = 0
    found = false

    begin
      hash = h(key,i)

      if (@inner[hash] == nil)
        @inner[hash] = HashtableItem.new(key,object)
        found = true;
        puts("Found empty space #{hash} for key #{key}");
      else
        i=i+1
        puts("Another try #{i} for value #{key}");
      end
    end while ((i != @size) && (!found))

    #    index = h(key)

    #    @inner[index]  = HashtableItem.new(key,object)
  end

  def h(key,i)
    h1 = key % @size
    h2 = 1 + (key % (@size - 1))

    return (h1 + i * h2) % @size
  end

  def search(key)
    i = 0
    found = false

    begin
      hash = h(key,i)

      if ((@inner[hash] != nil) && (@inner[hash].key == key ))
        obj = @inner[hash].object
        found = true;
        puts("Found key  #{key} for position #{hash} ");
      else
        i=i+1
        # puts("Another try #{i} for value #{key}");
      end
    end while ((i != @size) && (!found))

    if(found)
      return  obj
    else
      return nil
    end
  end

end

puts "Start..."

hashtable = HashingWithOpenAddressing.new(383)

hashtable.insert(100,100)

nums = Array.new(300,0)

for i in 1..300
  nums[i] = Random.rand(10000)
end

for i in 1..300
  hashtable.insert(nums[i],nums[i])
end

puts "Search..."

for i in 1..300
  k = nums[i]
  o = hashtable.search(k)
  if(o == nil)
    puts("#{k} not found ")
  end
end

puts "End..."