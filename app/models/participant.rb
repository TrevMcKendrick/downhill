class Participant < User
  has_one :referral_code, :as => :codeable
  before_create :make_affiliate_code

  def password_required?
    false
  end

  def participant?
    true
  end

  def make_affiliate_code
    referral_code = ReferralCode.new
    referral_code.code = SecureRandom.hex(4)
    self.referral_code = referral_code
  end

  def active_for_authentication?
    true
  end

  def self.create_stripe_user(stripe_token, description, user_access_token)
    customer = Stripe::Customer.create(
      {
      :card => stripe_token,
      :description => description 
      },
      user_access_token
    )
  end

end