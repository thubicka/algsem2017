# -*- coding: utf-8 -*-
# implementace převodu na binární tvar ("pochopitelnější" verze)
class Fixnum
  def to_b
    value = self
    if value == 0
      result = "0"
    else
      bit_value = 1 << Math.log2(value).to_i
      result = ""
      while bit_value > 0 do
        if value >= bit_value
          result += "1"
          value -= bit_value
        else
          result += "0"
        end
        bit_value >>= 1
      end
    end
    return result
  end
end

# implementace převodu na binární tvar ("elegantnější" verze)
class Fixnum
  def to_b
    value = self
    if value == 0
      result = "0"
    else
      result = ""
      while value > 0 do
        result = (value & 1).to_s + result
        value >>= 1
      end
    end
    return result
  end
end

# implementace převodu na binární tvar ("magická", rekurzivní verze)
class Fixnum
  def to_b
    return ((self > 1) ? ((self >> 1).to_b) : "") + (self & 1).to_s
  end
end


class EightBitFormatter
  # vypíšeme hodnotu výrazu, z value použijeme pouze dolních 8 bitů
  def print_value(text, value)
    value = value & 255
    puts "#{text.ljust(8)}=#{value.to_s.rjust(4)} #{value.to_b.rjust(8, "0")}"
  end
end


f = EightBitFormatter.new

f.print_value("A", 46)
f.print_value("not A", ~46)

puts
f.print_value("A", 42)
f.print_value("B", 70)
f.print_value("A and B", 42 & 70)

puts
f.print_value("A", 42)
f.print_value("B", 70)
f.print_value("A or B", 42 | 70)

puts
f.print_value("A", 42)
f.print_value("B", 70)
f.print_value("A xor B", 42 ^ 70)

puts
f.print_value("A", 5)
f.print_value("A << 1", 5 << 1)

puts
f.print_value("A", 5)
f.print_value("A << 3", 5 << 3)

puts
f.print_value("A", 138)
f.print_value("A << 1", 138 << 1)

puts
f.print_value("A", 20)
f.print_value("A >> 1", 20 >> 1)

puts
f.print_value("A", 10)
f.print_value("A >> 2", 10 >> 2)

puts
f.print_value("A", 10)
f.print_value("B", 1 << 2)
f.print_value("A or B", 10 | (1 << 2))

puts
f.print_value("A", 10)
f.print_value("B", ~(1 << 1))
f.print_value("A and B", 10 & ~(1 << 1))

puts
f.print_value("A", 10)
f.print_value("B", 1 << 2)
f.print_value("A xor B", 10 ^ (1 << 2))
