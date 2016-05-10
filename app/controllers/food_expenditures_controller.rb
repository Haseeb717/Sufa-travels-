class FoodExpendituresController < ApplicationController

  before_action :set_food_expenditure, only: [:show, :edit, :update, :destroy,:edit_request,:approve_edit_request]
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
    @food_expenditures = current_user.food_expenditures.where(:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13)
  end

  def show
  end

  def new
    @food_expenditure = FoodExpenditure.new
  end

  # GET /abcs/1/edit
  def edit
  end

  # POST /abcs
  # POST /abcs.json
  def create
    @food_expenditure = FoodExpenditure.new(food_expenditure_params)

    respond_to do |format|
      if @food_expenditure.save
        current_user.food_expenditures << @food_expenditure
        @food_expenditure.update_user_accounts(current_user)
        format.html { redirect_to @food_expenditure, notice: 'FoodExpenditure was successfully created.' }
        format.json { render :show, status: :created, location: @food_expenditure }
      else
        format.html { render :new }
        format.json { render json: @food_expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abcs/1
  # PATCH/PUT /abcs/1.json
  def update
    respond_to do |format|
      if @food_expenditure.update(food_expenditure_params)
        @food_expenditure.update_attributes(:edit_able=>false)
        format.html { redirect_to @food_expenditure, notice: 'FoodExpenditure was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_expenditure }
      else
        format.html { render :edit }
        format.json { render json: @food_expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abcs/1
  # DELETE /abcs/1.json
  def destroy
    @food_expenditure.destroy
    respond_to do |format|
      format.html { redirect_to food_expenditures_url, notice: 'FoodExpenditure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_request
    @food_expenditure.update_columns(:edit_request=>true)
    redirect_to root_path, notice: 'Request gone to Admin.' 
  end

  def approve_edit_request
    @food_expenditure.update_columns(:edit_request=>false,:edit_able=>true)
    redirect_to edit_requests_homes_path, notice: 'Updated.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_expenditure
      @food_expenditure = FoodExpenditure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_expenditure_params
      params.require(:food_expenditure).permit(:voucher_reference,:guest_name,:on_request_of,:food_type, :expenditure_type, :hotel_name, :payment, :no_of_persons,:comments,:image,:created_at)
    end
end
 