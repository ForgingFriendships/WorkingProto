class SessionsController < ApplicationController
  include SessionsHelper
  # user shouldn't have to be logged in before logging in!
  skip_before_filter :set_current_user, :block_page_if_not_signed_in, :block_page_if_not_admin

  def new
    #renders login form
  end

  def create
    #rails params.to_yaml
    auth = request.env["omniauth.auth"]
    if auth
      user = User.find_by_provider_and_uid(auth["provider"],auth["uid"]) ||
        User.create_with_omniauth(auth)
      log_in user, false # false refers to fact that is not first party login
      go_home
      flash_login
    else
      user = FirstPartyUser.find_by_email(params[:session][:email].downcase)
      if user.provider.nil? && user.authenticate(params[:session][:password].downcase)
        log_in user, true # true because this is a third party login
        go_home
        flash_login
      else
        flash[:notice] = "Could not log in!"
        render "new"
      end
    end
  end
  
  def destroy
    session.delete(:user)
    flash[:notice] = 'Logged out successfully.'
    redirect_to root_path
  end

end
