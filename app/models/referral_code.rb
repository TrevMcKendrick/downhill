class ReferralCode < ActiveRecord::Base
  belongs_to :codeable, polymorphic: true
  belongs_to :affiliate_setting
  has_many :orders

  before_create :create_code

  def create_code
    self.code = SecureRandom.hex(4)
  end

  def event_code?
    self.codeable_type == "Event" ? true : false
  end

  def user_code?
    self.codeable_type == "User" ? true : false
  end

  def discount_type
    return self.discount_type if self.event_code?
    return self.affiliate_setting.discount_type if self.user_code?
  end

  def discount_quantity
    return self.amount if self.event_code?
    return self.affiliate_setting.amount if self.user_code?
  end

  def total_discount(price_before_fees)
    return price_before_fees - discount_quantity if self.discount_type == "flat_rate"
    return price_before_fees * discount_quantity / 100 if self.discount_type == "percent"
  end

  def price_after_discount(price_before_fees)
    price_before_fees - total_discount(price_before_fees)
  end
end