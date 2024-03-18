require 'rails_helper'

RSpec.feature 'Create Ticket View', js: true do
  scenario 'displays a form to create a new ticket' do
    visit new_ticket_path

    expect(page).to have_selector('form')
    expect(page).to have_field('Name')
    expect(page).to have_field('Email')
    expect(page).to have_field('Subject')
    expect(page).to have_field('Content')
    expect(page).to have_button('Create Ticket')
  end
end

