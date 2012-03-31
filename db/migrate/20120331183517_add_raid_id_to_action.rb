class AddRaidIdToAction < ActiveRecord::Migration
  def change
    add_column :actions, :raid_id, :integer

  end
end
