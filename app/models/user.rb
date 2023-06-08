class User < ActiveRecord::Base
    has_many :albums
    has_many :songs, through: :albums
end