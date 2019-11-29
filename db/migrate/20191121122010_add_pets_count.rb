class AddPetsCount < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pets_count, :integer
  end
end
