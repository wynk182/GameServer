class AddTokenToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :token, :string
    add_column :users, :name, :string
    add_column :users, :win, :integer
    add_column :users, :loses, :integer
    add_column :users, :gold, :integer
  end
end
