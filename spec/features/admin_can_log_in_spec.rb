require 'rails_helper'

RSpec.feature "Admin Visits Login Page" do
  context "and views the login field" do
    it "and fills in their login credentials" do
      admin = User.create(username: "itsnay", email: "naynaynay@aol.com", password: "wordpass", role: 1)

      visit root_path

      click_link "Admin Login"

      expect(current_path).to eq(admin_path)

      fill_in "session[username]", with: "itsnay"
      fill_in "session[email]", with: "naynaynay@aol.com"
      fill_in "session[password]", with: "wordpass"
      click_on "Log In"

      expect(current_path).to eq(user_path(admin))
      expect(page).to have_link("New Category")
    end
  end
end
