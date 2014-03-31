class AffiliateSetting < ActiveRecord::Base
  belongs_to :event

  before_create :default_values

  def default_values
    self.discount_type = "flat_rate"
    self.reward_type = "both"
  end 
end