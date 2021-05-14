class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.decimal :price
      t.string :condition
      t.text :description

      t.timestamps
    end
  end
end
