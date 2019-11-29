class AddCategories < ActiveRecord::Migration[6.0]
  def up
    add_column :posts, :category, :string
  end

  def down
    remove_column :posts, :category
  end
end
