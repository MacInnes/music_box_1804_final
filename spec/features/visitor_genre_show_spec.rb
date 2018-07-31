# User Story 6:
#
# As a Visitor,
#   When I visit a genre show page,
#     I see all songs associated with that genre listed on the page.
#
# Testing requirements:
# - I should see at least 2 songs listed for a genre
# - Also include 1 or more songs that are NOT associated with this genre and ensure
#   they do not appear on the page
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
  end
end
