class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  #GET /users?channelid=1 -- to show only the users in that channel
  #/user --> send all users
  #/user?

  def index
    @users = User.all
    if params[:channel_id]
      @channel = Channel.find_by(id: params[:channel_id])
      @piconet = Piconet.find_by(id: @channel[:piconet_id])
      @users = @users.where(piconet_id: @piconet[:id])
    end
    render json: @users
    # else
    #   @users = User.all
    # end
    # render json: @users
  end

  # GET /users/1
  # GET /users/1.json

  def show
  end



  # GET /users/new
  def new
    @user = User.new
  end



  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  #TODO add constraint number of users to channel are less than 7
  def addUser
    user = User.new(:name => params[:name], :phone_number => params[:phone_number])
    user.save
  end
#  /users/join?user_id=..&piconet_id=
  def join
    @piconet = Piconet.find_by(:id => params[:piconet_id]).increment!(:number_of_users)
    @piconet.users << User.find_by(:phone_number => params[:user_id])
    @piconet.save
    user = User.find_by(:phone_number => params[:user_id])
    user[:piconet_id] = params[:piconet_id]
    user.save
  end

  #users/leavePiconet?user_id=()&channel_id=
  def leavePiconet
    user = User.find_by(:phone_number => params[:user_id])

    channel = Channel.find_by(:id => params[:channel_id])
    channel[:piconet_id] = 0
    channel.save

    user[:piconet_id] = 0
    user.save

    @piconet = Piconet.find_by(:channel_id => params[:channel_id]).decrement!(:number_of_users)
    if @piconet[:number_of_users] == 0
      @piconet.destroy
    else
      @piconet.save
    end
  end

  def create
    # channel = Channel.find_by(id: user_params[:channel_id]).increment!(:number_of_users)
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :phone_number)
    end
end
