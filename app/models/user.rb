class User < ActiveRecord::Base
  has_many :goals

  def self.find_or_create(auth)
    user = find_or_create_by(provider: auth.provider, uid: auth.uid)

    user.assign_attributes(
      name: auth.info.name,
      email: auth.info.email,
      photo_url: auth.info.image,
      access_token: auth.credentials.token
    )

    user.save!
    user
  end

  def assign_session(session)
    session[:user_id] = id
  end

  def destroy_session(session)
    session[:user_id] = nil
  end
end
