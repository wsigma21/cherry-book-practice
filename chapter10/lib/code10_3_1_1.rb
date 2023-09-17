# frozen_string_literal: true

# Procクラスのインスタンス（Procオブジェクト）を作成する場合は、次のようにProc.newにブロックを渡す
# または、Kernelモジュールのprocメソッドを使う
hello_proc = proc do
  'Hello!'
end

hello_proc = proc { 'Hello!' }

# procオブジェクトを実行したい場合はcallを使う
puts hello_proc.call
