# frozen_string_literal: true

module Effects
  def self.reverse
    lambda do |words|
      words.split(' ').map(&:reverse).join(' ')
    end
  end

  def self.echo(rate)
    lambda do |words|
      # スペースならそのまま返す
      # スペース以外ならその文字を指定された回数繰り返す
      words.each_char.map { |c| c == ' ' ? c : c * rate }.join
    end
  end

  def self.loud(level)
    lambda do |words|
      words.split(' ').map { |word| word.upcase + '!' * level }.join(' ')
    end
  end
end
