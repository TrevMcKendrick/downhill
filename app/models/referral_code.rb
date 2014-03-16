class ReferralCode < ActiveRecord::Base
  belongs_to :codeable, polymorphic: true
  has_many :user_tickets

  has_many :orders
end