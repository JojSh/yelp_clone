require 'rails_helper'

feature 'reviewing' do
  before do
    user_sign_up
    add_restaurant
    # Restaurant.create name: 'KFC' }
  end

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Submit review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  scenario 'users cannot leave additional reviews for same restaurant' do
    visit '/restaurants'
    expect(page).not_to have_link 'Review KFC'
  end
end
