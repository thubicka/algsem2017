class Node
  attr_accessor :object,:left,:right
  def initialize(object)
    @object = object
    @left = nil
    @right = nil
  end
end

class BinTree
  attr_reader :root
  def initialize()
    @root = nil
  end

  def insert(x)

    found = false

    u = @root
    p_u = nil

    while (u != nil) && (!found)
      if (u.object == x) then
        found = true
      else
        if (x < u.object) then
          p_u = u
          u = u.left
        else
          p_u = u
          u = u.right
        end
      end
    end

    if !found then
      n_u = Node.new(x)
      if (p_u == nil) then
        @root = n_u
      else
        if p_u.object > x then
          p_u.left = n_u
        else
          p_u.right = n_u
        end
      end
    end
  end

  def search(x)
    found = false
    u = @root
    while (u != nil) && (!found)
      if (u.object == x) then
        found = true
      else
        if (x < u.object) then
          u = u.left
        else
          u = u.right
        end
      end
    end

    if found then
      return u
    else
      return nil
    end
  end

  def traverse(x)
    puts "Node #{x.object}"
    if x.left != nil then
      puts "      Left: #{x.left.object}"
    end

    if x.right != nil then
      puts "      Right: #{x.right.object}"
    end

    if x.left != nil then
      traverse(x.left)
    end

    if x.right != nil then
      traverse(x.right)
    end
  end

  def printtree(x, l)
    if(x.right != nil) then
      printtree(x.right,l+1)
    end

    for i in 1 .. l
      print " "
    end
    puts "#{x.object}"

    if(x.left != nil) then
      printtree(x.left,l+1)
    end

  end
end

t = BinTree.new()

t.insert(10)
t.insert(4)
t.insert(20)
t.insert(21)
t.insert(99)
t.insert(0)
t.insert(19)
t.insert(100)
t.insert(18)

z = t.search(190)

if z != nil then
  puts "Found: #{z.object}"
else
  puts "Not found"
end

#t.traverse(t.root)
#t.printtree(t.root,1)


g = BinTree.new()

for i in 1 .. 100
  x = Random.new.rand(0..100)
  g.insert(x)
end

g.printtree(g.root,1)