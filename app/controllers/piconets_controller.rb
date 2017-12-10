class PiconetsController < ApplicationController
  before_action :set_piconet, only: [:show, :edit, :update, :destroy]

  # GET /piconets
  # GET /piconets.json
  def index
    @piconets = Piconet.all

  end


  # user id / piconet id
  def join
    @piconet = Piconet.find_by(id: user_params[:piconet_id]).increment!(:number_of_users)
    @piconet.users << User.find(params[:user_id])
  end
  # GET /piconets/1
  # GET /piconets/1.json
  def show
  end

  # GET /piconets/new
  def new
      @piconet = Piconet.new
  end

  # GET /piconets/1/edit
  def edit
  end

  # POST /piconets
  # POST /piconets.json
  #params= channelid =
  def createPiconet
    @user = User.find_by(:phone_number => params[:master_id])
    @piconet = Piconet.new(:channel_id => params[:channel_id], :master_id => @user[:id],:number_of_users => params[:number_of_users])
    @piconet.save
  end

  def create
    if User.exists?(id: piconet_params[:master_id])
      @piconet = Piconet.new(piconet_params)
      respond_to do |format|
        if @piconet.save
          format.html { redirect_to @piconet, notice: 'Piconet was successfully created.' }
          format.json { render :show, status: :created, location: @piconet }
        else
          format.html { render :new }
          format.json { render json: @piconet.errors, status: :unprocessable_entity }
        end
      end
    else
       render json: {"errors": "Master should be a user", "errors": piconet_params[:master_id]}
    end
  end

  # PATCH/PUT /piconets/1
  # PATCH/PUT /piconets/1.json
  def update
    respond_to do |format|
      if @piconet.update(piconet_params)
        format.html { redirect_to @piconet, notice: 'Piconet was successfully updated.' }
        format.json { render :show, status: :ok, location: @piconet }
      else
        format.html { render :edit }
        format.json { render json: @piconet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /piconets/1
  # DELETE /piconets/1.json
  def destroy
    @piconet.destroy
    respond_to do |format|
      format.html { redirect_to piconets_url, notice: 'Piconet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_piconet
      @piconet = Piconet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def piconet_params
      params.require(:piconet).permit(:channel_id, :master_id, )
    end
end
