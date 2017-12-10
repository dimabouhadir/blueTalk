class AddPiconetIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :piconet_id, :integer, :default => 0
  end
end
