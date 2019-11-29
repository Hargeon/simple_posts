class DeleteParentId < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :parent_id
  end
end
