class Event < ActiveRecord::Base

<<<<<<< HEAD
  before_create :assign_affiliate_setting
=======
  before_create :make_affiliate_setting
>>>>>>> c3ad34dae9994bfd1fdcf2ee562b67ac99b1d568

  has_many :user_events
  has_many :users, :through => :user_events

  has_many :tickets
  has_many :fees
  has_many :waves
  has_many :teams
<<<<<<< HEAD
  has_many :orders
  has_many :promo_codes
  has_many :affiliate_codes
=======

  has_many :referral_codes, :as => :codeable
>>>>>>> c3ad34dae9994bfd1fdcf2ee562b67ac99b1d568

  has_one :affiliate_setting

  def assign_affiliate_setting
    self.affiliate_setting = AffiliateSetting.new
  end

end