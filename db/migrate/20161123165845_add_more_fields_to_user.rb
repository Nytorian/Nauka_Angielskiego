class AddMoreFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :active, :boolean
    add_column :users, :hidden, :boolean
    add_column :users, :user_group, :int, default: 1
  end
end
