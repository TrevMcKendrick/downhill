class Event < ActiveRecord::Base
  has_many :user_events
  has_many :users, :through => :user_events

  has_many :tickets
  has_many :fees
end
