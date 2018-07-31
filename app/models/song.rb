class Song < ApplicationRecord
  validates_presence_of :title, :length, :play_count, :rating
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  before_save :generate_slug


  def to_param
    slug
  end

  def generate_slug
    self.slug = title.parameterize
  end
end
