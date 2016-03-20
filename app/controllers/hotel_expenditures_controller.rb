class HotelExpendituresController < ApplicationController

  before_action :set_hotel_expenditure, only: [:show, :edit, :update, :destroy,:edit_request,:approve_edit_request]
  before_action :authenticate_user!
	# GET /abcs
  # GET /abcs.json
  def index
    if params["start_date"].nil?  || params["start_date"].empty? 
      @start_date = current_user.created_at
    else
      @start_date = params["start_date"].to_date 
    end
    if params["end_date"].nil? || params["end_date"].empty?
      @end_date = Time.now.to_date.end_of_day
    else
      @end_date = params["end_date"].to_date.end_of_day 
    end
    
    @hotel_expenditures = current_user.hotel_expenditures.where(:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13)
  end

  # GET /abcs/1
  # GET /abcs/1.json
  def show
  end

  # GET /abcs/new
  def new
    @hotel_expenditure = HotelExpenditure.new
  end

  # GET /abcs/1/edit
  def edit
  end

  # POST /abcs
  # POST /abcs.json
  def create
    @hotel_expenditure = HotelExpenditure.new(hotel_expenditure_params)

    respond_to do |format|
      if @hotel_expenditure.save
        current_user.hotel_expenditures << @hotel_expenditure
        
        @hotel_expenditure.update_rooms()
        @hotel_expenditure.update_user_accounts(current_user)
        format.html { redirect_to @hotel_expenditure, notice: 'HotelExpenditure was successfully created.' }
        format.json { render :show, status: :created, location: @hotel_expenditure }
      else
        format.html { render :new }
        format.json { render json: @hotel_expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abcs/1
  # PATCH/PUT /abcs/1.json
  def update
    respond_to do |format|
      if @hotel_expenditure.update(hotel_expenditure_params)
        @hotel_expenditure.update_attributes(:edit_able=>false)
        format.html { redirect_to @hotel_expenditure, notice: 'HotelExpenditure was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel_expenditure }
      else
        format.html { render :edit }
        format.json { render json: @hotel_expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abcs/1
  # DELETE /abcs/1.json
  def destroy
    @hotel_expenditure.destroy
    respond_to do |format|
      format.html { redirect_to hotel_expenditures_url, notice: 'HotelExpenditure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_request
    @hotel_expenditure.update_columns(:edit_request=>true)
    redirect_to root_path, notice: 'Request gone to Admin.' 
  end

  def approve_edit_request
    @hotel_expenditure.update_columns(:edit_request=>false,:edit_able=>true)
    redirect_to edit_requests_homes_path, notice: 'Updated.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel_expenditure
      @hotel_expenditure = HotelExpenditure.find(params[:id])
    end

    def hotel_expenditure_params
      params.require(:hotel_expenditure).permit(:voucher_reference,:guest_name,:room_basis,:supplier_name,:expenditure_type, :checked_in_date, :checked_out_date, :total_days, :charges_per_day, :no_of_rooms, :room_type, :total_amount, :hotel_name, :user_id,:no_of_persons,:adults,:children, :comments,:image,:infant,:d_room_type,:t_room_type,:q_room_type,:d_rooms,:t_rooms,:q_rooms,:charge_d_room,:charge_t_room,:charge_q_room)
    end
end