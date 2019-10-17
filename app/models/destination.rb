class Destination < ApplicationRecord
# Blogger -< Post >- Destination
has_many :posts 
has_many :bloggers, through: :posts

end
