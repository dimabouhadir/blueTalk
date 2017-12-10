class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

  # GET /channels
  # GET /channels.json
  #IT SHOWS ONLY AVAILABLE CHANNELS where piconet = 0
  def index
  # @channels = Channel.includes(:piconet).all
  @channels = Channel.all
  render json: @channels, include: [:piconet]
    #.where(:piconets => {number_of_users: 0}).all


#     @channels = Channel.all.map do |u|
#      { :name => u.name, :number_of_users => u.piconet_id==1?Piconet.find(params[u.piconet_id])[:number_of_users]:0, :id =>u.id, :piconet_id => 0, :created_at => "0", :updated_at => "0"}
# end
  #  @channels = Channel.where(piconet_id: 0)
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
  end

  #GET /channels

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # GET /channels/1/edit
  def edit
  end

  def createChannel

    @channel = Channel.new(:name => params[:name], :piconet_id => params[:piconet_id])
    @user.save
  end

  # POST /channels
  # POST /channels.json
  def create
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channels/1
  # PATCH/PUT /channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel }
      else
        format.html { render :edit }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:name, :piconet_id)
    end
end
