class RemovenumberOfUsersFromChannels < ActiveRecord::Migration[5.1]
  def change
      remove_column :Channels, :number_of_users, :integer
    end
end
