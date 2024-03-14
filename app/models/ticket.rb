class Ticket < ApplicationRecord
  validates :name, :email, :subject, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  enum status: [:new, :pending, :resolved]
end
