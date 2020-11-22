# frozen_string_literal: true

require 'rails_helper'

feature 'Creating a list' do
  let!(:user) {create(:user)}
  before(:each) {
    login_as(user, :scope => :user)
  }
  scenario 'redirects to the tasks index page on success' do
    visit lists_path
    click_on 'Create New List'
    expect(page).to have_content('Create a list')

    fill_in 'Title', with: 'Test my list'
    click_button 'Save'

    expect(page).to have_content('Lists')
    expect(page).to have_content('Test my list')
  end

  scenario 'displays an error when no name is provided' do
    visit new_list_path
    fill_in 'Title', with: ''
    click_button 'Save'

    expect(page).to have_content("Title can't be blank")
  end
end
