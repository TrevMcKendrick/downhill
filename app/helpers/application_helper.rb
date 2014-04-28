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
    current_user.stripe_user_id != nil && current_user.stripe_user_id != "" ? true : false
  end

end
