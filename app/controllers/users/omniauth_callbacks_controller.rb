class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.find_for_google_oauth2(request.env['omniauth.auth'].except('extra'))

    if @user.persisted?
      flash[:notice] = 'Google認証に成功しました。'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except('extra')
      redirect_to new_user_registration_url, alert: 'Google認証に失敗しました'
    end
  end
end
