require 'rails_helper'

  def user_sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testpass')
    fill_in('Password confirmation', with: 'testpass')
    click_button('Sign up')
  end

  def add_restaurant
    visit('/restaurants')
    click_link('Add a restaurant')
    fill_in('Name', with: 'KFC')
    click_button('Create Restaurant')
  end

  # def sign_in
  #   visit('/restaurants')
  #   fill_in('Email', with: 'test@example.com')
  #   fill_in('Password', with: 'testpass')
  #   click_button('Log in')
  # end

  def review_restaurant
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Submit review'
  end


  def alt_sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'second@example.com')
    fill_in('Password', with: 'password2')
    fill_in('Password confirmation', with: 'password2')
    click_button('Sign up')
  end
