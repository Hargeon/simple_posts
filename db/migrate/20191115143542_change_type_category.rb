class ChangeTypeCategory < ActiveRecord::Migration[6.0]
  def up
    change_column :posts, :category, :datetime, using: "category::timestamp without time zone"
  end

  def down
    change_column :posts, :category, :string
  end
end
