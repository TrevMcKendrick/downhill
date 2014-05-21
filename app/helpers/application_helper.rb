module ApplicationHelper
  def format_time(time)
      time.strftime("%l:%M %P")
  end

  def tab_active?(match_path)
    if last_path(request.path) == match_path
      "active"
    else
      ""
    end
  end

  def last_path(url)
      url.split('/').last
  end

  def stripe_set_up?
    current_user.stripe_user_id.present? && current_user.stripe_user_id.present? ? true : false
  end

  def stripe_to_display(amount)
    (amount / 100.000).to_s
  end

end