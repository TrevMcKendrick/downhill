class PromoCodesController < ApplicationController
  before_action :authenticate_user!, :check_subdomain
  before_action :get_event_from_params, :only => [:create, :index]
  before_action :find_promo_code, :only => [:edit, :update]

  def create
    @promo_code = @event.promo_codes.build(promo_code_params)

    respond_to do |format|
      if @promo_code.save
        format.js { render :js => "window.location.href = '#{promo_codes_path}'" }
      else
        format.js
        format.html { render 'new' }
      end
    end
  end

  def new
    @promo_code = ReferralCode.new
  end

  def index
    @promo_code = PromoCode.new
    @promo_codes = @event.promo_codes
  end

  def edit
    @event = @promo_code.event
  end

  def update
    if @promo_code.update(promo_code_params)
      redirect_to :back
    else
      redirect_to root_url
    end
  end

  private 

  def promo_code_params
    params.require(:promo_code).permit(
      :description,
      :code,
      :discount_type,
      :amount,
      :quantity,
      :published
      )
  end

  def find_promo_code
    @promo_code = ReferralCode.find_by id: params[:id]
  end

end