class CreatePiconets < ActiveRecord::Migration[5.1]
  def change
    create_table :piconets do |t|
      t.integer :channel_id
      t.integer :master_id
      t.integer :timer
      t.string :name

      t.timestamps
    end
  end
end
