json.extract! game, :id, :user_id, :token, :finished, :created_at, :updated_at
json.url game_url(game, format: :json)
