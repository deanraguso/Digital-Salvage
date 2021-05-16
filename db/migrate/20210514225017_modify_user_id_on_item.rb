class ModifyUserIdOnItem < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :seller_id
    add_reference :items, :user, index: true
  end
end
