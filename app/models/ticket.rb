##
# Support ticket model
class Ticket < ApplicationRecord
  validates :name, :email, :subject, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  enum status: [:new, :pending, :resolved]

  # Generate CSV file
  def self.to_csv
    attributes = %w{name email status subject content}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |ticket|
        csv << attributes.map { |attr| ticket.send(attr) }
      end
    end
  end
end
