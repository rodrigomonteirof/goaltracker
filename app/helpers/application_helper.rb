module ApplicationHelper
  def login_bar
    if user_signed_in?
      logout_link
    else
      raw "#{login_link} | #{signup_link}"
    end
  end

  def login_link
    link_to(t('login'), login_path)
  end

  def signup_link
    link_to(t('sign_up'), new_user_path)
  end

  def logout_link
    link_to(t('logout'), logout_path)
  end
end
