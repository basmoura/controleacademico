class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    sign_in_and_redirect @user, :event => :authentication
    set_flash_message(:success, :success, :kind => "Facebook") if is_navigational_format?
  end
end
