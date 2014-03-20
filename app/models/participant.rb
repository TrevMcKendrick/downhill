class Participant < User
  has_one :referral_code, :as => :codeable
  before_create :make_affiliate_code
  after_create :set_affiliate_type_and_amount

  def password_required?
    false if Rails.env.development?
  end

  def participant?
    true
  end

  def make_affiliate_code
    self.referral_code = ReferralCode.new
  end

  def set_affiliate_type_and_amount
    binding.pry
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

  def add_waiver_signature(waiver_signature, event)
    user_event = event.user_events.find_by user_id: self
    user_event.waiver_signature = waiver_signature
    user_event.save
  end

end