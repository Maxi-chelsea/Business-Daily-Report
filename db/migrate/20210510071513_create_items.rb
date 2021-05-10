class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :facility_id
      t.integer :comment_id
      t.string :title
      t.boolean :genre
      t.integer :status
      t.text :content

      t.timestamps
    end
  end
end
