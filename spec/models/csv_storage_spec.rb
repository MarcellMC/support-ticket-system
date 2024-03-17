require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe '#save_to_csv' do
    it 'saves ticket details to CSV file' do
      ticket = Ticket.new(
        name: 'John Doe',
        email: 'john.doe@example.com',
        subject: 'Test Ticket',
        content: 'Test Content'
      )
      ticket.save_to_csv

      csv_data = CSV.read(Ticket::CSV_FILE_PATH, headers: true)
      expect(csv_data.length).to eq(1)
      expect(csv_data[0]['Name']).to eq('John Doe')
      expect(csv_data[0]['Email']).to eq('john.doe@example.com')
      expect(csv_data[0]['Subject']).to eq('Test Ticket')
      expect(csv_data[0]['Content']).to eq('Test Content')
    end
  end
end
