class AddNumberOfUsersToPiconets < ActiveRecord::Migration[5.1]
  def change
    add_column :piconets, :number_of_users, :integer
  end
end
