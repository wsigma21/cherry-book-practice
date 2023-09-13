require_relative './product'

# DVD
class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    # @name = name
    # @price = price
    # スーパークラスの同名メソッドで呼び出す
    super(name, price)
    # 引数の数が同じだったら更に省略できる
    # super
    @running_time = running_time
  end

  # Productクラスのメソッドのオーバーライド
  def to_s
    # "name: #{@name}, price: #{price}, running_time #{running_time}"
    # スーパークラスのto_sメソッドを呼び出す
    "#{super}, running_time: #{running_time}"
  end
end

dvd = DVD.new('A great movie', 2000, 120)
puts dvd.name
puts dvd.price
puts dvd.running_time
puts dvd
