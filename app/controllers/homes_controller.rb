class HomesController < ApplicationController
  before_action :authenticate_user!
  def index
    @extra_expenditures = current_user.extra_expenditures.all 
    @food_expenditures = current_user.food_expenditures.all  
    @hotel_expenditures = current_user.hotel_expenditures.all 
    @transport_expenditures = current_user.transport_expenditures.all 
  end

  def edit_requests
  	@extra_expenditures = ExtraExpenditure.where(:edit_request=>true)
    @food_expenditures = FoodExpenditure.where(:edit_request=>true)  
    @hotel_expenditures = HotelExpenditure.where(:edit_request=>true) 
    @transport_expenditures = TransportExpenditure.where(:edit_request=>true) 
  end

  def add_new_user
    @user = User.new
  end

  def create_new_user
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to list_all_users_homes_path, notice: 'User was successfully created.' }
      else
        format.html { render :add_new_user }
        format.json { render json: @food_expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  def list_all_users
    @users = User.user.all
  end

  def show_user
    @user = User.find_by_id(params["id"])
    if @user

    else
    end
  end

  def add_balance
    @select = params["user"]
  end

  def submit_add_balance
    @user = User.find_by_id(params["user_id"])
    if @user
      if @user.balance_request.nil?
        balance =  0
      else
        balance = @user.balance_request
      end
      balance = balance + params["amount"].to_i
      @user.update_attributes(:balance_request=>balance)
      redirect_to list_all_users_homes_path 
    else
    end
  end

  def super_admin_dashboard
    @users = User.where.not(:balance_request=>nil)
  end

  def user_report
    @month = Time.now.month 
    user_creation = current_user.created_at.to_date
    if params["month_id"].nil?  || params["month_id"].empty? 
      start_d = 0.month.ago.beginning_of_month.to_date
      @end_date = Time.now.to_date
    else
      start_d = Date.new(Date.today.year, params["month_id"].to_i).to_date
      @month = params["month_id"].to_i
      if Time.now.month == @month
        @end_date = Time.now.to_date
      else
        @end_date = start_d.end_of_month.to_date
      end
    end
    if user_creation > start_d
      @start_date = user_creation
    else
      @start_date = start_d
    end
  end

  def daily_report
    @start_date = Time.now.to_date
    @end_date = Time.now.to_date.end_of_day
  end

  def ceo_daily_report
    @users = User.user.all
    start_d = 0.day.ago.beginning_of_day.to_date
    @start_date = start_d
    @end_date = Time.now.to_date
  end

  def ceo_monthly_report
    @users = User.user.all
    user_creation = current_user.created_at.to_date
    if params["month_id"].nil?  || params["month_id"].empty? 
      start_d = 0.month.ago.beginning_of_month.to_date
      @end_date = Time.now.to_date
    else
      start_d = Date.new(Date.today.year, params["month_id"].to_i).to_date
      @end_date = start_d.end_of_month.to_date
      @month = params["month_id"].to_i
    end
    @start_date = start_d
  end

  def approve_balance_super_admin
    @user = User.find_by_id(params["id"])
    balance = @user.total_amount + @user.balance_request
    current_balance = @user.current_amount + @user.balance_request
    UserBalance.create(:amount=>@user.balance_request,:user_id=>@user.id) 
    @user.update_attributes(:total_amount=>balance,:current_amount=>current_balance,:balance_request=>nil)
     
    redirect_to super_admin_dashboard_homes_path
  end

  def accountant_report
    if params["month_id"].nil?  || params["month_id"].empty? 
      start_d = 0.month.ago.beginning_of_month.to_date
      @end_date = Time.now.to_date
    else
      start_d = Date.new(Date.today.year, params["month_id"].to_i).to_date
      @end_date = start_d.end_of_month.to_date
      @month = params["month_id"].to_i
    end
    @start_date = start_d
    @balances = UserBalance.where("created_at >= ? and created_at <= ?",@start_date,@end_date.end_of_day)
  end

  def h_expenditure_report
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
    if params["user"].nil?  || params["user"].empty? 
      @user = 0
      @hotel_expenditures = HotelExpenditure.where(:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13)
    else
      @user = params["user"]
      @hotel_expenditures = HotelExpenditure.where(:user_id=>params["user"],:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13) 
    end
  end

  def t_expenditure_report
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
    if params["user"].nil?  || params["user"].empty?
      @user = 0 
      @transport_expenditures = TransportExpenditure.where(:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13)
    else
      @user = params["user"]
      @transport_expenditures = TransportExpenditure.where(:user_id=>params["user"],:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13) 
    end
  end

  def f_expenditure_report
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
    if params["user"].nil?  || params["user"].empty?
      @user = 0 
      @food_expenditures = FoodExpenditure.where(:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13)
    else
      @user = params["user"]
      @food_expenditures = FoodExpenditure.where(:user_id=>params["user"],:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13) 
    end
  end

  def e_expenditure_report
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
    if params["user"].nil?  || params["user"].empty?
      @user = 0 
      @extra_expenditures = ExtraExpenditure.where(:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13)
    else
      @user = params["user"]
      @extra_expenditures = ExtraExpenditure.where(:user_id=>params["user"],:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13) 
    end
  end

  def status_report

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

    if params["type"].nil?  || params["type"].empty? 
      @start_date = Time.now.to_date - 15
    elsif params["type"] == "1"
      @type = 1
      @food_expenditures = FoodExpenditure.where(:user_id=>current_user.id,:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13)
    elsif params["type"] == "2"
      @type = 2
      @transport_expenditures = TransportExpenditure.where(:user_id=>current_user.id,:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13)
    elsif params["type"] == "3"
      @type = 3
      @extra_expenditures = ExtraExpenditure.where(:user_id=>current_user.id,:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13)
    elsif params["type"] == "4"
      @type = 4
      @hotel_expenditures = HotelExpenditure.where(:user_id=>current_user.id,:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13)
    else
    end

  end

  def accountant_status_report

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

    if params["user"].nil?  || params["user"].empty?
      @user = User.user.first
    else
      @user = params["user"].to_i
    end
    if params["type"].nil?  || params["type"].empty? 
      
    elsif params["type"] == "1"
      @type = 1
      @food_expenditures = FoodExpenditure.where(:user_id=>@user,:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13)
    elsif params["type"] == "2"
      @type = 2
      @transport_expenditures = TransportExpenditure.where(:user_id=>@user,:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13)
    elsif params["type"] == "3"
      @type = 3
      @extra_expenditures = ExtraExpenditure.where(:user_id=>@user,:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13)
    elsif params["type"] == "4"
      @type = 4
      @hotel_expenditures = HotelExpenditure.where(:user_id=>@user,:created_at=>@start_date..@end_date).paginate(:page => params[:page], :per_page => 13)
    else
    end

  end
    
  private
    
    def set_user
      @user = User.find_by_id(params["id"])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end
