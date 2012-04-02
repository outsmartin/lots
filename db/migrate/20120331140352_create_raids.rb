class CreateRaids < ActiveRecord::Migration
  def change
    create_table :raids do |t|
      t.string :name
      t.integer :players
      t.datetime :time
      t.string :urlname
      t.integer :difficulty
      t.integer :health

      t.timestamps
    end
  end
end
