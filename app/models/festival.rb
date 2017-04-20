class Festival < ApplicationRecord
  has_many :drinkings
  has_many :restaurant_participations
  has_many :restaurants, through: :restaurant_participations
  has_many :sake_menu_items

  scope :current, lambda {
    today = Time.zone.today

    if Rails.env.production?
      where('start_at <= ? AND ? <= end_at', today, today)
    else
      where('? <= end_at', today)
    end
  }
  
  def started?
    Time.current >= start_at
  end
  
  def ended?
    Time.current >= end_at
  end
  
  def votable?
    started? && !ended?
  end

  def winner
    sake_id, = drinkings.limit(1).group(:sake_id).joins(:vote).
      order("sum_score DESC").sum(:score).first
    if sake_id
      Sake.find(sake_id)
    else
      nil
    end
  end
end
