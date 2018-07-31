# User Story 5:
#
# As a Visitor,
#   When I visit the genre index page,
#     I cannot see the form to create new genres,
#       And I do not have access to any routes that could create a genre.
#     And each genre's name should be a link to that genre's show page.
#
# Testing requirements:
# - I should see at least 2 genres listed
# - All users of the web site see the genres' names as links

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
    it 'cannot see the form, and cannot create a new song, each name should be a link to a show page' do
      genre_1 = Genre.create!(name: "Rock")
      genre_2 = Genre.create!(name: "Blues")
      genre_3 = Genre.create!(name: "Hip Hop")

      visit genres_path

      expect(page).to_not have_content("Create a new Genre:")
      expect(page).to have_link(genre_1.name)
      expect(page).to have_link(genre_2.name)
      expect(page).to have_link(genre_3.name)
    end
  end
end
