class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] =
        I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def facebook
    @user = User.create_from_provider_data(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] =
        I18n.t 'devise.omniauth_callbacks.success', kind: 'Facebook'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def github
    @user = User.create_from_provider_data(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] =
        I18n.t 'devise.omniauth_callbacks.success', kind: 'Github'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.github_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to new_user_session_path, alert: '無法獲得驗證！'
  end
end
