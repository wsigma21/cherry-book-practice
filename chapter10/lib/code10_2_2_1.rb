# frozen_string_literal: true

# ブロックを引数として明示的に受け取る
# ブロックの引数名は自由につけられる
# ブロックの引数の数は1個まで

def greet(&block)
  puts 'おはよう'
  # ブロックに引数を渡して戻り値を受け取る
  text = block.call('こんにちは')
  puts text
end

# ブロック付きでgreetメソッドを呼び出す
greet do |text|
  # yieldで渡された引数に処理をして返す
  text * 2
end

# greet
