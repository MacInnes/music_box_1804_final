# User Story 8:
#
# As a Visitor,
#   When I visit a genre show page,
#     I see the average rating for all songs in this genre
#
# Testing requirements:
# - I should add at least 2 songs for this genre
# - Also include 1 or more songs NOT associated with this genre to ensure these
#   other songs are not included in the average rating
require 'rails_helper'

describe 'Visitor' do
  describe 'visits genre show page' do
    it 'sees all songs associated with that genre' do
      genre = Genre.create(name: "Reggae")
      other_genre = Genre.create(name: "fskj")
      artist = Artist.create(name: "Bob Marley")
      song_1 = genre.songs.create(title: "One Love", length: 213, play_count: 3487, rating: 4, artist_id: artist.id)
      song_2 = genre.songs.create(title: "Redemption Song", length: 213, play_count: 3487, rating: 4, artist_id: artist.id)
      song_3 = genre.songs.create(title: "War", length: 213, play_count: 3487, rating: 4, artist_id: artist.id)
      other_song = other_genre.songs.create(title: "sdflkj", length: 324, play_count: 3478, rating: 1, artist_id: artist.id)

      visit genre_path(genre)

      expect(page).to have_content("Title: #{song_1.title}")
      expect(page).to have_content("Title: #{song_2.title}")
      expect(page).to have_content("Title: #{song_3.title}")
      expect(page).to_not have_content("Title: #{other_song.title}")
    end
    it 'sees the average rating for all songs in this genre' do
      genre = Genre.create(name: "Reggae")
      other_genre = Genre.create(name: "fskj")
      artist = Artist.create(name: "Bob Marley")
      song_1 = genre.songs.create(title: "One Love", length: 213, play_count: 3487, rating: 4, artist_id: artist.id)
      song_2 = genre.songs.create(title: "Redemption Song", length: 213, play_count: 3487, rating: 4, artist_id: artist.id)
      song_3 = genre.songs.create(title: "War", length: 213, play_count: 3487, rating: 1, artist_id: artist.id)
      other_song = other_genre.songs.create(title: "sdflkj", length: 324, play_count: 3478, rating: 5, artist_id: artist.id)

      visit genre_path(genre)

      expect(page).to have_content("Average rating: 3")
    end
  end
end
