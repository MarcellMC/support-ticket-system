require 'rails_helper'

RSpec.feature 'Manage View', type: :feature do
  scenario 'Manager can view all tickets' do
    ticket1 = Ticket.create(name: 'John Doe', email: 'john@example.com', subject: 'Ticket 1', content: 'This is ticket 1')
    ticket2 = Ticket.create(name: 'Jane Doe', email: 'jane@example.com', subject: 'Ticket 2', content: 'This is ticket 2')

    visit manage_tickets_path

    expect(page).to have_content('Manage View')
    expect(page).to have_content(ticket1.name)
    expect(page).to have_content(ticket2.name)
  end
end
