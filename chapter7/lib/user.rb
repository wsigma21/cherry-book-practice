# frozen_string_literal: true

# User
class User
  # アクセサメソッド（セッターとゲッター）
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.create_users(names)
    names.map do |name|
      User.new(name)
    end
  end

  def hello
    "Hello, I am #{@name}."
  end
end

user = User.new('Alice')
p user.name
p user.hello
# 名前を変更する
user.name = 'Bob'
p user.name
p user.hello

# クラスメソッドを使ってユーザーを作成
names = %w[Taro Jiro Hanako]
users = User.create_users(names)
users.each { |u| puts u.hello }
