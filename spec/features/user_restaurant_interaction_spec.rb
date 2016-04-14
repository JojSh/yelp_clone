require 'rails_helper'

feature 'User to restaurant interaction:' do

  context 'user is not yet signed in:' do

    it "should not see an 'add a restaurant' link" do
      visit('/')
      click_link 'Add a restaurant'
      expect(page).not_to have_button('Create Restaurant')
    end
  end

  context 'user is signed in, viewing restaurants:' do
    it 'should not to be able to edit/delete restaurants created by others' do
      visit('/')
      user_sign_up
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'Hawksmoor'
      click_button 'Create Restaurant'
      expect(page).to have_content 'Hawksmoor'
      click_link 'Sign out'
      alt_sign_up
      expect(page).to have_content 'Hawksmoor'
      expect(page).not_to have_content('Delete Hawksmoor')
      expect(page).not_to have_content('Edit Hawksmoor')
    end
  end
end
