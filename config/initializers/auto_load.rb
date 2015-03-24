Rails.application.config.autoload_paths += [Rails.root.join('lib')]

if Rails.env.development?
  Dotenv.load
end
