class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, unique: true
      t.string :provider
      t.string :access_token
      t.string :refresh_token
      t.datetime :expires_in
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
