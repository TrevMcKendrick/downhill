class Team < ActiveRecord::Base
  belongs_to :event

  has_many :user_teams
  has_many :users, :through => :user_teams
end