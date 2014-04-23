class CustomersController < ApplicationController
  before_action :authenticate_user!

  def index
    @account_customers = current_user.account.participants
    logger.info "account_customers:#{@account_customers}"

    @all_customers = Participant.search(params[:search])
    logger.info "all_customers: #{@all_customers}"

    customers = @all_customers.collect do |customer|
      logger.info "customer: #{customer.first_name}"

      customer if @account_customers.include?(customer)
    end
    
    @customers = customers.compact.uniq

    @customers.each do |customer|
      logger.info "Customer name is: #{customer.name}"
    end
    
  end

  def show
    @customer = current_user.account.participants.find_by id: params[:id]
  end

end