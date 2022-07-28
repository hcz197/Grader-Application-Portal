require "test_helper"

class GradingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grading = gradings(:one)
  end

  test "should get index" do
    get gradings_url
    assert_response :success
  end

  test "should get new" do
    get new_grading_url
    assert_response :success
  end

  test "should create grading" do
    assert_difference('Grading.count') do
      post gradings_url, params: { grading: { isGrading: @grading.isGrading } }
    end

    assert_redirected_to grading_url(Grading.last)
  end

  test "should show grading" do
    get grading_url(@grading)
    assert_response :success
  end

  test "should get edit" do
    get edit_grading_url(@grading)
    assert_response :success
  end

  test "should update grading" do
    patch grading_url(@grading), params: { grading: { isGrading: @grading.isGrading } }
    assert_redirected_to grading_url(@grading)
  end

  test "should destroy grading" do
    assert_difference('Grading.count', -1) do
      delete grading_url(@grading)
    end

    assert_redirected_to gradings_url
  end
end
