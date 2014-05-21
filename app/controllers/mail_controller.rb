class MailController < ApplicationController
  before_action :set_mail, only: [:show, :edit, :update, :destroy]

   include HistoriesHelper

  # GET /mail
  # GET /mail.json
  def index
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
  end

  # POST /mail
  # POST /mail.json
  def create
    @mail = Mail.new(mail_params)

    respond_to do |format|
      if @mail.save
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
        # if the mail hasn't been delievered
        if(@mail[:receive_date].nil?)
          # then set the event history to be an update on that mails position
          set_history(@mail, HISTORY_EVENT_UPDATED)
        else
          # but if it has arrived then make a history event reflecting this
          set_history(@mail, HISTORY_EVENT_MAIL_DELIVERED)
        end
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
      params.require(:mail).permit(:to, :from, :weight, :volume, :priority, :send_date, :receive_date, :max_delivery_date, :cost, :current_location)
    end
end
