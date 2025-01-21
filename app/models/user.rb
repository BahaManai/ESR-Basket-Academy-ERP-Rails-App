class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :role, presence: true, inclusion: { in: [ "Administrateur", "Opérateur" ], message: "%{value} n'est pas un rôle valide" }
end
