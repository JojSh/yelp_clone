require 'rails_helper'

feature 'reviewing' do
  before do
    user_sign_up
    add_restaurant
    # Restaurant.create name: 'KFC' }
  end

  scenario 'allows users to leave a review using a form' do
    review_restaurant

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  scenario 'users cannot leave additional reviews for same restaurant' do
    visit '/restaurants'
    review_restaurant
    expect(page).not_to have_link 'Review KFC'
  end

  # scenario 'signed in user can delete a review' do
  #   # visit '/restaurants'
  #   # user_sign_up
  #   # add_restaurant
  #   review_restaurant
  #   click_link('Delete KFC')
  #   expect(page).not_to have_content('so so')
  # end
end
