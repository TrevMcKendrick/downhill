class Participant < User
  has_one :affiliate_code

  def password_required?
    false if Rails.env.development?
  end
  
  def participant?
    true
  end

  def assign_affiliate_code(event)
    event.referral_codes.build(:code => AffiliateCode.new, :participant => self, :type => "AffiliateCode")
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