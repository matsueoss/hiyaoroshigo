class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_drinker!
    session[:drinker_return_to] = env['PATH_INFO']
    redirect_to login_path unless drinker_signed_in?
  end
  
  def after_sign_out_path_for(resource)
    "/login"
  end
end
