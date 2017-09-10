require 'rails_helper'

describe "Admin edits categories" do
  it "edits a new category" do
    admin = create(:user, role: 1)
    category = create(:category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path

    expect(page).to have_content(category.name)

    click_on "Edit"

    expect(page).to have_content category.name

    fill_in "Name", with: "Category Example"

    click_on "Update Category"

    visit admin_categories_path

    expect(page).to have_content("Category Example")
  end
end
