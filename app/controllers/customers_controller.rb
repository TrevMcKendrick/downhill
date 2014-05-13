class CustomersController < ApplicationController
  
  authorize_resource :class => false
  before_action :authenticate_user!, :check_subdomain


  def index
    @account_customers = current_user.account.participants
    @all_customers = Participant.search(params[:search])

    customers = @all_customers.collect do |customer|
      customer if @account_customers.include?(customer) unless @account_customers.nil?
    end
    
    @customers = customers.compact.uniq

    @customers.each do |customer|
      logger.info "Customer name is: #{customer.first_name}"
    end
    @customers
  end

  def show
    @customer = current_user.account.participants.find_by id: params[:id]
  end

end