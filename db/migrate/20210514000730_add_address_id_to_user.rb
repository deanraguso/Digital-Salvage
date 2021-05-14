class AddAddressIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :address_id, :integer
  end
end
