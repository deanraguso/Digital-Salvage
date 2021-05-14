class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :state
      t.int :postal_code
      t.string :street_address
      t.string :premise
      t.string :sub_premise

      t.timestamps
    end
  end
end
