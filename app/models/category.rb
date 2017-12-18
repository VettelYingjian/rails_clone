class Category < ActiveRecord::Base
  has_many :pet_categories
  has_many :pets, through: :pet_categories
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
end