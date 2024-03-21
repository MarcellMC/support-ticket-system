require 'rails_helper'

RSpec.describe 'tickets/edit.html.erb', type: :view do
  it 'renders the edit ticket form' do
    ticket = Ticket.new(name: 'John Doe', email: 'john@example.com', subject: 'Ticket 1', content: 'This is ticket 1')
    assign(:ticket, ticket)

    render

    expect(rendered).to have_selector('form[action=?][method=?]', ticket_path(ticket), 'post') do |form|
      expect(form).to have_selector('input[name=?][type=?]', 'ticket[name]', 'text')
      expect(form).to have_selector('input[name=?][type=?]', 'ticket[email]', 'text')
      expect(form).to have_selector('input[name=?][type=?]', 'ticket[subject]', 'text')
      expect(form).to have_selector('textarea[name=?]', 'ticket[content]')
      expect(form).to have_selector('input[type=?]', 'submit')
    end
  end
end
