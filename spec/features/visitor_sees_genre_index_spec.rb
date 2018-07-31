# User Story 2:
#
# As a Visitor,
#   When I visit the genre index page,
#     I see all genres in the database.
#
# Testing requirements:
# - users should see at least 2 genres listed on the page

require 'rails_helper'

describe 'Visitor' do
  describe 'visits genre index' do
    it 'sees a list of all genres in the database' do
      genre_1 = Genre.create!(name: "Rock")
      genre_2 = Genre.create!(name: "Blues")
      genre_3 = Genre.create!(name: "Hip Hop")

      visit genres_path

      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
      expect(page).to have_content(genre_3.name)
    end
  end
end
