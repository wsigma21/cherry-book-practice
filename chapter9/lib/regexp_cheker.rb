# frozen_string_literal: true

print 'Text?: '
# chompを使って空白を削除
text = gets.chomp
# puts text

# 例外処理を組み込んで再入力可能にする
begin
  # retry時はパターンの入力から行う
  print 'Pattern?: '
  pattern = gets.chomp
  # puts pattern
  re = Regexp.new(pattern)
rescue RegexpError => e
  puts "Invalid pattern: #{e.message}"
  retry
end

# result = re.match(text)
# scanを使うとマッチする部分を配列で返してくれる
matches = text.scan(re)
if matches.size.positive?
  puts "Matches: #{matches.join(', ')}"
else
  puts 'Nothing matched.'
end
