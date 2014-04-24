class PromoCode < ReferralCode
  validates :description, :presence => true
  validates :code, :presence => true, format: { without: /\s/, :message => "can't have blank spaces" }
  validates :amount, :presence => true, :numericality => { only_integer: true, :message => "needs to be an integer" }
end