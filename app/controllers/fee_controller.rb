class FeeController < ApplicationController
  before_action :authenticate_user!, :check_subdomain
  before_action :get_event_from_params, :only => [:create, :index]
  before_action :find_fee, :only => [:edit, :update]

  def create
    @fee = @event.fees.build(fee_params)

    respond_to do |format|
      if @fee.save
        format.js { render :js => "window.location.href = '#{fees_path}'" }
      else
        format.js
        format.html { render 'new' }
      end
    end
  end

  def new
    @fee = Fee.new
  end

  def index
    @fee = Fee.new
    @fees = @event.fees
  end

  def edit
    @event = @fee.event
  end

  def update
    if @fee.update(fee_params)
      redirect_to :back
    else
      redirect_to root_url
    end
  end

  private

  def find_fee
    @fee = Fee.find_by id: params[:id]
  end

  def fee_params
    params.require(:fee).permit(
      :name,
      :amount
      )
  end

end
