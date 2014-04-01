class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  before_create :defaults

  belongs_to :account
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_events
  has_many :events, :through => :user_events

  has_many :user_waves
  has_many :waves, :through => :user_waves

  has_many :user_tickets
  has_many :tickets, :through => :user_tickets

  has_many :user_teams
  has_many :teams, :through => :user_teams

  # validates_format_of :subdomain, with: /^[a-z0-9_]+$/, message: "must be lowercase alphanumerics only"
  validates_length_of :subdomain, maximum: 32, message: "exceeds maximum of 32 characters"
  validates_exclusion_of :subdomain, in: ['www', 'mail', 'ftp'], message: "is not available"

  #cancan roles
  ROLES = %w[admin moderator author banned]

  def participant?
    false
  end

  def defaults
    self.type = "User"
    self.account = Account.create
  end

  def subdomain=(val)
    write_attribute(:subdomain, val.delete(' '))
  end

end
