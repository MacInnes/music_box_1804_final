require 'rails_helper'

describe Genre do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it {should have_many(:songs)}
    it {should have_many(:song_genres)}
  end

  describe 'methods' do
    it 'averages ratings of its songs' do
      genre = Genre.create(name: "Reggae")
      artist = Artist.create(name: "Bob Marley")
      song_1 = genre.songs.create(title: "One Love", length: 213, play_count: 3487, rating: 5, artist_id: artist.id)
      song_2 = genre.songs.create(title: "Redemption Song", length: 213, play_count: 3487, rating: 5, artist_id: artist.id)
      song_3 = genre.songs.create(title: "War", length: 213, play_count: 3487, rating: 2, artist_id: artist.id)

      expect(genre.average_rating).to eq(4)
    end
    it 'finds the song with the highest rating' do
      genre = Genre.create(name: "Reggae")
      artist = Artist.create(name: "Bob Marley")
      song_1 = genre.songs.create(title: "One Love", length: 213, play_count: 3487, rating: 5, artist_id: artist.id)
      song_2 = genre.songs.create(title: "Redemption Song", length: 213, play_count: 3487, rating: 3, artist_id: artist.id)
      song_3 = genre.songs.create(title: "War", length: 213, play_count: 3487, rating: 2, artist_id: artist.id)

      expect(genre.highest_rating).to eq(song_1)
    end
    it 'finds the song with the lowest rating' do
      genre = Genre.create(name: "Reggae")
      artist = Artist.create(name: "Bob Marley")
      song_1 = genre.songs.create(title: "One Love", length: 213, play_count: 3487, rating: 5, artist_id: artist.id)
      song_2 = genre.songs.create(title: "Redemption Song", length: 213, play_count: 3487, rating: 3, artist_id: artist.id)
      song_3 = genre.songs.create(title: "War", length: 213, play_count: 3487, rating: 2, artist_id: artist.id)

      expect(genre.lowest_rating).to eq(song_3)
    end
  end
end
