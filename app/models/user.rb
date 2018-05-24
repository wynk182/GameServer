class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def to_json
    {token: self.token, name: self.name, win: self.wins, loses: self.loses}
  end

  def renew_token
    self.token = SecureRandom.urlsafe_base64(8, false)
    self.save
  end

end
