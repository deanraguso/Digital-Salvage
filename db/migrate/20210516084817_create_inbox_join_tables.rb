class CreateInboxJoinTables < ActiveRecord::Migration[6.1]
  def change
    create_join_table :inboxes, :users do |t|
      t.index :inbox_id
      t.index :user_id
    end
    create_join_table :inboxes, :messages do |t|
      t.index :inbox_id
      t.index :message_id
    end
  end
end
