class Event < ActiveRecord::Base

  before_create :assign_affiliate_setting

  has_many :user_events
  has_many :users, :through => :user_events

  has_many :tickets
  has_many :fees
  has_many :waves
  has_many :teams
  has_many :orders
  has_many :referral_codes

  has_one :affiliate_setting

  def assign_affiliate_setting
    self.affiliate_setting = AffiliateSetting.new
  end

end