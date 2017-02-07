require 'rails_helper'

feature 'User view top favorites in home' do
  scenario 'successfully' do
    user = create(:user)
    cuisine = create(:cuisine)
    meal = create(:meal)
    recipe = create(:recipe, user: user, cuisine: cuisine, meal: meal)
    another_recipe = create(:recipe, name: 'Generic Food', user: user,
                                     cuisine: cuisine, meal: meal)

    another_recipe.favorited_by << user
    10.times do
      recipe.favorited_by << create(:numbered_user)
    end

    visit root_path

    expect(page.text)
      .to match(/(#{another_recipe.name})[\s\S]*(#{recipe.name})|\2[\s\S]*\1/m)
  end

  scenario 'successfully' do
    user = create(:user)
    cuisine = create(:cuisine)
    meal = create(:meal)
    recipe = create(:recipe, user: user, cuisine: cuisine, meal: meal)
    another_recipe = create(:recipe, name: 'Generic Food', user: user,
                                     cuisine: cuisine, meal: meal)

    recipe.favorited_by << user
    10.times do
      another_recipe.favorited_by << create(:numbered_user)
    end

    visit root_path

    expect(page.text)
      .to match(/(#{another_recipe.name})[\s\S]*(#{recipe.name})|\2[\s\S]*\1/m)
  end
end
