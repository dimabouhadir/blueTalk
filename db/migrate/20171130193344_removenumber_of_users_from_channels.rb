class RemovenumberOfUsersFromChannels < ActiveRecord::Migration[5.1]
  def change
      remove_column :channels, :number_of_users, :integer
    end
end
