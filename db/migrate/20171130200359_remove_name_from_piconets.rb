class RemoveNameFromPiconets < ActiveRecord::Migration[5.1]
  def change
      remove_column :piconets, :name, :string
    end
end
