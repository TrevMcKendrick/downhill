class Account < ActiveRecord::Base
  has_many :users
  has_many :events

  def participants
    participants = self.events.collect do |event|
      event.users.where(type: "Participant")
    end
    participants.flatten
  end

  def sales_chart_data(start = 1.months.ago, finish = Date.today)
    orders_by_day = self.sales_grouped_by_day(start)
    (start.to_date..finish).map do |date|
      {
        created_at: date,
        amount: orders_by_day[date].try(:first).try(:total_amount).try(:div, 100) || 0
      }
    end
  end

  def sales_grouped_by_day(start, events = self.events)
    orders = Order.where(event_id: events)
    orders = orders.where(created_at: start.beginning_of_day..Time.zone.now)
    orders = orders.group("date(created_at)")
    orders = orders.select("date(created_at) as created_at, sum(amount) as total_amount")
    orders = orders.group_by { |o| o.created_at.to_date }
  end
end