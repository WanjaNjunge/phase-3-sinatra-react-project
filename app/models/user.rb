class user ActiveRecord ::Base
    has_many :albums
    has_many :songs, through: :albums
end