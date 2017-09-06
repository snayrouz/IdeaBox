require 'rails_helper'

RSpec.feature "User Visits Login Page" do
  context "and views the login field" do
    it "and fills in their login credentials" do
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
    end

    it "and enters invalid credentials" do
      User.create(username: "itsnay",
                         email: "naynaynay@aol.com",
                         password: "wordpass",
                         role: 0)

      fill_in "session[username]", with: "itsnay"
      fill_in "session[email]", with: "nay@ie.com"
      fill_in "session[password]", with: "wordpass"
      click_on "Log In"

      expect(current_path).to eq(login_path)
      expect(page).to_not have_content("Welcome, itsnay")
    end
  end
end
