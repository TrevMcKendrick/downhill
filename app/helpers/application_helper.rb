module ApplicationHelper
  def format_time(time)
      time.strftime("%l:%M %P")
  end
end
