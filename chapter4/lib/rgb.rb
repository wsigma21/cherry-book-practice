# frozen_string_literal: true

# 本のサンプルコード

# 10進数to16進数
# 4, 60, 120 -> #043c78
# 3つの変数を受け取ってそれぞれを16進数に変換し、#を頭につけた文字列を返す
def to_hex(r, g, b)
  # hex = '#'
  # [r, g, b].each do |n|
  #   hex += n.to_s(16).rjust(2, '0')
  # end
  # hex
  # リファクタリング
  [r, g, b].sum('#') do |n|
    n.to_s(16).rjust(2, '0')
  end
end

# 16進数to10進数
# #043c78 -> [4, 60, 120]
# #をつけた文字列を受け取り、RGBそれぞれを10進数の整数にして配列で返す
def to_ints(hex)
  r = hex[1..2]
  g = hex[3..4]
  b = hex[5..6]
  # ints = []
  # [r, g, b].each do |n|
  #   ints << n.hex
  # end
  # ints

  # リファクタリング1
  # [r, g, b].map do |n|
  #   n.hex
  # end

  # リファクタリング2
  [r, g, b].map(&:hex)
end
