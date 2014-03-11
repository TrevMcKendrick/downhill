class ReferralCodesController < ApplicationController
  before_action :get_event_from_params, :only => [:create, :index]
  before_action :authenticate_user!
  before_action :find_referral_code, :only => [:edit, :update]

  def create
    @referral_code = @event.referral_codes.build(referral_code_params)
    @referral_code.save
    redirect_to referral_codes_path
  end

  def new
    @referral_code = ReferralCode.new
  end

  def index
    @referral_code = ReferralCode.new
    @referral_codes = @event.referral_codes
  end

  def edit
    @event = @referral_code.codeable
  end

  def update
    if @referral_code.update(referral_code_params)
      redirect_to :back
    else
      redirect_to root_url
    end
  end

  private 

  def referral_code_params
    params.require(:referral_code).permit(
      :name,
      :code,
      :discount_type,
      :amount
      )
  end

  def find_referral_code
    @referral_code = ReferralCode.find_by id: params[:id]
  end

end