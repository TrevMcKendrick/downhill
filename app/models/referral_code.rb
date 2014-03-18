class ReferralCode < ActiveRecord::Base
  belongs_to :codeable, polymorphic: true
  has_many :orders

  def has_code?
    self.code != nil
  end

  def self.is_valid?(code, event)
    
  end
end