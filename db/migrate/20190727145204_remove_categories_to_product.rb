class RemoveCategoriesToProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :categories, :integer, :string
  end
end
