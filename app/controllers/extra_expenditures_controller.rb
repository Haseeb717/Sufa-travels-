class ExtraExpendituresController < ApplicationController
	before_action :set_extra_expenditure, only: [:show, :edit, :update, :destroy,:edit_request,:approve_edit_request]
  before_action :authenticate_user!
	# GET /abcs
  # GET /abcs.json
  def index
    if params["start_date"].nil?  || params["start_date"].empty? 
      @start_date = Tcurrent_user.created_at
    else
      @start_date = params["start_date"].to_date 
    end
    if params["end_date"].nil? || params["end_date"].empty?
      @end_date = Time.now.to_date.end_of_day
    else
      @end_date = params["end_date"].to_date.end_of_day 
    end
    @extra_expenditures = current_user.extra_expenditures.where(:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13)
  end

  def show
  end

  def new
    @extra_expenditure = ExtraExpenditure.new
  end

  def edit
  end

  def create
    @extra_expenditure = ExtraExpenditure.new(extra_expenditure_params)
    respond_to do |format|
      if @extra_expenditure.save
        current_user.extra_expenditures << @extra_expenditure
        @extra_expenditure.update_user_accounts(current_user)
        format.html { redirect_to @extra_expenditure, notice: 'ExtraExpenditure was successfully created.' }
        format.json { render :show, status: :created, location: @extra_expenditure }
      else
        format.html { render :new }
        format.json { render json: @extra_expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @extra_expenditure.update(extra_expenditure_params)
        @extra_expenditure.update_attributes(:edit_able=>false)
        format.html { redirect_to @extra_expenditure, notice: 'ExtraExpenditure was successfully updated.' }
        format.json { render :show, status: :ok, location: @extra_expenditure }
      else
        format.html { render :edit }
        format.json { render json: @extra_expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @extra_expenditure.destroy
    respond_to do |format|
      format.html { redirect_to extra_expenditures_url, notice: 'ExtraExpenditure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_request
    @extra_expenditure.update_columns(:edit_request=>true)
    redirect_to root_path, notice: 'Request gone to Admin.' 
  end

  def approve_edit_request
    @extra_expenditure.update_columns(:edit_request=>false,:edit_able=>true)
    redirect_to edit_requests_homes_path, notice: 'Updated.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extra_expenditure
      @extra_expenditure = ExtraExpenditure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extra_expenditure_params
      params.require(:extra_expenditure).permit(:payment, :expenditure_type, :user_id, :reason,:image,:extra_type,:other_reason)
    end
end

