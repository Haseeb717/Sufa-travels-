class TransportExpendituresController < ApplicationController
  before_action :set_transport_expenditure, only: [:show, :edit, :update, :destroy,:edit_request,:approve_edit_request]
  before_action :authenticate_user!
	# GET /abcs
  # GET /abcs.json
  def index
    if params["start_date"].nil?  || params["start_date"].empty? 
      @start_date = Time.now.to_date - 15
    else
      @start_date = params["start_date"].to_date 
    end
    if params["end_date"].nil? || params["end_date"].empty?
      @end_date = Time.now.to_date.end_of_day
    else
      @end_date = params["end_date"].to_date.end_of_day 
    end
    @transport_expenditures = current_user.transport_expenditures.paginate(:page => params[:page], :per_page => 13)
  end

  # GET /abcs/1
  # GET /abcs/1.json
  def show
  end

  # GET /abcs/new
  def new
    @transport_expenditure = TransportExpenditure.new
  end

  # GET /abcs/1/edit
  def edit
  end

  # POST /abcs
  # POST /abcs.json
  def create
    @transport_expenditure = TransportExpenditure.new(transport_expenditure_params)

    respond_to do |format|
      if @transport_expenditure.save
        current_user.transport_expenditures << @transport_expenditure
        @transport_expenditure.update_user_accounts(current_user)
        format.html { redirect_to @transport_expenditure, notice: 'TransportExpenditure was successfully created.' }
        format.json { render :show, status: :created, location: @transport_expenditure }
      else
        format.html { render :new }
        format.json { render json: @transport_expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abcs/1
  # PATCH/PUT /abcs/1.json
  def update
    respond_to do |format|
      if @transport_expenditure.update(extra_expenditure_params)
        @transport_expenditure.update_attributes(:edit_able=>false)
        format.html { redirect_to @transport_expenditure, notice: 'TransportExpenditure was successfully updated.' }
        format.json { render :show, status: :ok, location: @transport_expenditure }
      else
        format.html { render :edit }
        format.json { render json: @transport_expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abcs/1
  # DELETE /abcs/1.json
  def destroy
    @transport_expenditure.destroy
    respond_to do |format|
      format.html { redirect_to transport_expenditures_url, notice: 'TransportExpenditure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_request
    @transport_expenditure.update_columns(:edit_request=>true)
    redirect_to root_path, notice: 'Request gone to Admin.' 
  end

  def approve_edit_request
    @transport_expenditure.update_columns(:edit_request=>false,:edit_able=>true)
    redirect_to edit_requests_homes_path, notice: 'Updated.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transport_expenditure
      @transport_expenditure = TransportExpenditure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transport_expenditure_params
      params.require(:transport_expenditure).permit(:voucher_reference,:guest_name,:supplier_name,:transport_type, :expenditure_type, :no_of_seats, :arrival_time, :departure_time, :arrival_place, :departure_place, :payment, :user_id,:image)
    end
end