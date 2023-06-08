class Song < ActiveRecord::Base
    has_many :albums
    has_many :user, through: :albums
end
