json.extract! invite, :id, :user_to, :user_from, :game_id, :created_at, :updated_at
json.url invite_url(invite, format: :json)
