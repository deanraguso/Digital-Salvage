class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :item_id
      t.integer :buyer_id
      t.integer :status

      t.timestamps
    end
  end
end
