class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  # GET /spots
  # GET /spots.json
  def index
    @spots = Spot.all
  end

  # GET /spots/1
  # GET /spots/1.json
  def show
  end

  def take
    @user = current_user
    @spot = Spot.find(params[:id])
    @room = Room.find(@spot.room_id)
    if Spot.taken(@room, @user)
      Spot.update(@spot.id, :user_id => @user.id)
      #SpotMailer.take_spot(@room.owner_id, @user.id).deliver_now!
      redirect_to room_path(@spot.room_id)
    else
      respond_to do |format|
        format.html { redirect_to room_path(@spot.room_id), notice: 'You already have a spot in this room!'}
      end
    end
  end

  def remove_user
    @spot=Spot.find(params[:id])
    @room = Room.find(@spot.room_id)
    @spot.user_id = nil
    redirect_to room_path(@room.id)
  end

  # GET /spots/new
  def new
    @room = Room.find(params[:room_id])
    @spot = @room.spots.build
  end

  # GET /spots/1/edit
  def edit
  end

  # POST /spots
  # POST /spots.json
  def create
    @room = Room.find(params[:room_id])
    @spot = @room.spots.create(spot_params)

    respond_to do |format|
      if @spot.save
        format.html { redirect_to room_path(@room.id), notice: 'You have a new spot!' }
        format.json { render :show, status: :created, location: @spot }
      else
        format.html { render :new }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spots/1
  # PATCH/PUT /spots/1.json
  def update
    respond_to do |format|
      if @spot.update(spot_params)
        format.html { redirect_to @spot, notice: 'Spot was successfully updated.' }
        format.json { render :show, status: :ok, location: @spot }
      else
        format.html { render :edit }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spots/1
  # DELETE /spots/1.json
  def destroy
    @room = Room.find(@spot.room_id)
    @spot.destroy
    respond_to do |format|
      format.html { redirect_to room_path(@room), notice: 'Spot removed!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spot
      @spot = Spot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spot_params
      params.require(:spot).permit(:description, :room_id, :user_id)
    end
end
