class DropPolymorphicToys < ActiveRecord::Migration
  def change
    remove_column :toys, :toy_objects_id
    remove_column :toys, :toy_objects_type
  end
end
