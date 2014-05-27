module SettingHelper
  # def stripe_set_up?
  #   current_user.stripe_user_id != nil && current_user.stripe_user_id != "" ? true : false
  # end

  def campaign_monitor_authorize_url
    authorize_url = CreateSend::CreateSend.authorize_url("100184", "http://localhost:3000/users/auth/email/callback", "ViewReports,ManageLists,CreateCampaigns,ImportSubscribers,SendCampaigns,ViewSubscribersInReports,ManageTemplates,AdministerPersons,AdministerAccount")
  end
end
