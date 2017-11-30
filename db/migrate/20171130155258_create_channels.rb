class CreateChannels < ActiveRecord::Migration[5.1]
  def change
    create_table :channels do |t|
      t.string :name
      t.integer :number_of_users
      t.integer :piconet_id

      t.timestamps
    end
  end
end
