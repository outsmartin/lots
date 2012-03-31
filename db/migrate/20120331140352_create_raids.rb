class CreateRaids < ActiveRecord::Migration
  def change
    create_table :raids do |t|
      t.string :name
      t.string :type
      t.integer :players
      t.datetime :time
      t.string :difficulty
      t.string :url
      t.integer :health

      t.timestamps
    end
  end
end
