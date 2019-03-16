class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :introduce, :text
    add_column :users, :phone, :string
  end
end
