class Drinker::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # TODO:
    # request.env['omniauth.params']でパスフレーズを取得して、
    # ↓のfind_for_facebook_oauthに渡してその中で、
    # 紐づくticketレコードを生成してやれば良いかと
    @drinker = Drinker.find_for_facebook_oauth(request.env["omniauth.auth"],request.env['omniauth.params'])

    if @drinker[:status] && @drinker[:drinker].persisted?
      redirect_by_checkin_status
      sign_in @drinker[:drinker]
    else
      redirect_to login_path, alert: @drinker[:error]
    end
  end

  private

  def redirect_by_checkin_status
    if @drinker[:first]
      redirect_to drinkers_edit_path
    elsif @drinker[:drinker].checked_in?
      restaurant_id = @drinker[:drinker].checked_in_restaurant_id
      redirect_to restaurant_path(restaurant_id)
    else
      redirect_to new_checkin_path
    end
  end
end
