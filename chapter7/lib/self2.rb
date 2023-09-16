# frozen_string_literal: true

# インスタンスメソッド内部からクラスメソッドを呼び出す
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # 金額を整形するクラスメソッド
  def self.format_price(price)
    "#{price}円"
  end

  def to_s
    formatted_price = Product.format_price(price)
    "name: #{name}, price: #{formatted_price}"
  end
end

product = Product.new('A great movie', 1000)
pp product.to_s
