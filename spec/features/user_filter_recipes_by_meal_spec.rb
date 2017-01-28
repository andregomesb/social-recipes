require 'rails_helper'

feature 'User views recipes by meal' do
  scenario 'successfully' do
    meal = create(:meal)
    recipe = create(:recipe, meal: meal)

    visit root_path

    click_on meal.name

    expect(page).to have_css('h1', text: meal.name)
    expect(page).to have_content recipe.name
  end

  scenario 'meal does not have recipes' do
    meal = create(:meal)

    visit root_path
    click_on meal.name

    expect(page).to have_css('h1', text: meal.name)
    expect(page).to have_content "Nenhuma receita cadastrada"
  end
end
