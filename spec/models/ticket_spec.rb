require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      ticket = Ticket.new(
        name: 'John Doe',
        email: 'john.doe@example.com',
        subject: 'Test Subject',
        content: 'Test Content',
        ticket_status: :new_ticket
      )
      expect(ticket).to be_valid
    end

    it 'is not valid without a name' do
      ticket = Ticket.new(
        email: 'john.doe@example.com',
        subject: 'Test Subject',
        content: 'Test Content',
        ticket_status: :new_ticket
      )
      expect(ticket).not_to be_valid
    end

    it 'is not valid without an email' do
      ticket = Ticket.new(
        name: 'John Doe',
        subject: 'Test Subject',
        content: 'Test Content',
        ticket_status: :new_ticket
      )
      expect(ticket).not_to be_valid
    end

    it 'is not valid without a subject' do
      ticket = Ticket.new(
        name: 'John Doe',
        email: 'john.doe@example.com',
        content: 'Test Content',
        ticket_status: :new_ticket
      )
      expect(ticket).not_to be_valid
    end
  end

  context 'enums' do
    it 'defines ticket_status enum' do
      expect(Ticket.ticket_statuses.keys).to eq(['new_ticket', 'pending', 'resolved'])
    end
  end
end
