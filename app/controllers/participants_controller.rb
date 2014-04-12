  class ParticipantsController < Devise::RegistrationsController
  before_action :set_url, :set_user, :set_event

  # def create
  #   @participant = Participant.new(participant_params)

  #   @wave = Wave.find_by id: params[:wave].to_i

  #   @ticket = Ticket.find_by id: params[:ticket].to_i

  #   @stripe_user = Participant.create_stripe_user(params[:stripeToken], @participant.email, @user.stripe_access_token)
  #   @participant.stripe_participant_id = @stripe_user.id

  #   Participant.create_charge(@participant.stripe_price(@ticket.price), "usd", @stripe_user, @participant.email, @participant.stripe_price(TICKET_SCIENCE_FEE), @user.stripe_access_token)

  #   respond_to do |format|
  #     if @participant.save

  #       @event.users << @participant
  #       @participant.waves << @wave
  #       @participant.tickets << @ticket
  #       #COMMENTED OUT FOR TESTING
  #       # sign_in(@participant)
  #       # format.html { redirect_to profile_path, alert: 'You registered!' }
  #       #COMMENTED OUT FOR TESTING
        
  #       format.html { redirect_to "http://#{subdomain(@url)}.#{DOMAIN_NAME}/#{@event.path}", alert: 'You registered!' }
  #     else
  #       format.html { render action: 'new' }
  #     end
  #   end

  # end

  private
  
  def set_url
    @url = request.referer
  end

  def set_user
    @user = User.find_by subdomain: subdomain(@url)
  end

  def set_event
    events = @user.events
    @event = events.where(:path => path(@url)).first
  end
 
  def participant_params
    params.require(:participant).permit(:email, :password)
  end
end