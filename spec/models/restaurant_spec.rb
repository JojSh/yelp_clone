require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { is_expected.to have_many :reviews }

  describe 'deleting a parent restaurant' do

    # before do
    #   Restaurant.create(name: 'restaurant')
    # end
    #
    # it 'also deletes child reviews' do
    #   puts "puts @restaurant:  #{@restaurant.first}"
    # end
  end
end
