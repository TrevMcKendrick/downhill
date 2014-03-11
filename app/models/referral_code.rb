class ReferralCode < ActiveRecord::Base
  belongs_to :codeable, polymorphic: true
  has_many :user_tickets

  def create_code_string
    self.code = SecureRandom.hex(4)
  end
end