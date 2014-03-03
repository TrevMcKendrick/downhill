class ParticipantsController < Devise::RegistrationsController
  before_action :set_url, :set_user, :set_event

  def create

    @participant = Participant.new(participant_params)

    @stripe_user = Participant.create_stripe_user(params[:stripeToken], @participant.email, @user.stripe_access_token)
    @participant.stripe_participant_id = @stripe_user.id

    @tickets_charge = @event.calculate_ticket_charge(params[:event])
    @fee = @event.number_of_paid_tickets_purchased_this_transaction(params[:event])

    Participant.create_charge(@participant.stripe_price(@tickets_charge), "usd", @stripe_user, @participant.email, @participant.stripe_price(@fee), @user.stripe_access_token)

    respond_to do |format|
      if @participant.save

        @event.users << @participant
        #COMMENTED OUT FOR TESTING
        # sign_in(@participant)
        # format.html { redirect_to profile_path, alert: 'You registered!' }
        #COMMENTED OUT FOR TESTING
        
        format.html { redirect_to "http://breanna.lvh.me:3000/test", alert: 'You registered!' }
      else
        format.html { render action: 'new' }
      end
    end

  end

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