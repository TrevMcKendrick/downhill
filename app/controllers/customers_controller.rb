class CustomersController < ApplicationController
  before_action :authenticate_user!

  def index
    @account_customers = current_user.account.participants

    @all_customers = Participant.search(params[:search])
    
    customers = @all_customers.collect do |customer|
      customer if @account_customers.include?(customer)
    end
    @customers = customers.compact.uniq
  end

  def show
    @customer = current_user.account.participants.find_by id: params[:id]
  end

end