class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.integer :house_num, null: false
      t.string :street_name, null: false
      t.integer :kitten_id, null: false
      t.timestamps
    end
  end
end
