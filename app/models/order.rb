class Order < ActiveRecord::Base
  has_many :user_tickets
  belongs_to :referral_code
end
