class RemoveKittenIdFromHouses < ActiveRecord::Migration
  def change
    remove_column :houses, :kitten_id, :integer
  end
end
