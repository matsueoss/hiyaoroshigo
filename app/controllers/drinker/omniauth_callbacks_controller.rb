class Drinker::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # TODO:
    # request.env['omniauth.params']でパスフレーズを取得して、
    # ↓のfind_for_facebook_oauthに渡してその中で、
    # 紐づくticketレコードを生成してやれば良いかと
    @drinker = Drinker.find_for_facebook_oauth(request.env["omniauth.auth"])

    if @drinker.persisted?
      redirect_to "/restaurants/"
      sign_in @drinker
    else
     logger.debug("failed!!")
     # session["devise.facebook_data"] = request.env["omniauth.auth"]
     # redirect_to new_drinker_registration_url
    end
  end
end
