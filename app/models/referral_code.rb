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
    return self.event.affiliate_setting.discount_type if self.affiliate_code?
  end

  def discount_quantity
    return self.amount if self.promo_code?
    return self.event.affiliate_setting.amount if self.affiliate_code?
  end

  def amount=(val)
    write_attribute :amount, (val.to_d * 100).to_i
  end

end