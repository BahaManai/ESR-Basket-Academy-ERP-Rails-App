json.extract! joueur, :id, :nom, :prénom, :sexe, :date_naissance, :note, :created_at, :updated_at
json.url joueur_url(joueur, format: :json)
