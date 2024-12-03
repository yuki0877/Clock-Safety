class CreateDemoSleeps < ActiveRecord::Migration[6.1]
  def change
    create_table :demo_sleeps do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :sleep_time
      t.integer :sleep_score
      t.date :action_date
      t.timestamps
    end
  end
end
