FactoryGirl.define do
  factory :recipe do
    name 'Fried Masala Chicken'
    cuisine
    meal
    portion 3
    preparation_time 45
    difficulty Recipe.difficulties.keys.sample
    ingredients 'Chicken 500g, Chicken masale 50g
                 Nam libero et 1/2 cup, Lam hured ore 100ml,
                 Lam temp oretop 250g, Biggish voluptuous. 150g'
    instructions 'Duos aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla paria tusunt in culpa qui officia deserunt
    molliipsa quae ab tit anim id est laborious. Sed ut perspiciatis unde omnis
    iste natus error sit voluptatem, totam rem aperiam, eaque ipsa quae ab tis
    et quasi architecto beatae vitae dicta sunt explicabo.'
  end
end
