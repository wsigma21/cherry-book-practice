# frozen_string_literal: true

# Gate
class Gate
  # %iでシンボルの配列を作れる
  STATIONS = %i[umeda juso mikuni]
  FARES = [160, 190]

  # 駅の名前を受け取る
  def initialize(name)
    @name = name
  end

  def enter(ticket)
    # 渡された切符に自分の駅名を保存する
    ticket.stamp(@name)
  end

  # 渡された切符から運賃と乗車駅を取得する
  def exit(ticket)
    # 自分の駅名（@name）と乗車駅（enter_gate)から運賃を割り出す
    fare = calc_fare(ticket)
    # 切符の金額内に運賃が収まっているかどうか
    fare <= ticket.fare
  end

  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)
    distance = to - from
    FARES[distance - 1]
  end
end
