class Participant < User

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
      where('first_name LIKE ?', "%#{search}%")
    else
      all
    end
  end

end