class UserLoginField < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :login, :string
    add_index :users, :login, unique: true

    # Added by Trevor 2020 04 20
    add_column :users, :role, :string 

  end
end