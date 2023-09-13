# frozen_string_literal: true

# Ticket
class Ticket
  # 外部から取得できるようゲッターメソッドを追加
  attr_reader :fare, :stamped_at

  # 切符の購入金額を設定
  def initialize(fare)
    @fare = fare
  end

  # 駅名をインスタンスに保存する
  def stamp(name)
    # @stamped_atとすると"乗車した"駅であることがわかりやすい
    @stamped_at = name
  end

  # 以下はゲッターで行う
  # 保存されている駅名を返す
  # def stamped_at
  #   @gate_name
  # end
end
