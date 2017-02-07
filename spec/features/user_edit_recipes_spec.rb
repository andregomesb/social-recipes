require 'rails_helper'

feature 'User edits recipes' do
  scenario 'successfully' do
    user = create(:user)
    create(:recipe, user: user)
    log_in_user user

    visit root_path

    click_on 'Minhas Receitas'
    click_on 'Editar'
    click_on 'Atualizar Receita'

    expect(page).to have_content 'Receita atualizada com sucesso'
  end

  scenario 'Edit recipe in it\'s own page' do
    user = create(:user)
    recipe = create(:recipe, user: user)
    log_in_user user

    visit root_path

    click_on 'Minhas Receitas'
    click_on recipe.name
    click_on 'Editar'
    fill_in 'Nome', with: 'Nova Receita'
    click_on 'Atualizar Receita'

    expect(page).to have_content 'Receita atualizada com sucesso'
    expect(page).to have_content 'Nova Receita'
    expect(page).not_to have_content recipe.name
  end

  scenario 'validates fields' do
    user = create(:user)
    recipe = create(:recipe, user: user)
    log_in_user user

    visit root_path

    click_on 'Minhas Receitas'
    click_on recipe.name
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Atualizar Receita'
    expect(page).to have_content 'Não foi possível atualizar a receita'
  end

  scenario 'can\'t edit others recipes' do
    user = create(:user)
    cuisine = create(:cuisine)
    meal = create(:meal)
    create(:recipe, user: user, cuisine: cuisine, meal: meal)
    another_user = create(:user,
                          name: 'Joanne Doette',
                          email: 'joannedoette@example.com')
    another_recipe = create(:recipe, user: another_user, cuisine: cuisine,
                                     meal: meal)
    log_in_user user

    visit recipe_path another_recipe

    expect(page).not_to have_content 'Editar'
  end

  scenario 'can\'t visit others recipes boards' do
    user = create(:user)
    cuisine = create(:cuisine)
    meal = create(:meal)
    create(:recipe, user: user, cuisine: cuisine, meal: meal)
    another_user = create(:user,
                          name: 'Joanne Doette',
                          email: 'joannedoette@example.com')
    another_recipe = create(:recipe, user: another_user, cuisine: cuisine,
                                     meal: meal)
    log_in_user user

    visit recipes_user_path another_recipe

    expect(page).to have_content 'Acesso Negado'
    expect(page).to have_current_path root_path
  end

  scenario 'go to recipe board after being denied' do
    user = create(:user)
    cuisine = create(:cuisine)
    meal = create(:meal)
    recipe = create(:recipe, user: user, cuisine: cuisine, meal: meal)
    another_user = create(:user,
                          name: 'Joanne Doette',
                          email: 'joannedoette@example.com')
    another_recipe = create(:recipe, user: another_user, cuisine: cuisine,
                                     meal: meal)
    log_in_user user

    visit recipes_user_path another_recipe
    visit recipes_user_path recipe

    expect(page).not_to have_current_path root_path
    expect(page).to have_content 'Minhas Receitas'
  end
end
