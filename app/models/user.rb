class User < ApplicationRecord
  has_many :user_games
  has_many :games, through: :user_games
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def to_json
    {user_token: self.token, user_name: self.name, wins: self.wins, loses: self.loses}
  end

  def renew_token
    self.token = SecureRandom.urlsafe_base64(8, false)
    self.save
  end
end
