# User
class User
  def initialize(name)
    @name = name
  end

  # ゲッターメソッド
  # @nameを外部から参照するためのメソッド
  def name
    @name
  end

  # セッターメソッド
  # @nameを外部から変更するためのメソッド
  # =で終わるメソッドを定義すると、変数に代入するような形式でそのメソッドを呼び出せる
  def name=(value)
    @name = value
  end
end

user = User.new('Alice')
# 変数に代入しているのではなく、name=メソッドを呼び出している
user.name = 'Bob'
puts user.name