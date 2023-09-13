# Product
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # Objectクラスのメソッドのオーバーライド
  def to_s
    "name: #{@name}, price: #{price}"
  end
end

product = Product.new('A great movie', 1000)
puts product.name
puts product.price
puts product
