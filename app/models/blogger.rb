class Blogger < ApplicationRecord
# Blogger -< Post >- Destination
has_many :posts 
has_many :destinations, through: :posts

# validates :name, presence: true
validates :name, uniqueness: true 
validates :age, :numericality => { greater_than_or_equal_to: 0 }
validates(:bio, { :length => { :minimum => 30 } })


end
