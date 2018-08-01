require 'rails_helper'

describe SongGenre do
  describe 'validations' do
    it {should validate_presence_of(:song_id)}
    it {should validate_presence_of(:genre_id)}
  end
  describe 'relationships' do
    it {should belong_to(:song)}
    it {should belong_to(:genre)}
  end
end
