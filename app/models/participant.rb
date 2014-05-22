class Participant < User
  validates :first_name, :presence => true
  validates :email, :presence => true
  validates :phone, :presence => true
  validates :shirtsize, :presence => true
  validates :gender, :presence => true
  
  has_one :affiliate_code
  has_many :orders

  before_create :defaults

  def password_required?
    false if Rails.env.development?
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

  def defaults
    self.type = "Participant"
  end

  def self.search(search)
    if search
      participant_table = self.arel_table
      where(participant_table[:first_name].matches("%#{search}%"))
    else
      scoped
    end
  end

  def affiliate_orders(account)
    account.orders.where(referral_code_id: self.affiliate_code)
  end

  def affiliate_orders_revenue(account)
    self.affiliate_orders(account).map(&:amount).compact.inject(0, &:+)
  end

  def affiliate_earnings(account)
    self.affiliate_orders(account).map(&:affiliate_fee).compact.inject(0, &:+)
  end

end