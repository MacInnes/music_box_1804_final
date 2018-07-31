require 'rails_helper'

describe 'Admin' do
  describe 'visits genre index' do
    it 'sees a list of genres as well as a form for a new genre' do
      admin = User.create(username: "MacInnes", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      genre_1 = Genre.create!(name: "Rock")
      genre_2 = Genre.create!(name: "Blues")
      genre_3 = Genre.create!(name: "Hip Hop")

      visit genres_path

      expect(page).to have_content(genre_1.name)
      expect(page).to have_content(genre_2.name)
      expect(page).to have_content(genre_3.name)
      expect(page).to have_content("Create a new Genre:")
      expect(page).to have_button("Create Genre")
    end
    it 'can fill out a form to add a new genre' do
      admin = User.create(username: "MacInnes", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      genre_1 = Genre.create!(name: "Rock")
      genre_2 = Genre.create!(name: "Blues")
      genre_3 = Genre.create!(name: "Hip Hop")

      visit genres_path

      fill_in :genre_name, with: "Jazz"
      click_button "Create Genre"

      expect(current_path).to eq(genres_path)
      expect(page).to have_content("Jazz")
    end
  end
end