require 'test_helper'

class TransportExpendituresControllerTest < ActionController::TestCase
  setup do
    @transport_expenditure = transport_expenditures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transport_expenditures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transport_expenditure" do
    assert_difference('TransportExpenditure.count') do
      post :create, transport_expenditure: { arrival_place: @transport_expenditure.arrival_place, arrival_time: @transport_expenditure.arrival_time, departure_place: @transport_expenditure.departure_place, departure_time: @transport_expenditure.departure_time, expenditure_type: @transport_expenditure.expenditure_type, no_of_seats: @transport_expenditure.no_of_seats, payment: @transport_expenditure.payment, transport_type: @transport_expenditure.transport_type, user_id: @transport_expenditure.user_id }
    end

    assert_redirected_to transport_expenditure_path(assigns(:transport_expenditure))
  end

  test "should show transport_expenditure" do
    get :show, id: @transport_expenditure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transport_expenditure
    assert_response :success
  end

  test "should update transport_expenditure" do
    patch :update, id: @transport_expenditure, transport_expenditure: { arrival_place: @transport_expenditure.arrival_place, arrival_time: @transport_expenditure.arrival_time, departure_place: @transport_expenditure.departure_place, departure_time: @transport_expenditure.departure_time, expenditure_type: @transport_expenditure.expenditure_type, no_of_seats: @transport_expenditure.no_of_seats, payment: @transport_expenditure.payment, transport_type: @transport_expenditure.transport_type, user_id: @transport_expenditure.user_id }
    assert_redirected_to transport_expenditure_path(assigns(:transport_expenditure))
  end

  test "should destroy transport_expenditure" do
    assert_difference('TransportExpenditure.count', -1) do
      delete :destroy, id: @transport_expenditure
    end

    assert_redirected_to transport_expenditures_path
  end
end
