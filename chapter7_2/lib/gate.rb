# frozen_string_literal: true

# Gate
class Gate
  FARES = {
    :umeda => {
      :juso => 160,
      :mikuni => 190
    },
    :juso => {
      :mikuni => 160
    }
  }

  # 駅の名前を受け取ってインスタンス変数として格納する
  def initialize(name)
    @name = name
  end

  # 入場するメソッド
  def enter(ticket)
    ticket.stamp(@name)
  end

  # 出場するメソッド
  def exit(ticket)
    # 乗車駅名を取得
    start_st = ticket.stamped_at
    # print("start_st=", start_st)
    end_st = @name
    # print(" end_st=", end_st)
    fare = FARES[start_st][end_st]
    # print(" FARES=", FARES)
    # fare = FARES[:umeda][:juso]
    # print(ticket.fare)
    # print(fare)
    (ticket.fare - fare) >= 0
  end
end