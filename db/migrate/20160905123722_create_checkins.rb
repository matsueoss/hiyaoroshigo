class CreateCheckins < ActiveRecord::Migration[5.0]
  def change
    create_table :checkins do |t|
      t.references :drinker, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
