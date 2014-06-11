class Breakpoint < ActiveRecord::Base
  belongs_to :project
  has_many :pledges

  validates :pledge_title, :info, presence: true
  validates :pledge, numericality: { only_integer: true}
end
