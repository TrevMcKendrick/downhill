class ReferralCode < ActiveRecord::Base
  belongs_to :codeable, polymorphic: true
  has_many :orders
  before_create :create_code

  def create_code
    self.code = SecureRandom.hex(4)
  end
end