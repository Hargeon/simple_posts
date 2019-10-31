class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.boolean :active
      t.integer :like_id

      t.timestamps
    end
  end
end
