json.extract! user, :id, :Name, :email, :mot_de_passe, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
