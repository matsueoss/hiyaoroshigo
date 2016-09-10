class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenricate_drinker!
    session[:drinker_return_to] = env['PATH_INFO']
    redirect_to drinker_facebook_omniauth_authorize_path unless drinker_signed_in?
  end
end
