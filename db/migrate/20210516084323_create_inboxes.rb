class CreateInboxes < ActiveRecord::Migration[6.1]
  def change
    create_table :inboxes do |t|
      t.timestamps
    end
  end
end
