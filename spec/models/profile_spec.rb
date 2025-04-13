require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "is not valid without a name" do
    profile = Profile.new(title: "Software Engineer", bio: "Passionate developer")
    expect(profile).to_not be_valid
  end

  it "is not valid without a title" do
    profile = Profile.new(name: "John Doe", bio: "Passionate developer")
    expect(profile).to_not be_valid
  end

  it "is not valid without a bio" do
    profile = Profile.new(name: "John Doe", title: "Software Engineer")
    expect(profile).to_not be_valid
  end

  it "is valid with all required attributes" do
    profile = Profile.new(name: "John Doe", title: "Software Engineer", bio: "Passionate developer")
    expect(profile).to be_valid
  end
end
