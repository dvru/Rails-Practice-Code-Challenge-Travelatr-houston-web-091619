class Blogger < ApplicationRecord
# Blogger -< Post >- Destination
has_many :posts 
has_many :destinations, through: :posts

validates :name, presence: true
validates :name, uniqueness: true

end
