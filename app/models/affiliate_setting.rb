class AffiliateSetting < ActiveRecord::Base
  before_save :default_values
  
  belongs_to :event


  private

  def default_values
    self.discount_type ||= "flat_rate"
    self.reward_type ||= "both"
    self.enabled ||= false
  end 
end