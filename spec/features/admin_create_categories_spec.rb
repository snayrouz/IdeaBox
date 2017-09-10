require 'rails_helper'

describe "Admin can create new categories" do
  it "is able to create a new category from the categoires index page" do
    admin = create(:user, role: 1)
    category = create(:category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path

    expect(page).to have_content(category.name)

    click_on "New Category"

    fill_in "Name", with: "College Football"

    click_on "Create Category"

    visit admin_categories_path

    expect(page).to have_content(category.name)
    expect(page).to have_content("College Football")
  end
end
