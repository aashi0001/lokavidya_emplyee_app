class Category < ApplicationRecord
  has_many :subcategories, dependent: :destroy
  has_many :videos
  belongs_to :video
  validates_presence_of :name
  validates_length_of :name,:minimum=>3
   validates :name, uniqueness: true
end
