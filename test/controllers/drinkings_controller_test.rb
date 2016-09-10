require 'test_helper'

class DrinkingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drinking = drinkings(:one)
  end

  test "should get index" do
    get drinkings_url
    assert_response :success
  end

  test "should get new" do
    get new_drinking_url
    assert_response :success
  end

  test "should create drinking" do
    assert_difference('Drinking.count') do
      post drinkings_url, params: { drinking: {  } }
    end

    assert_redirected_to drinking_url(Drinking.last)
  end

  test "should show drinking" do
    get drinking_url(@drinking)
    assert_response :success
  end

  test "should get edit" do
    get edit_drinking_url(@drinking)
    assert_response :success
  end

  test "should update drinking" do
    patch drinking_url(@drinking), params: { drinking: {  } }
    assert_redirected_to drinking_url(@drinking)
  end

  test "should destroy drinking" do
    assert_difference('Drinking.count', -1) do
      delete drinking_url(@drinking)
    end

    assert_redirected_to drinkings_url
  end
end
