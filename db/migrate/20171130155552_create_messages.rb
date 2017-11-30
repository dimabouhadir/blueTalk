class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :source
      t.integer :destination
      t.integer :piconet_id
      t.boolean :received
      t.boolean :to_from_master

      t.timestamps
    end
  end
end
