module ApplicationHelper
  def login_bar
    if user_signed_in?
      logout_link
    else
      "#{login_facebook} | #{login_google}".html_safe
    end
  end

  def login_facebook
    link_to(t('login facebook'), 'auth/facebook')
  end

  def login_google
    link_to(t('login google'), 'auth/google_oauth2')
  end

  def logout_link
    link_to(t('logout'), logout_path)
  end
end
