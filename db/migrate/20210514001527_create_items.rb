class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.decimal :price
      t.string :condition
      t.text :description
      t.integer :seller_id

      t.timestamps
    end
  end
end
