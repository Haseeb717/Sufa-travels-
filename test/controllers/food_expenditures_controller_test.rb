require 'test_helper'

class FoodExpendituresControllerTest < ActionController::TestCase
  setup do
    @food_expenditure = food_expenditures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_expenditures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_expenditure" do
    assert_difference('FoodExpenditure.count') do
      post :create, food_expenditure: { expenditure_type: @food_expenditure.expenditure_type, food_type: @food_expenditure.food_type, hotel_name: @food_expenditure.hotel_name, no_of_persons: @food_expenditure.no_of_persons, payment: @food_expenditure.payment }
    end

    assert_redirected_to food_expenditure_path(assigns(:food_expenditure))
  end

  test "should show food_expenditure" do
    get :show, id: @food_expenditure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_expenditure
    assert_response :success
  end

  test "should update food_expenditure" do
    patch :update, id: @food_expenditure, food_expenditure: { expenditure_type: @food_expenditure.expenditure_type, food_type: @food_expenditure.food_type, hotel_name: @food_expenditure.hotel_name, no_of_persons: @food_expenditure.no_of_persons, payment: @food_expenditure.payment }
    assert_redirected_to food_expenditure_path(assigns(:food_expenditure))
  end

  test "should destroy food_expenditure" do
    assert_difference('FoodExpenditure.count', -1) do
      delete :destroy, id: @food_expenditure
    end

    assert_redirected_to food_expenditures_path
  end
end
