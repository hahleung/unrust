class A
  def self.staticA
    puts "static method for A"
  end

  def instanceA
    puts "instance method for A"
  end

  def self.overriddable
    puts "From A with love"
  end
end

class B < A
  def self.overriddable
    puts "From B with love"
  end
end

puts B.staticA

b = B.new

puts b.instanceA

puts B.overriddable
