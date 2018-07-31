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
