class Event < ActiveRecord::Base
  validates :title, :presence => true
  validates :date, :presence => true
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

end