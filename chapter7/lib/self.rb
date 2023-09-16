# frozen_string_literal: true

# クラス定義内に登場するselfは、場所によって
# そのクラスのインスタンス自身を表したり、そのクラス自身を表す
class Foo
  # このputsはクラス定義の読み込み時のみに呼び出される
  puts "クラス構文の直下のself: #{self}"

  def self.bar
    puts "クラスメソッド内のself: #{self}"
  end

  def baz
    puts "インスタンスメソッド内のself: #{self}"
  end
end
# クラス構文の直下のself: Foo # クラス自身
puts Foo.bar # クラスメソッド内のself: Foo # クラス自身

foo = Foo.new
foo.baz # インスタンスメソッド内のself: #<Foo:0x0000000100b494b0> # クラスのインスタンス自身
