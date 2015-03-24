Rails.application.config.autoload_paths += [Rails.root.join('lib').to_s]

if Rails.env.development?
  Dotenv.load
end
