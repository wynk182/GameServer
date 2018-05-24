class Game < ApplicationRecord
  has_many :user_games, dependent: :destroy
  has_many :users, through: :user_games
  has_many :invites, dependent: :destroy

  after_create :create_token

  def create_token
      self.token = SecureRandom.urlsafe_base64(8, false)
      self.save
  end

  def to_json
    {
      "my_characters":[],
      "enemy_characters":[],
      "my_items":[],
      "enemy_items":[],
      "game_board":[],
      "last_action": self.updated_at,
      "turns": self.turn
    }
  end

  def end_turn
    self.turn += 1
    self.save
  end

end
