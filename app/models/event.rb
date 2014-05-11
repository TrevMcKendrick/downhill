class Event < ActiveRecord::Base
  validates :title, :presence => true
  # validates :date, :presence => true
  validates :time, :presence => true

  has_paper_trail
  
  before_create :defaults

  belongs_to :account
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

  def date=(string)
    val = Date.strptime(string, '%m/%d/%Y')
    write_attribute :date, val
  end

  def defaults
    self.affiliate_setting = AffiliateSetting.create
    self.path = self.title.parameterize
  end

  def user
    self.users.find_by type: "User"
  end

  def add_participant(participant, team, wave, signature, ticket)
    participant.teams << team if team
    wave.users << participant
    ticket.users << participant
    self.users << participant
    participant.assign_affiliate_code(self).save
    self.add_waiver_signature(signature, participant)
  end

   def add_waiver_signature(signature, participant)
    unless signature == ""
      user_event = self.user_events.find_by user_id: participant
      user_event.waiver_signature = signature
      user_event.save
    end
  end

  def fee_total
    self.fees.map(&:amount).inject(0, &:+)
  end

  def sales(start_day = nil, end_day = 1)
    if start_day.class == Fixnum && end_day.class == Fixnum
      orders = self.orders.where(created_at: (Time.now.midnight - start_day.day)..(Time.now.midnight - end_day.day + 86400) )
      sales = orders.collect { |order| order.amount }
    else
      sales = self.orders.collect { |order| order.amount }
    end
    sales.compact.sum
  end

  def code_is_valid?(string)
    self.valid_codes.any? { |code| code.code == string }
  end

  def valid_codes
    promo_codes = self.promo_codes.to_a
    affiliate_codes = self.affiliate_codes.to_a
    promo_codes + affiliate_codes
  end

end