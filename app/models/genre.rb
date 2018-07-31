class Genre < ApplicationRecord
  validates_presence_of :name
  has_many :song_genres
  has_many :songs, through: :song_genres

  def average_rating
    songs.average(:rating)
  end

  def highest_rating
    songs.order('rating DESC').first
  end

  def lowest_rating
    songs.order(:rating).first
  end
end
