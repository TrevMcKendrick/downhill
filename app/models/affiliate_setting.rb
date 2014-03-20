class AffiliateSetting < ActiveRecord::Base
  belongs_to :event
  has_many :referral_codes, :as => :codeable

  before_save :default_values

  private

  def default_values
    self.discount_type ||= "flat_rate"
    self.reward_type ||= "both"
    self.enabled ||= false
  end 
end