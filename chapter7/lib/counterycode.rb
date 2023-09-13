class CountryCode
  attr_reader :code

  def initialize(code)
    @code = code
  end

  def eql?(other)
    # otherがCountryCodeかつ、同じ国コードなら同じキーと見なす
    other.instance_of?(CountryCode) && code.eql?(other.code)
  end

  def hash
    # CountryCodeオブジェクトのハッシュ値として国コードのハッシュ値を返す
    code.hash
  end
end

japan = CountryCode.new('JP')
us = CountryCode.new('US')
india = CountryCode.new('IN')

# ハッシュを作り直す
currencies = { japan => 'yen', us => 'dollar', india => 'rupee' }

# 同じ国コードなら同じキーと見なされる！
key = CountryCode.new('JP')
puts currencies[key]   #=> "yen"
puts currencies[japan] #=> "yen"
puts japan
puts key
puts key.eql?(japan)
