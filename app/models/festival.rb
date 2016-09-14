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
end
