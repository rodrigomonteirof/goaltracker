module ApplicationHelper
  def login_bar
    if user_signed_in?
      link_to(t('logout'), '/logout')
    else
      raw "#{link_to(t('login'), 'login')} | #{link_to(t('sign_up'), 'users/new')}"
    end
  end
end
