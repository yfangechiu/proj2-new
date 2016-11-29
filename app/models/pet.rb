class Pet < ActiveRecord::Base
	belongs_to :User
	has_many :requests
	has_one :review
	validates :name, :presence =>{:message=>"Please enter the name of your pet."}
	validates :animal_type, :presence =>{:message=>"Please select an animal type, or choose 'other' if your animal type is not listed "}
	validates :start_date, :presence =>{:message=>"The start date can't be blank"}
	validates :start_time, :presence =>{:message=>"The start time can't be blank"}
	#validates :start_time, presence: true
	#NS add back in start_time validation when calendar is set up!
	validates :duration, :presence =>{:message=>"The duration field can't be blank"}
	validates :address, :presence =>{:message=>"The address field can't be blank"}

	default_scope { order('name ASC') }
end
