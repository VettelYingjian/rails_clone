class AddDescriptionToPets < ActiveRecord::Migration
  def change
    add_column :pets, :description, :text
    add_column :pets, :image, :string
    add_column :pets, :created_at, :datetime
    add_column :pets, :updated_at, :datetime
  end
end
