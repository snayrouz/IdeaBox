require 'rails_helper'

describe "User visits categories new page" do
  context "as an administrator" do
    it "allows admin to make new category" do
      admin = User.create(username: "samnay",
                          email: "sn@aol.com",
                          password: "password",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path
      expect(page).to have_content("New Category")
    end
  end

  context "as default user" do
    it "does not allow default user to make new cateogry" do
      user = User.create(username: "itsnay",
                         email: "naynaynay@aol.com",
                         password: "wordpass",
                         role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_category_path

      expect(page).to_not have_content("New Idea Category")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
