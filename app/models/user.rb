class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :role, inclusion: { in: [ "Administrateur", "Opérateur" ], message: "%{value} n'est pas un rôle valide" }
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }, format: {
    with: /\A[a-zA-Z][a-zA-Z0-9_]*\z/,
    message: "ne peut contenir que des lettres, des chiffres et des underscores (_) et doit commencer par une lettre." }
end
