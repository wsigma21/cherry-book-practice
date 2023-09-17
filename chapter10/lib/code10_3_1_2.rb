# frozen_string_literal: true

def greet(&block)
  puts 'おはよう'
  text = block.call('こんにちは')
  puts text
end

# Procオブジェクトを作成し、それを引数としてブロックの代わりにgreetメソッドに渡す
repeat_proc = proc { |text| text * 2 }
greet(&repeat_proc)
