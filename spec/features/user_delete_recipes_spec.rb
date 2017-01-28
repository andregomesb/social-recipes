require 'rails_helper'

feature 'User deletes recipes' do
  scenario  'successfully' do
    user = create(:user)
    recipe = create(:recipe, user: user)
    log_in_user user

    visit root_path

    click_on 'Minhas Receitas'
    click_on 'Deletar'

    expect(page).to have_content 'Receita deletada com sucesso'
    expect(page).to have_current_path recipes_user_path(user)
  end

  scenario 'Delete recipe in it\'s own page' do
    user = create(:user)
    recipe = create(:recipe, user: user)
    log_in_user user

    visit root_path

    click_on 'Minhas Receitas'
    click_on recipe.name
    click_on 'Deletar'

    expect(page).to have_content 'Receita deletada com sucesso'
    expect(page).to have_current_path recipes_user_path(user)
  end

  scenario 'can\'t delete others recipes' do
    user = create(:user)
    cuisine = create(:cuisine)
    meal = create(:meal)
    recipe = create(:recipe, user: user, cuisine: cuisine, meal: meal)
    another_user = create(:user,
                          name: 'Joanne Doette',
                          email: 'joannedoette@example.com')
    another_recipe = create(:recipe, user: another_user, cuisine: cuisine,meal: meal)
    log_in_user user

    visit recipe_path another_recipe

    expect(page).not_to have_content 'Delete'
  end
end
