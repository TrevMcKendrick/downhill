class Account < ActiveRecord::Base
  has_many :users
  has_many :events

  def participants
    # self.users.collect{|f| f.events.collect{|b| b.users.where(type:"Participant")}}.flatten.uniq

    participants = self.events.collect do |event|
      event.users.where(type: "Participant")
    end
    participants.first
  end
end