require 'rails_helper'

RSpec.describe 'tickets/index.html.erb', type: :view do
  it 'displays a list of tickets' do
    assign(:tickets, [Ticket.new(subject: 'Test Ticket 1', ticket_status: 'new_ticket'), Ticket.new(subject: 'Test Ticket 2', ticket_status: 'pending')])
    render
    
    expect(rendered).to match /Test Ticket 1/
    expect(rendered).to match /Test Ticket 2/
  end

  it 'displays a "New Ticket" link' do
    render

    expect(rendered).to have_link('New Ticket', href: new_ticket_path)
  end
end
