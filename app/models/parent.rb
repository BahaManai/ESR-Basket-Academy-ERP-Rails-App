class Parent < ApplicationRecord
  has_many :joueurs, dependent: :destroy
end
