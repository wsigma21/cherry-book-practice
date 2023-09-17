# frozen_string_literal: true

def greet
  puts 'おはよう'
  # ブロックの有無を確認してからブロックの処理を呼び出す
  yield if block_given?
  puts 'こんばんは'
end

# ブロック付きでgreetメソッドを呼び出す
greet do
  puts 'こんにちは'
end

greet
