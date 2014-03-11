class UserTicket < ActiveRecord::Base
  belongs_to :user
  belongs_to :ticket
  belongs_to :referral_code
end
