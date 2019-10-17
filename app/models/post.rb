class Post < ApplicationRecord
# Blogger -< Post >- Destination
belongs_to :blogger
belongs_to :destination

end
