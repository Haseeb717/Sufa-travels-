require 'test_helper'

class HotelExpendituresControllerTest < ActionController::TestCase
  setup do
    @hotel_expenditure = hotel_expenditures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotel_expenditures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotel_expenditure" do
    assert_difference('HotelExpenditure.count') do
      post :create, hotel_expenditure: { charges_per_day: @hotel_expenditure.charges_per_day, checked_in_date: @hotel_expenditure.checked_in_date, checked_out_date: @hotel_expenditure.checked_out_date, comments: @hotel_expenditure.comments, expenditure_type: @hotel_expenditure.expenditure_type, hotel_name: @hotel_expenditure.hotel_name, no_of_rooms: @hotel_expenditure.no_of_rooms, room_type: @hotel_expenditure.room_type, total_amount: @hotel_expenditure.total_amount, total_days: @hotel_expenditure.total_days, user_id: @hotel_expenditure.user_id }
    end

    assert_redirected_to hotel_expenditure_path(assigns(:hotel_expenditure))
  end

  test "should show hotel_expenditure" do
    get :show, id: @hotel_expenditure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotel_expenditure
    assert_response :success
  end

  test "should update hotel_expenditure" do
    patch :update, id: @hotel_expenditure, hotel_expenditure: { charges_per_day: @hotel_expenditure.charges_per_day, checked_in_date: @hotel_expenditure.checked_in_date, checked_out_date: @hotel_expenditure.checked_out_date, comments: @hotel_expenditure.comments, expenditure_type: @hotel_expenditure.expenditure_type, hotel_name: @hotel_expenditure.hotel_name, no_of_rooms: @hotel_expenditure.no_of_rooms, room_type: @hotel_expenditure.room_type, total_amount: @hotel_expenditure.total_amount, total_days: @hotel_expenditure.total_days, user_id: @hotel_expenditure.user_id }
    assert_redirected_to hotel_expenditure_path(assigns(:hotel_expenditure))
  end

  test "should destroy hotel_expenditure" do
    assert_difference('HotelExpenditure.count', -1) do
      delete :destroy, id: @hotel_expenditure
    end

    assert_redirected_to hotel_expenditures_path
  end
end
