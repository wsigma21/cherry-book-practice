# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/gate'
require_relative '../lib/ticket'

# GateTest
class GateTest < Minitest::Test
  # Minitestではsetupメソッドを定義すると、テストメソッドの実行前に毎回呼ばれる
  def setup
    # 改札機オブジェクトの作成
    @umeda = Gate.new(:umeda)
    @juso = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)
  end

  def test_umeda_to_juso
    # 160円の切符を購入して梅田で乗車し、十三で出場する
    ticket = Ticket.new(160)
    @umeda.enter(ticket)
    # assertの戻り値はtrueになることを検証
    assert @juso.exit(ticket)
  end

  def test_umeda_to_mikuni_when_fare_is_not_enough
    ticket = Ticket.new(160)
    @umeda.enter(ticket)
    # refuteの後ろがfalseであればテストをパスする
    refute @mikuni.exit(ticket)
  end

  def test_umeda_to_mikuni_when_fare_is_enough
    ticket = Ticket.new(190)
    @umeda.enter(ticket)
    assert @mikuni.exit(ticket)
  end

  def test_juso_to_mikuni_when_fare_is_enough
    ticket = Ticket.new(160)
    @juso.enter(ticket)
    assert @mikuni.exit(ticket)
  end
end
