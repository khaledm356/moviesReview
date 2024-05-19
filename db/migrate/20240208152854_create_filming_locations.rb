class CreateFilmingLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :filming_locations do |t|
      t.references :location, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
