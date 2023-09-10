# sample1
text = <<~TEXT
  名前：伊藤淳一
  電話：03-1234-5678
  住所：兵庫県西脇市板波町1-2-3
TEXT
text.scan(/\d\d-\d\d\d\d-\d\d\d\d/)
# => ["03-1234-5678"]

# sample2
text = <<~TEXT
  クープバゲットのパンは美味しかった。
  今日はクープ バゲットさんに行きました。
  クープ　バゲットのパンは最高。
  ジャムおじさんのパン、ジャムが入ってた。
  また行きたいです。クープ・バゲット。
  クープ・バケットのパン、売り切れだった（><）
TEXT

text.split(/\n/).grep(/クープ.?バ[ゲケ]ット/)

# sample3
# キャプチャされた文字列を「\1」で参照している
html = <<~HTML
  <select name="game_console">
  <option value="none"></option>
  <option value="wii_u" selected>Wii U</option>
  <option value="ps4">プレステ4</option>
  <option value="gb">ゲームボーイ</option>
  </select>
HTML

replaced = html.gsub(%r{<option value="(\w+)"(?: selected)?>(.*)</option>}, '\1,\2')

puts replaced

# sample4
text = <<~TEXT
  def hello(name)
    puts "Hello, \#{name}!"
  end

  hello('Alice')
  #{'     '}
  hello('Bob')
  #{'	'}
  hello('Carol')
TEXT

puts text.gsub(/^[ \t]+$/, '')
