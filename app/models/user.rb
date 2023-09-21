class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]
  # validates :password_confirmation , presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  

  def name
    email.split("@").first.capitalize
  end

def self.from_omniauth(access_token)
  data = access_token.info
  user = User.find_or_initialize_by(email: data['email'])

  # Uncomment the section below if you want users to be created if they don't exist
  unless user.persisted?
    user.password = Devise.friendly_token[0, 20]
    # Skip confirmation for OmniAuth users
    user.skip_confirmation!
    user.save
  end

  user
end

end
