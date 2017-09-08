require 'rails_helper'

describe "User Adds a New Idea" do
  context "they visit their show page" do
    it "can add a new idea" do
      user = User.create(username: "itsnay",
                         email: "naynaynay@aol.com",
                         password: "wordpass",
                         role: 0)

      visit user_path(user)

      

    end
  end
end
