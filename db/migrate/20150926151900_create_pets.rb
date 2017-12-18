class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :title
    end
  end
end
