class AddDamageAndTimeToAction < ActiveRecord::Migration
  def change
    add_column :actions, :expires, :datetime

    add_column :actions, :health_left, :decimal

    add_column :actions, :active, :boolean

  end
end
