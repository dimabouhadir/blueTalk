class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  #if only the unread messages:   append params unread = 1
  #if all received messages :   append params unread = 0
  #messages?src=&dest=&channel_id
  def index
    @source = User.find_by(:phone_number => params[:src])
    @destination = User.find_by(:phone_number => params[:dest])
    @channel = Channel.find_by(:id => params[:channel_id])

    @messages = Message.all     #TODO render only the messges  between source destination
    if params[:src]
      @messages = @messages.where(source: @source[:id])
    end
    if params[:dest]
      @messages = @messages.where(destination: @destination[:id])
    end
    # if params[:unread]
    #   # byebug
    #   @messages = @messages.where(received: params[:unread]== "0")
    # end
  end
  #/messages/forward?channel_id
  def forward
    @piconet = Piconet.find_by(:channel_id => params[:channel_id])
    @message= Message.where(:piconet_id => @piconet[:id])
    @message = @message.first
    @message[:to_from_master]=1
    @message.save

  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end
  #src destination channelid content
  def sendMessage
    @source = User.find_by(:phone_number => params[:src])
    @destination = User.find_by(:phone_number => params[:dest])
    @channel = Channel.find_by(:id => params[:channel_id])

    @message= Message.new(:received => false, :to_from_master => false, :source => @source[:id],:destination => @destination[:id], :content => params[:content], :piconet_id => @channel[:piconet_id])
    @message.save
  end
  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content, :source, :destination, :piconet_id, :received, :to_from_master)
    end
end
