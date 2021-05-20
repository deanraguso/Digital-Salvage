class AddIdColumnsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :user, index: true
    add_reference :orders, :item, index: true
  end
end
