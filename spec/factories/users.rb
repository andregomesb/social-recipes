FactoryGirl.define do
  factory :user do
    name 'John Doe'
    email 'johndoe@example.com'
    city 'Some City'
    password 'foobar'
    password_confirmation 'foobar'
    admin false

    factory :numbered_user do
      sequence(:name) { |n| "Jonh_Doe_#{n}" }
      sequence(:email) { |n| "johndoe#{n}@example.com" }
    end

    factory :admin do
      admin true
    end
  end
end
