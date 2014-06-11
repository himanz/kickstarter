class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :projects_owned, class_name: "Project", foreign_key: 'owner_id'
  has_many :pledges
  has_many :breakpoints, through: :pledges
  has_many :projects, through: :pledges
  has_many :comments
 
  validates :name, :email, :password, :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :email, uniqueness: true
end
