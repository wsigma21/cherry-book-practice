# frozen_string_literal: true

# 各単位の比率をハッシュの定数で定義、これを使って単位を変換する
UNITS = { m: 1.0, ft: 3.28, in: 39.37 }.freeze
# 6行目のfrom, toはシンボルではなくただのキーワード引数なので、関数内では「from」「to」で表される
def convert_length(length, from:, to:)
  # 変換雨の長さ　/ 変換前の単位の比率 * 変換後の単位の比率
  (length / UNITS[from] * UNITS[to]).round(2)
end
