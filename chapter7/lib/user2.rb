# frozen_string_literal: true

# User
class User
  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  # 自分がother_userより重い場合はtrue
  def heavier_than?(other_user)
    other_user.weight < @weight
  end

  # protectedメソッドなので、同じクラスかサブクラスであればレシーバ付きで呼び出せる
  protected

  attr_reader :weight
end

alice = User.new('Alice', 50)
bob = User.new('Bob', 60)

puts alice.heavier_than?(bob)
puts bob.heavier_than?(alice)
# クラス外からは取得できない
puts alice.weight
