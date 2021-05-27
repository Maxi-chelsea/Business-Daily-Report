class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.integer :daily_report_id
      t.integer :item_id
      t.integer :daily_report_comment_id
      t.integer :item_comment_id
      t.integer :message_id
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
    
    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
    add_index :notifications, :daily_report_id
    add_index :notifications, :item_id
    add_index :notifications, :daily_report_comment_id
    add_index :notifications, :item_comment_id
    add_index :notifications, :message_id
    
  end
end
