class AddDetailsToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :part_type, :string
    add_column :items, :image, :string
  end
end
