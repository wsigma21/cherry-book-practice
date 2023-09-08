# frozen_string_literal: true

# 回答を見る前に取り組んだ

# 10進数to16進数
# 4, 60, 120 -> #043c78
# 3つの変数を受け取ってそれぞれを16進数に変換し、#を頭につけた文字列を返す
def to_hex(num1, num2, num3)
  nums = [num1, num2, num3]
  convert_nums = '#'
  nums.each do |n|
    n = n.to_s(16).rjust(2, '0')
    convert_nums += n
  end
  convert_nums
end

# 16進数to10進数
# #043c78 -> [4, 60, 120]
# #をつけた文字列を受け取り、RGBそれぞれを10進数の整数にして配列で返す
def to_ints(num)
  # シャープを削除
  nums = [num[1..2], num[3..4], num[5..6]]
  convert_nums = []
  nums.each do |n|
    n = n.to_i(16)
    convert_nums << n
  end
  convert_nums
end

print to_hex(0, 0, 0)
print to_hex(4, 60, 120)
print to_hex(255, 255, 255)
print to_ints('#ffffff')
print to_ints('#043c78')
