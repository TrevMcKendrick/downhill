class Wave < ActiveRecord::Base
  belongs_to :event

  has_many :user_waves
  has_many :users, :through => :user_waves
end
