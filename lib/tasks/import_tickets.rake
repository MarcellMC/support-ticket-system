namespace :import do
  desc "Import tickets from CSV file"
  task tickets: :environment do
    require 'csv'

    CSV.foreach('tickets.csv', headers: true) do |row|
      Ticket.create!(row.to_hash)
    end
  end
end
