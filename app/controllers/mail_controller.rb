class MailController < ApplicationController
  before_action :set_mail, only: [:show, :edit, :update, :destroy]

   include HistoriesHelper
   include MailHelper

  # GET /mail
  # GET /mail.json
  def index
    is_logged_in
    @mail = Mail.all
  end

  # GET /mail/1
  # GET /mail/1.json
  def show
  end

  # GET /mail/new
  def new
    @mail = Mail.new
    @location = Location.all
    @price = Price.last
    @connections = Connection.all
  end

  # GET /mail/1/edit
  def edit

    @mail = Mail.find(params[:id])
    @route = Route.find(@mail.route)
    if !@route.nil?
      puts "made it this far" + @mail.current_location.to_s + @mail.to.to_s
      @mail_locations = get_locations_from_route(@mail.current_location, @mail.to, @route)

      @mail_locations.each do |magic|
        puts "*****\n\n\n The moment of --------------------------- Truth ******* \n\n\n\n" + magic.to_s
      end
end
  end

  # POST /mail
  # POST /mail.json
  def create


    @mail = Mail.new(mail_params)
    @mail.current_location = @mail.from
    route_id, @mail.cost = find_best_route_and_cost(@mail)

    if !route_id.nil?

      @route = Route.find(route_id)

      @mail.price = get_mail_price(@mail)

      @route.mails.push(@mail)

    end
    
    puts "*****\n\n\n The moment of Truth ******* \n\n\n\n" + @mail.cost.to_s
    puts mail_params

    respond_to do |format|
      if !(@mail.cost.nil?) && @mail.save
         # add an row to the history table that a mail has been added
        set_history(@mail, HISTORY_EVENT_CREATED)
        format.html { redirect_to @mail, notice: 'Mail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mail }
      else
        format.html { render action: 'new' }
        format.json { render json: @mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mail/1
  # PATCH/PUT /mail/1.json
  def update
    respond_to do |format|

      if @mail.update(mail_params)
        if @mail.current_location = @mail.to
           @mail.receive_date = DateTime.now
        end

        # if the mail hasn't been delievered
        if(@mail.receive_date.nil?)
          # then set the event history to be an update on that mails position
          set_history(@mail, HISTORY_EVENT_UPDATED)
        else

          # but if it has arrived then make a history event reflecting this
          set_history(@mail, HISTORY_EVENT_MAIL_DELIVERED)
        end
        @mail.save
        format.html { redirect_to @mail, notice: 'Mail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mail/1
  # DELETE /mail/1.json
  def destroy
    @mail.destroy
    respond_to do |format|
      format.html { redirect_to mail_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail
      @mail = Mail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_params
      params.require(:mail).permit(:sender,:receiver ,:to, :from, :weight, :volume, :priority, :send_date, :receive_date, :max_delivery_date, :cost, :current_location)
    end
end
