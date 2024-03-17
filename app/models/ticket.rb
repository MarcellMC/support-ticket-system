require 'csv'

##
# Support ticket model
class Ticket < ApplicationRecord
  CSV_FILE_PATH = Rails.root.join('data', 'tickets.csv')

  validates :name, :email, :subject, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  enum ticket_status: [:new_ticket, :pending, :resolved]

  def save_to_csv(filepath: nil)
    filepath ||= CSV_FILE_PATH
    CSV.open(filepath, 'a+') do |csv|
      csv << [name, email, subject, content]
    end
  end
end
