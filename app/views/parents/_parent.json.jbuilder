json.extract! parent, :id, :nom, :prénom, :téléphone, :created_at, :updated_at
json.url parent_url(parent, format: :json)
