class Event < ActiveRecord::Base

  before_create :make_affiliate_setting

  has_many :user_events
  has_many :users, :through => :user_events

  has_many :tickets
  has_many :fees
  has_many :waves

  has_many :referral_codes, :as => :codeable

  has_one :affiliate_setting

  has_many :orders

  def make_affiliate_setting
    affiliate_setting = AffiliateSetting.new
    self.affiliate_setting = affiliate_setting
  end

end