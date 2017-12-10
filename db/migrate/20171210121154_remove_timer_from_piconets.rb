class RemoveTimerFromPiconets < ActiveRecord::Migration[5.1]
  def change
    remove_column :piconets, :timer, :integer
  end
end
