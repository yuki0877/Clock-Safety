class CreateEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :user_mails do |t|
      t.integer :user_id, null: false
      t.integer :anomalies_id, null: false
      t.string :message, null: false
      t.datetime :sent_at
      t.timestamps
    end
  end
end
