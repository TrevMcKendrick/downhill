class AffiliateCode < ReferralCode
  belongs_to :participant

  before_create :defaults

  def defaults
    create_code
    self.discount_type = flat_rate
  end

  def create_code
    self.code = SecureRandom.hex(3)
  end

end