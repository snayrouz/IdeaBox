require 'rails_helper'

RSpec.feature "User Is Logged In" do
  context "and wants to log out of session" do
    it "and clicks logout" do
      user = User.create(username: "itsnay",
                         email: "naynaynay@aol.com",
                         password: "wordpass",
                         role: 0)

      visit login_path

      fill_in "session[username]", with: "itsnay"
      fill_in "session[email]", with: "naynaynay@aol.com"
      fill_in "session[password]", with: "wordpass"
      click_on "Log In"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, itsnay")

      click_on "Logout"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome to IdeaBox!")
    end
  end
end
