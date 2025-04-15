require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  def setup
    @profile = Profile.new(name: "John Doe", title: "Software Engineer", bio: "A passionate developer.")
  end

  test "profile should be valid" do
    assert @profile.valid?
  end

  test "profile should have an avatar attachment" do
    assert_respond_to @profile, :avatar
  end
end
