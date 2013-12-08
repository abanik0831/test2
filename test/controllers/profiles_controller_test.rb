require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post :create, profile: { area: @profile.area, f_name: @profile.f_name, fb_url: @profile.fb_url, l_name: @profile.l_name, linkedin_url: @profile.linkedin_url, meetup_url: @profile.meetup_url, skills: @profile.skills, title: @profile.title, twitter_url: @profile.twitter_url }
    end

    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should show profile" do
    get :show, id: @profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile
    assert_response :success
  end

  test "should update profile" do
    patch :update, id: @profile, profile: { area: @profile.area, f_name: @profile.f_name, fb_url: @profile.fb_url, l_name: @profile.l_name, linkedin_url: @profile.linkedin_url, meetup_url: @profile.meetup_url, skills: @profile.skills, title: @profile.title, twitter_url: @profile.twitter_url }
    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete :destroy, id: @profile
    end

    assert_redirected_to profiles_path
  end
end
