require 'test_helper'

module AppleManifestRails
  class ManifestControllerTest < ActionController::TestCase
    test "should get enroll" do
      get :enroll
      assert_response :success
    end
  
  end
end
