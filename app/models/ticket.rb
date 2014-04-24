class Ticket < ActiveRecord::Base
  validates :ticket_type, :presence => true
  validates :quantity, :presence => true, :numericality => { only_integer: true, :message => "needs to be an integer"  }
  validates :price, :numericality => {:greater_than => 0, :message => "needs to be bigger than 0"}

  belongs_to :event

  has_many :user_tickets
  has_many :users, :through => :user_tickets

  def free?
    self.price == 0
  end
  
end