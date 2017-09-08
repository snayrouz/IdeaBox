require 'rails_helper'

describe "Admin Visits Categories Index Page" do
  context "views edit button" do
    it "clicks on edit and edits category" do
      admin = User.create(username: "samnay",
                          email: "sn@aol.com",
                          password: "password",
                          role: 1)
      category = Category.create(name: "Lunch")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      click_link "Edit"

      expect(current_path).to eq(edit_admin_category_path(category))
      expect(page).to have_content("Edit Category")

      fill_in "category[name]", with: "Food"

      click_on "Update Category"

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("Food")
    end
  end
end
