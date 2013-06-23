require 'test_helper'

class JobPostingsControllerTest < ActionController::TestCase
  setup do
    @job_posting = job_postings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_postings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_posting" do
    assert_difference('JobPosting.count') do
      post :create, job_posting: { closing_date: @job_posting.closing_date, description: @job_posting.description, post_date: @job_posting.post_date, requirements: @job_posting.requirements, title: @job_posting.title }
    end

    assert_redirected_to job_posting_path(assigns(:job_posting))
  end

  test "should show job_posting" do
    get :show, id: @job_posting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_posting
    assert_response :success
  end

  test "should update job_posting" do
    put :update, id: @job_posting, job_posting: { closing_date: @job_posting.closing_date, description: @job_posting.description, post_date: @job_posting.post_date, requirements: @job_posting.requirements, title: @job_posting.title }
    assert_redirected_to job_posting_path(assigns(:job_posting))
  end

  test "should destroy job_posting" do
    assert_difference('JobPosting.count', -1) do
      delete :destroy, id: @job_posting
    end

    assert_redirected_to job_postings_path
  end
end
