class CreateDemoAnomalies < ActiveRecord::Migration[6.1]
  def change
    create_table :demo_anomalies do |t|
      t.references :user, null:false, foreign_key: true
      t.integer :max
      t.integer :min
      t.datetime :abnormal_day
      t.string :anomaly_type
      t.timestamps
    end
  end
end
