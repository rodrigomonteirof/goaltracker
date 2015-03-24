Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOKAPP_ID'], ENV['FACEBOOKAPP_SECRET'], :scope => 'email'
end
