class ReferralCode < ActiveRecord::Base
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
    return self.affiliate_setting.discount_type if self.affiliate_code?
  end

  def discount_quantity
    return self.amount if self.promo_code?
    return self.affiliate_setting.amount if self.affiliate_code?
  end

  def self.valid?(code)
    ReferralCode.find_by code: code
  end

end