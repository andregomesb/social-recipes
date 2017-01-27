require 'rails_helper'

feature 'User view latest recipes in home' do
  scenario 'successfully' do
    cuisine = create(:cuisine)
    meal = create(:meal)
    recipe_first = create(:recipe, name: "Recipe out", cuisine: cuisine, meal:meal)
    20.times do |r|
      create(:numbered_recipes, cuisine: cuisine, meal:meal)
    end
    recipe_last = create(:recipe, name: "Recipe in", cuisine: cuisine, meal:meal)
    
    visit root_path

    expect(page).not_to have_content recipe_first.name
    expect(page).to have_content recipe_last.name
  end
end