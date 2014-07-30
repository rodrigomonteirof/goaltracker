class UserMailerWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    UserMailer.confirm_email(user).deliver
  end
end
