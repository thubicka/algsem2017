# -*- coding: iso-8859-2 -*-
require "index_out_of_bounds_exception"
require "wrong_list_exception"

class LinkedListItem
  attr_accessor :object, :previous, :next
  attr_reader :list
  def initialize(object, list)
    @object = object
    @list = list
  end
end

class LinkedList
  attr_reader :length

  def initialize
    @length = 0
    @head = nil
    @tail = nil
  end

  # get_item(i)
  def get_item(index)
    raise IndexOutOfBoundsException.new(index, @length) if (index < 0 || index >= @length)
    item = @head
    index.times { item = item.next }
    return item
  end

  # get(i)
  def [](index)
    return get_item(index).object
  end

  # set(i, value)
  # vrací hodnotu value
  def []=(index, object)
    get_item(index).object = object
    return object
  end

  # find(value)
  # v případě neúspěchu vrací nil
  def find(object)
    item = @head
    until item.nil?
      return item if item.object == object
      item = item.next
    end
    return nil
  end

  # iterate(callback)
  def each
    if @length > 0
      item = @head
      begin
        yield item.object
        item = item.next
      end until item.nil?
    end
  end

  # insert_before(item, value)
  # vrací novou položku
  def insert_before(item, object)
    raise WrongListException.new(item, self) if item.list != self
    if item == @head
      unshift(object)
      return @head
    else
      new_item = LinkedListItem.new(object, self)
      new_item.previous = item.previous
      new_item.next = item
      item.previous.next = new_item
      item.previous = new_item
      @length += 1
      return new_item
    end
  end

  # insert_after(item, value)
  # vrací novou položku
  def insert_after(item, object)
    raise WrongListException.new(item, self) if item.list != self
    if item == @tail
      self << object
      return @tail
    else
      return insert_before(item.next, object)
    end
  end

  # insert(i, value)
  # vrací seznam samotný
  def insert(index, object)
    if index < @length
      insert_before(get_item(index), object)
    elsif index == @length
      insert_after(@tail, object)
    end
    return self
  end

  # remove_item(item)
  # vrací hodnotu odebrané položky
  def remove_item(item)
    raise WrongListException.new(item, self) if item.list != self
    item.previous.next = item.next unless item.previous.nil?
    item.next.previous = item.previous unless item.next.nil?
    @length -= 1
    @head = item.next if item == @head
    @tail = item.previous if item == @tail
    return item.object
  end

  # remove(i)
  # vrací odebranou hodnotu
  def delete_at(index)
    return remove_item(get_item(index))
  end

  # append(value)
  def <<(object)
    item = LinkedListItem.new(object, self)
    if @tail.nil?
      @head = @tail = item
    else
      @tail.next = item
      item.previous = @tail
      @tail = item
    end
    @length += 1
  end

  # prepend(value)
  def unshift(object)
    item = LinkedListItem.new(object, self)
    if @head.nil?
      @head = @tail = item
    else
      @head.previous = item
      item.next = @head
      @head = item
    end
    @length += 1
  end

end
