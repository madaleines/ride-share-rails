class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.date :date
      t.float :price
      t.integer :rating

      t.timestamps
    end
  end
end