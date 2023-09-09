# frozen_string_literal: true

# 4.8.1
fruits = %w[apple orange melon]
fruits.each_with_index { |fruit, i| puts "#{i}: #{fruit}" }

# 4.8.2
fruits = %w[apple orange melon]
# 配列が返ってくる
p(fruits.map.with_index { |fruit, i| "#{i}: #{fruit}" })

# 4.8.5
# 配列の要素が_1で引数が_2
p %w[japan us italy].map { _1 } # ["japan", "us", "italy"]
p %w[japan us italy].map.with_index { _2 } # [0, 1, 2]
p %w[japan us italy].map.with_index { [_2, _1] } # [[0, "japan"], [1, "us"], [2, "italy"]]
