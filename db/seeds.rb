# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.find_or_create_by!(email: 'admin79@example.com') do |user|
  user.user_name = 'admin_user'
  user.role = 'Administrateur'  # Assurez-vous que le rôle est valide selon votre validation
  user.password = 'securepassword'  # Utilisez un mot de passe valide
  user.password_confirmation = 'securepassword'  # Confirmer le mot de passe
end
