class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    htmlMessages = {
      missingDate: "Missing From / To date(s)!",
      fromGreater: "To date cannot precede From date!",
      fromPast: "From date cannot be in the past! You can only make reservations in the future!",
      overlap: "The property is already booked in that timeframe!",
      success: "Reservation was successfully created."
    }

    jsonMessages = {
      missingDate: "Missing From / To date(s)!",
      fromGreater: "To date cannot precede From date!",
      fromPast: "From date cannot be in the past!",
      overlap: "Not available!",
      success: "Booked!"
    }

    if (reservation_params[:from].empty? or reservation_params[:to].empty?)
      respond_to do |format|
        format.html { redirect_to reservations_url, alert: htmlMessages[:missingDate] }
        msg = { :status => "error", :message => jsonMessages[:missingDate] }
        format.json { render :json => msg }
      end
    else
      prop = Property.find(reservation_params[:property_id])
      from = Time.parse(reservation_params[:from])
      to = Time.parse(reservation_params[:to])

      if (from > to)
        respond_to do |format|
          format.html { redirect_to reservations_url, alert: htmlMessages[:fromGreater] }
          msg = { :status => "error", :message => jsonMessages[:fromGreater] }
          format.json { render :json => msg }
        end
      elsif (from < Time.now)
        respond_to do |format|
          format.html { redirect_to reservations_url, alert: htmlMessages[:fromPast] }
          msg = { :status => "error", :message => jsonMessages[:fromPast] }
          format.json { render :json => msg }
        end
      elsif (isReservationsOverlaps(Reservation.where(property: prop), from, to))
        respond_to do |format|
          format.html { redirect_to reservations_url, alert: htmlMessages[:overlap] }
          msg = { :status => "error", :message => jsonMessages[:overlap] }
          format.json { render :json => msg }
        end
      else
        @reservation = Reservation.new(reservation_params)

        respond_to do |format|
          if @reservation.save
            format.html { redirect_to @reservation, notice: htmlMessages[:success] }
            msg = { :status => "success", :message => jsonMessages[:success] }
            format.json { render :json => msg }
          else
            format.html { render :new }
            format.json { render json: @reservation.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:property_id, :from, :to, :user_id)
    end

    def isOverlaps (from_o, to_o, from_n, to_n)
      if (Time.at(from_n).between?(Time.at(from_o), Time.at(to_o)) ||
          Time.at(to_n).between?(Time.at(from_o), Time.at(to_o)) )
          return true
      end
      return false
    end

    def isReservationsOverlaps (reservations, from, to)
      reservations.each do |res|
        if !isOverlaps(res.from, res.to, from, to)
          next
        else
          return true
        end
      end
      return false
    end
end
