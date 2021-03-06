FactoryGirl.define do
  sequence :name_numbered do |n|
    "Fried Masala Chicken #{n}"
  end

  factory :recipe do
    name 'Fried Masala Chicken'
    user
    cuisine
    meal
    portion 3
    preparation_time 45
    difficulty Recipe.difficulties.keys.sample
    ingredients 'Chicken 500g, Chicken masale 50g'
    instructions 'Duos aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla paria tusunt in culpa qui officia deserunt
    iste natus error sit voluptatem, totam rem aperiam, eaque ipsa quae ab tis
    et quasi architecto beatae vitae dicta sunt explicabo.'

    factory :numbered_recipes do
      name { generate(:name_numbered) }
    end

    factory :recipe_with_image do
      recipe_image do
        File.open(Rails.root.join('spec', 'support', 'photos', 'test.png'))
      end
    end
  end
end
