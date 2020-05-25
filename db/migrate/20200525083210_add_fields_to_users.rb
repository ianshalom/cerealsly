class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_pic, :text
    add_column :users, :about, :text
  end
end
