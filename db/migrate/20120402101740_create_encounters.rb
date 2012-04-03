class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string :url
      t.integer :raid_id
      t.decimal :health, :default => 100
      t.datetime :started_at

      t.timestamps
    end
  end
end
