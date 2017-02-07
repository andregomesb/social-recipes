require 'rails_helper'

feature 'User creates recipes' do
  scenario 'successfully' do
    user = create(:user)
    log_in_user user
    recipe = build(:recipe, user: user)

    visit root_path

    click_on 'Cadastrar Receita'

    fill_in 'Nome', with: recipe.name
    select recipe.cuisine.name, from: 'Cozinha'
    select recipe.meal.name, from: 'Tipo de Comida'
    fill_in 'Porção', with: recipe.portion
    fill_in 'Tempo de Preparo', with: recipe.preparation_time
    select I18n.t(recipe.difficulty, scope: [:activerecord, :attributes,
                                             :recipe, :difficulties]),
           from: 'Dificuldade'
    fill_in 'Ingredientes',     with: recipe.ingredients
    fill_in 'Instruções',       with: recipe.instructions
    click_on 'Criar Receita'

    expect(page).to have_content 'Receita cadastrada com sucesso'
    expect(page).to have_content recipe.name
    expect(page).to have_xpath("//img[contains(@src, 'missing.jpg')]")
  end

  scenario 'and validates fields' do
    user = create(:user)
    log_in_user user

    visit root_path

    click_on 'Cadastrar Receita'
    click_on 'Criar Receita'

    expect(page).to have_content 'Não foi possível cadastrar a receita'
  end
end
