require 'rails_helper'

RSpec.feature 'Manage View', type: :feature do
  scenario 'Manager can view all tickets with Edit and Delete links' do
    ticket1 = Ticket.create(name: 'John Doe', email: 'john@example.com', subject: 'Ticket 1', content: 'This is ticket 1')
    ticket2 = Ticket.create(name: 'Jane Doe', email: 'jane@example.com', subject: 'Ticket 2', content: 'This is ticket 2')

    visit manage_tickets_path

    expect(page).to have_content('Manage View')
    expect(page).to have_link('Edit', count: 2)
    expect(page).to have_link('Delete', count: 2)

    # Test Edit link functionality
    click_link 'Edit', match: :first
    expect(current_path).to eq(edit_ticket_path(ticket1))

    # Test Delete link functionality
    click_link 'Delete', match: :first
    expect(page).to have_content('Ticket deleted successfully') # Assuming a flash message is displayed after deletion
    expect(Ticket.count).to eq(1) # Assuming one ticket is deleted
  end
end
