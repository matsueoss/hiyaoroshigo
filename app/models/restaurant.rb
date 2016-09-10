class Restaurant < ApplicationRecord
  has_many :restaurant_participations
  has_many :festivals, through: :restaurant_participations
  has_many :sake_menu_items
  has_many :drinkings
  has_many :checkins
  has_many :tickets

  CONGESTION_DEGREES = [1, 2, 3]

  # 混雑度（1〜3）を返す。ランダムな値を返す仮実装。
  def congestion_degree
    CONGESTION_DEGREES.sample
  end
end
