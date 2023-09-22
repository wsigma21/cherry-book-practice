# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/gate'
require_relative '../lib/ticket'

# GateTest
class GateTest < Minitest::Test
  # テストメソッドを実行するとき必ずsetupが呼ばれる
  def setup
    # オブジェクトを各インスタンス変数に代入しておく
    @umeda = Gate.new(:umeda)
    @juso = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)
  end

  def test_gate
    ticket = Ticket.new(160)
    @umeda.enter(ticket)
    # juso.exit(ticket)
    assert @juso.exit(ticket)
  end

  def test_umeda_to_mikuni_when_fare_is_not_enough
    ticket = Ticket.new(160)
    @umeda.enter(ticket)
    # mikuni.exit(ticket)
    refute @mikuni.exit(ticket)
  end

  def test_umeda_to_mikuni
    ticket = Ticket.new(190)
    @umeda.enter(ticket)
    # mikuni.exit(ticket)
    assert @mikuni.exit(ticket)
  end

  def test_juso_to_mikuni
    ticket = Ticket.new(160)
    @juso.enter(ticket)
    # mikuni.exit(ticket)
    assert @mikuni.exit(ticket)
  end
end