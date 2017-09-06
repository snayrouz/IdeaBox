require 'rails_helper'

RSpec.feature "Guest Becomes A User" do
  context "guest visits the welcome screen" do
    it "sees the login options" do
      visit '/'

      expect(page).to have_content("Welcome To IdeaBox!")
      expect(page).to have_link("Create A New Account")
      expect(page).to have_link("Already have an account? Click here!")

    end

    it "clicks on the new account link" do
      visit '/'

      click_link "Create A New Account"
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

# require 'rails_helper'
#
# RSpec.feature "Guest Becomes A User" do
#   context "guest creates a new user" do
#     it "sees and fills out new user form" do
#       visit '/'
#       expect(page).to have_link("Create New User")
#       click_link "Create New User"
#       expect(current_path).to eq(new_user_path)
#       fill_in "user[username]", with: "snayrouz"
#       fill_in "user[password]", with: "password"
#       click_on "Create User"
#       expect(current_path).to eq(user_path(User.last))
#       expect(page).to have_content("Hi, snayrouz")
#       expect(page).to have_link("Logout")
#       click_on "Logout"
#       expect(current_path).to eq(root_path)
#       expect(page).to have_link("Already a user? Click Here")
#       click_on "Already a user? Click Here"
#       expect(current_path).to eq(login_path)
#       fill_in "session[username]", with: "snayrouz"
#       fill_in "session[password]", with: "password"
#       click_on "Log in"
#       expect(page).to have_content("Hi, snayrouz")
#     end
#   end
# end
