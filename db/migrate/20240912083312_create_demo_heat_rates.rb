class CreateDemoHeatRates < ActiveRecord::Migration[6.1]
  def change
    create_table :demo_heat_rates do |t|
      t.references :user, null:false, foreign_key: true
      t.integer :avg_heart_rate
      t.integer :max_heart_rate
      t.integer :min_heart_rate
      t.date :action_date
      t.timestamps
    end
  end
end
