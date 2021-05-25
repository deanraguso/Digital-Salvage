class DestroyUnneededJoinTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :inboxes_messages
  end
end
