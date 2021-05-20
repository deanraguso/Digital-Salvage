class OrderIdColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :item_id
    remove_column :orders, :buyer_id
  end
end
