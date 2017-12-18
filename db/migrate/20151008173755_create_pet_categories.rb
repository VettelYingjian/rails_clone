class CreatePetCategories < ActiveRecord::Migration
  def change
    create_table :pet_categories do |t|
      t.integer :pet_id
      t.integer :category_id
    end
  end
end
