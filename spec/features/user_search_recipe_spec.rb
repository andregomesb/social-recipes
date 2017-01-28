require 'rails_helper'

feature 'User searches for a recipe' do
  scenario 'successfully' do
    recipe = create(:recipe)

    visit root_path

    fill_in 'Procurar', with: recipe.name
    click_on 'Procurar'

    expect(page).to have_content '1 resultado encontrado'
    expect(page).to have_content recipe.name
  end

  scenario 'and found multiples' do
    user = create(:user)
    cuisine = create(:cuisine)
    meal = create(:meal)
    recipe = create(:recipe, name: "Bolinho de arroz", cuisine: cuisine,
                    meal: meal, user: user)
    another_recipe = create(:recipe, name: "Arroz com lentilha",
                            cuisine: cuisine, meal: meal, user:user)
    search_term = 'arroz'

    visit root_path

    fill_in 'Procurar', with: search_term
    click_on 'Procurar'

    expect(page).to have_content '2 resultados encontrados'
    expect(page).to have_content recipe.name
    expect(page).to have_content another_recipe.name
  end

  scenario 'and found nothing' do
    recipe = create(:recipe)
    search_term = "COMPUTER"

    visit root_path

    fill_in 'Procurar', with: search_term
    click_on 'Procurar'

    expect(page).to have_content 'Nenhum resultado encontrado'
    expect(page).not_to have_content recipe.name
  end
end
