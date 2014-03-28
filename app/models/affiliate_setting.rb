class AffiliateSetting < ActiveRecord::Base
<<<<<<< HEAD
=======
  before_create :default_values
  
>>>>>>> c3ad34dae9994bfd1fdcf2ee562b67ac99b1d568
  belongs_to :event
  has_many :referral_codes, :as => :codeable

  before_create :default_values

  private

  def default_values
    self.discount_type = "flat_rate"
    self.reward_type = "both"
    self.enabled = false
  end 
end