require 'rails_helper'

describe Genre do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it {should have_many(:songs)}
  end
end
