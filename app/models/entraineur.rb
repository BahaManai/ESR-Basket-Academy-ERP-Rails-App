class Entraineur < ApplicationRecord
  has_many :salaires, dependent: :destroy
end
