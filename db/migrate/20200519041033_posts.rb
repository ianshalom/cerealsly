class Posts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.text :img_url
      t.timestamps
    end
  end
end