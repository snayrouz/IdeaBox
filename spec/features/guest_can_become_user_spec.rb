require 'rails_helper'

RSpec.feature "Guest Becomes A User" do
  context "guest visits the welcome screen" do
    it "sees the login options" do
      visit '/'

      expect(page).to have_link("Admin Login")
      expect(page).to have_link("Create Account")
      expect(page).to have_link("User Log In")
    end

    it "clicks on the new account link" do
      visit '/'

      click_link "Create Account"
      expect(current_path).to eq(new_user_path)

      fill_in "user[username]", with: "itsnay"
      fill_in "user[email]", with: "abc123@aol.com"
      fill_in "user[password]", with: "password"

      click_on "Create Account"

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Welcome, itsnay")
    end
  end
end
