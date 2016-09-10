class Drinker < ApplicationRecord
  has_many :drinkings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # TODO: パスフレーズを受け取ってticketレコードを紐付ける処理を追加する
  def self.find_for_facebook_oauth(auth)
    drinker = Drinker.where(provider: auth.provider, uid: auth.uid).first

    unless drinker
      drinker = Drinker.create(name:     auth.extra.raw_info.name,
                               provider: auth.provider,
                               uid:      auth.uid,
                               email:    auth.info.email,
                               token:    auth.credentials.token,
                               password: Devise.friendly_token)
    end

    drinker
  end
end
