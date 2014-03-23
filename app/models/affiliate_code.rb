class AffiliateCode < ReferralCode
  belongs_to :participant

  before_create :create_code

  def create_code
    self.code = SecureRandom.hex(4)
  end

end