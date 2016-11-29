class AddPolymorphicToys < ActiveRecord::Migration
  def change
    add_column :toys, :toy_objects_id, :integer
    add_column :toys, :toy_objects_type, :string

    add_index :toys, [:toy_objects_type, :toy_objects_id]
  end
end
