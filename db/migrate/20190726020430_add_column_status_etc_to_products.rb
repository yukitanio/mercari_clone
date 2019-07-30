class AddColumnStatusEtcToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :status, :integer, default: 0
    add_column :products, :content, :text
    add_column :products, :transaction_status, :integer, default: 0
  end
end
