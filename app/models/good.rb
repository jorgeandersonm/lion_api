class Good < ApplicationRecord

	belongs_to :individual

	validates_presence_of :individual_id, :name, :value, :category

	validates_numericality_of :value, greater_than_or_equal_to: 0
end
