require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe '#save_to_csv' do
    let(:temp_csv_file) { 'temp_tickets.csv' }

    after(:each) do
      File.delete(temp_csv_file) if File.exist?(temp_csv_file) # Delete temporary CSV file after each test
    end

    it 'saves ticket details to CSV file' do
      ticket = Ticket.new(
        name: 'John Doe',
        email: 'john.doe@example.com',
        subject: 'Test Ticket',
        content: 'Test Content'
      )
      ticket.save_to_csv(filepath: temp_csv_file)

      last_line = `tail -n 1 #{Ticket::CSV_FILE_PATH}`
      parsed_row = CSV.parse_line(last_line)

      expect(parsed_row[0]).to eq('John Doe')
      expect(parsed_row[1]).to eq('john.doe@example.com')
      expect(parsed_row[2]).to eq('Test Ticket')
      expect(parsed_row[3]).to eq('Test Content')
    end
  end
end
