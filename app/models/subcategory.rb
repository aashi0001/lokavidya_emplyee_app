class Subcategory < ApplicationRecord
	belongs_to :category
	validates_presence_of :subcategory_name
  	validates_length_of :subcategory_name,:minimum=>5
end
