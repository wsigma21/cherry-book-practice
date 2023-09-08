# frozen_string_literal: true

def fizz_buzz(num)
  # 自分で書いた
  # result = ''
  # if (num % 15).zero?
  #   result = 'Fizz Buzz'
  # elsif (num % 3).zero?
  #   result = 'Fizz'
  # elsif (num % 5).zero?
  #   result = 'Buzz'
  # else
  #   result = num
  # end
  # puts result

  # rubocopに指摘された書き方
  # result = if (num % 15).zero?
  #            'Fizz Buzz'
  #          elsif (num % 3).zero?
  #            'Fizz'
  #          elsif (num % 5).zero?
  #            'Buzz'
  #          else
  #            num
  #          end
  # puts result

  # 模範解答
  if (num % 15).zero?
    'Fizz Buzz'
  elsif (num % 3).zero?
    'Fizz'
  elsif (num % 5).zero?
    'Buzz'
  else
    # 文字列に変換する
    num.to_s
  end
end

puts fizz_buzz(1)
puts fizz_buzz(2)
puts fizz_buzz(3)
puts fizz_buzz(4)
puts fizz_buzz(5)
puts fizz_buzz(6)
puts fizz_buzz(15)
