class ReferralCode < ActiveRecord::Base
<<<<<<< HEAD
  has_many :orders
  belongs_to :event

  def promo_code?
    self.type == "PromoCode" ? true : false
  end

  def affiliate_code?
    self.type == "AffiliateCode" ? true : false
  end

  def discount_version
    return self.discount_type if self.promo_code?
    return self.event.affiliate_setting.discount_type if self.affiliate_code?
  end

  def discount_quantity
    return self.amount if self.promo_code?
    return self.event.affiliate_setting.amount if self.affiliate_code?
  end

  def self.valid?(code)
    ReferralCode.find_by code: code
  end

=======
  belongs_to :codeable, polymorphic: true
  has_many :orders
>>>>>>> c3ad34dae9994bfd1fdcf2ee562b67ac99b1d568
end