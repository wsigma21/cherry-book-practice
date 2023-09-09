# frozen_string_literal: true

# テストコード
require 'minitest/autorun'
require_relative '../lib/convert_length'

# convert_lenth.rbのテスト
class ConvertLengthTest < Minitest::Test
  def test_convert_length
    # assert_equal 39.37, convert_length(1, 'm', 'in')
    # assert_equal 0.38, convert_length(15, 'in', 'm')
    # assert_equal 10_670.73, convert_length(35_000, 'ft', 'm')
    # 長さの単位をシンボルで渡す
    assert_equal 39.37, convert_length(1, from: :m, to: :in)
    assert_equal 0.38, convert_length(15, from: :in, to: :m)
    assert_equal 10_670.73, convert_length(35_000, from: :ft, to: :m)
  end
end
