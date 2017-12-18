class PetCategory < ActiveRecord::Base
  belongs_to :pet
  belongs_to :category
end
