module ApplicationHelper
  def login_bar
    if user_signed_in?
      logout_link
    else
      login_facebook
    end
  end

  def login_facebook
    link_to(t('facebook'), 'auth/facebook')
  end

  def logout_link
    link_to(t('logout'), logout_path)
  end
end
