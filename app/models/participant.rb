class Participant < User
<<<<<<< HEAD
  has_one :affiliate_code

  def password_required?
    false if Rails.env.development?
=======

  has_one :referral_code, :as => :codeable
  has_one :shirt
  before_create :make_affiliate_code


  def password_required?
    false
>>>>>>> c3ad34dae9994bfd1fdcf2ee562b67ac99b1d568
  end
  
  def participant?
    true
  end

  def assign_affiliate_code(event)
    event.affiliate_codes.build(:code => AffiliateCode.new, :participant => self)
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