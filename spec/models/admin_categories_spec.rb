require 'rails_helper'

xdescribe "User visits categories new page" do
  context "as an administrator" do
    it "allows admin to view page and add new category " do
      admin = User.create(username: "samnay",
                          email: "sn@aol.com",
                          password: "password",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path

      expect(page).to have_content("New Category")

      fill_in "category[name]", with: "Lunch"
      click_on "Create Category"

      expect(page).to have_content("Lunch")
      expect(current_path).to eq(admin_categories_path)
    end

    it "views all caterogies on the index page" do
      category = Category.create(name: "Lunch")
      category_2 = Category.create(name: "Fun")
      admin = User.create(username: "samnay",
                          email: "sn@aol.com",
                          password: "password",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_categories_path

      expect(page).to have_content(category.name)
      expect(page).to have_content(category_2.name)
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
