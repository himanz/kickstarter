class Pledge < ActiveRecord::Base
	belongs_to :project
	belongs_to :breakpoint
end
