class AddSupabaseIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :supabase_id, :string
  end
end
