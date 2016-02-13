require 'test_helper'

class ExtraExpendituresControllerTest < ActionController::TestCase
  setup do
    @extra_expenditure = extra_expenditures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:extra_expenditures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create extra_expenditure" do
    assert_difference('ExtraExpenditure.count') do
      post :create, extra_expenditure: { expenditure_type: @extra_expenditure.expenditure_type, payment: @extra_expenditure.payment, reason: @extra_expenditure.reason, user_id: @extra_expenditure.user_id }
    end

    assert_redirected_to extra_expenditure_path(assigns(:extra_expenditure))
  end

  test "should show extra_expenditure" do
    get :show, id: @extra_expenditure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @extra_expenditure
    assert_response :success
  end

  test "should update extra_expenditure" do
    patch :update, id: @extra_expenditure, extra_expenditure: { expenditure_type: @extra_expenditure.expenditure_type, payment: @extra_expenditure.payment, reason: @extra_expenditure.reason, user_id: @extra_expenditure.user_id }
    assert_redirected_to extra_expenditure_path(assigns(:extra_expenditure))
  end

  test "should destroy extra_expenditure" do
    assert_difference('ExtraExpenditure.count', -1) do
      delete :destroy, id: @extra_expenditure
    end

    assert_redirected_to extra_expenditures_path
  end
end
