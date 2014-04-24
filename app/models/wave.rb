class Wave < ActiveRecord::Base
  validates :title, :presence => true
  validates :quantity, :presence => true, :numericality => { only_integer: true, :message => "needs to be an integer" }
  validates :start_time, :presence => true

  belongs_to :event

  has_many :user_waves
  has_many :users, :through => :user_waves

  def select_name
    "#{self.title} - #{local_time(self.start_time)}"
  end

  def local_time(time)
    time.in_time_zone(self.event.timezone).to_s(:ordinal_time)
  end
end