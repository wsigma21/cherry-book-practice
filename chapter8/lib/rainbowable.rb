# frozen_string_literal: true

# Rainbowable
# さらにリファクタリング
module Rainbowable
  def rainbow
    # 1.to_sメソッドを使って自分自身の文字列を取得する
    # str = to_s

    # ループカウンタと、色をつけた文字を順に格納する配列を用意
    # count = 0
    # colored_chars = []

    # 2.取得した文字列を1文字ずつループ処理する
    to_s.each_char.map.with_index do |char, count|
      color = 31 + count % 6
      # 3.各文字の手前にANSIエスケープシーケンスを付与する
      # 4.各文字を返血して1つの文字列にする
      # 5.最後に文字色をリセットするための\e[0mを付与する
      "\e[#{color}m#{char}"
      # mapメソッドの戻り値を直接joinする
    end.join + "\e[0m"
  end
end
