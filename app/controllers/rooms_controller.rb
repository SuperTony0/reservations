class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @trip = Trip.find(params[:trip_id])
    @rooms = @trip.rooms
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    trip_id = @room.trip_id
    @trip = Trip.find(trip_id)

  end

  # GET /rooms/new
  def new
    #@room = Room.new
    @trip = Trip.find(params[:trip_id])
    @room = @trip.rooms.build

    respond_to do |format|
      format.html
      format.xml {render :xml => @room}
    end

  end

  # GET /rooms/1/edit
  def edit
    @trip = Trip.find(@room.trip_id)

  end

  # POST /rooms
  # POST /rooms.json
  def create
    @trip = Trip.find(params[:trip_id])
    @room = @trip.rooms.create(room_params)
    #@room = Room.new(room_params)
    #@room.trip_id = :trip_id

    respond_to do |format|
      if @room.save
        format.html { redirect_to trip_rooms_path(@trip.id, @room.id), notice: 'Room was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @trip = Trip.find(params[:trip_id])
    @room.destroy
    respond_to do |format|
      format.html { redirect_to trip_rooms_path(@trip.id), notice: 'Room was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:capacity, :description, :location, :number, :price, :trip_id)
    end
end
