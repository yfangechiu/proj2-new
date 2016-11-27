class Review < ActiveRecord::Base
	belongs_to :pet

	validates :rating, presence: true
end
