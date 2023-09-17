# frozen_string_literal: true

def greet
  puts 'おはよう'
  # ブロックに引数を渡して戻り値を受け取る
  text = yield 'こんにちは'
  puts text
end

# ブロック付きでgreetメソッドを呼び出す
greet do |text|
  # yieldで渡された引数に処理をして返す
  text * 2
end

# greet
