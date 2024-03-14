class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :content
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
