class ReferralCode < ActiveRecord::Base
  belongs_to :codeable, polymorphic: true
  has_many :user_tickets
end