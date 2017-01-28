require 'rails_helper'

feature 'User views recipes' do

  scenario 'successfully' do
    user = create(:user)
    recipe = create(:recipe, user: user)

    visit root_path

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.meal.name
    expect(page).to have_content recipe.cuisine.name
    expect(page).to have_content I18n.t(recipe.difficulty,
                                        scope:[ :activerecord, :attributes,
                                                :recipe, :difficulties])
  end

  scenario 'and view a list of recipes' do
    user = create(:user)
    cuisine = create(:cuisine)
    meal = create(:meal)
    recipe = create(:recipe, cuisine: cuisine, meal:meal, user:user)
    another_recipe = create(:recipe, name: "Another Recipe", cuisine: cuisine,
                           meal: meal, user: user)

    visit root_path

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.meal.name
    expect(page).to have_content recipe.cuisine.name
    expect(page).to have_content I18n.t(recipe.difficulty,
                                        scope:[ :activerecord, :attributes,
                                                :recipe, :difficulties])

    expect(page).to have_content another_recipe.name
    expect(page).to have_content another_recipe.meal.name
    expect(page).to have_content another_recipe.cuisine.name
    expect(page).to have_content I18n.t(another_recipe.difficulty,
                                        scope:[ :activerecord, :attributes,
                                                :recipe, :difficulties])
  end
end
