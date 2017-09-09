FactoryGirl.define do
  factory :user do
    sequence :username do |i|
      "username-#{i}"
    end
    
    sequence :email do |n|
      "email-#{n}@aol.com"
    end

    sequence :password do |n|
     "MyString #{n}"
    end

  end
end
