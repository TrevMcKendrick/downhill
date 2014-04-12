class Event < ActiveRecord::Base
  has_paper_trail
  
  before_create :defaults

  has_many :user_events
  has_many :users, :through => :user_events

  has_many :tickets
  has_many :fees
  has_many :waves
  has_many :teams
  has_many :orders
  has_many :promo_codes
  has_many :affiliate_codes

  has_one :affiliate_setting

  def defaults
    self.affiliate_setting = AffiliateSetting.create
  end

  def user
    self.users.find_by type: "User"
  end

end