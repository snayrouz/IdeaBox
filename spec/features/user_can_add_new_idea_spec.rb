require 'rails_helper'

describe "User Adds a New Idea" do
  context "they visit their show page" do
    it "can add a new idea" do
      user = User.create(id: 1,
                         username: "itsnay",
                         email: "naynaynay@aol.com",
                         password: "wordpass",
                         role: 0)

      category = Category.create(id: 1, name: "Lunch")
      Idea.create(title: "Birthday saturday", description: "We should go out saturday for his birthday", category_id: 1, user_id: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(idea.user)

      visit user_path(user)
      click_button "New Idea"

      expect(current_path).to eq(new_user_idea_path(user))

      fill_in "idea[title]", with: idea.title
      fill_in "idea[description]", with: idea.description
      select category.name, from: "idea[category_id]"

      click_on "Create Idea"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content idea.title
    end
  end
end
