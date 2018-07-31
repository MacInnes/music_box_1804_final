# User Story 1:
#
# As a Visitor,
#   When I visit a song show page,
#     I see the numeric rating for this song
#
# Testing requirements:
# - rating should be an integer attribute (from 1 to 5)

require 'rails_helper'

describe 'Visitor' do
  describe 'visits song show page' do
    it 'sees the rating for this song' do
      artist = Artist.create(name: "Bieber")
      song = artist.songs.create!(title: "fsdlkj", length: 243, play_count: 32, rating: 3)

      visit song_path(song)

      expect(page).to have_content("Rating: #{song.rating}")
    end
  end
end
