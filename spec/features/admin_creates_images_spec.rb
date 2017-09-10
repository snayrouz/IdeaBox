
require 'rails_helper'

describe "Admin can add an image" do
  context "when on the admin image page" do
    it "admin adds an image" do
      admin = create(:user, role: 1)
      image = create(:image)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_images_path

      expect(page).to have_content(image.title)

      click_on "New Image"

      fill_in "Title", with: image.title
      fill_in "Url", with: image.url

      click_on "Upload Image"

      expect(page).to have_content(image.title)
    end
  end
end
