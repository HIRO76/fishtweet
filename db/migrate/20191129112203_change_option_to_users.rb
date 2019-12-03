class ChangeOptionToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :password, :string, null: true
  end
end
