class Project < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	has_many :breakpoints
	has_many :pledges
	has_many :users, :through => :pledges
	has_many :comments
	accepts_nested_attributes_for :breakpoints, reject_if: :all_blank, allow_destroy: true

	validates :title, :description, :category, :start_date, :end_date, presence: true
	validates :goal, numericality: { only_integer: true }

	def current_funding
		total = 0 		
		breakpoints.each do |breakpoint|
			total += breakpoint.pledge * breakpoint.pledges.count  
		end
		total
	end

	
	def percent_funded
		total = (current_funding.to_f/goal)*100
		if total >= 100
			total = 100
		end
		total
	end

	def number_of_pledges
		pledges.count
	end



end