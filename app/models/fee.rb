class Fee < ActiveRecord::Base
  validates :name, :presence => true
  validates :amount, :numericality => {:greater_than => 0, :message => "needs to be bigger than 0"}

  belongs_to :event
end
