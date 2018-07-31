require 'rails_helper'

describe 'Visitor' do
  describe 'visits song show page' do
    it 'sees the rating for this song' do
      artist = Artist.create(name: "Bieber")
      song = artist.songs.create!(title: "fsdlkj", length: 243, play_count: 32, rating: 3)

      visit song_path(song)

      expect(page).to have_content("Rating: #{song.rating}")
    end
    it 'sees all genres associated with this song' do
      artist = Artist.create(name: "dsfkj")
      song = artist.songs.create(title: "sdfkjh", length: 324, play_count: 324, rating: 2, artist_id: artist.id)
      genre_1 = song.genres.create(name: "fskjdhf")
      genre_2 = song.genres.create(name: "fskjdfskj")

      other_song = artist.songs.create(title: "ssdfklja", length: 324, play_count: 324, rating: 2, artist_id: artist.id)
      other_genre = other_song.genres.create(name: "fdskj")

      visit song_path(song)

      expect(page).to have_content("Genres:")
      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
      expect(page).to_not have_content(other_genre.name)

    end
  end
end
