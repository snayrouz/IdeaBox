require 'rails_helper'

describe "Admin deletes image when logged in" do
  it "a admin deletes an image" do
    admin = create(:user, role: 1)
    image = create(:image)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_images_path

    expect(page).to have_content(image.title)

    click_on "Delete"
    
    expect(page).to_not have_content image.title
  end

end
