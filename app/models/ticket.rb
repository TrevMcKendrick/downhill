class Ticket < ActiveRecord::Base
  belongs_to :event

  has_many :user_tickets
  has_many :users, :through => :user_tickets
end
