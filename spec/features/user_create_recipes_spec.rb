require 'rails_helper'

feature 'User creates recipes' do

  scenario 'successfully' do
    recipe = build(:recipe)

    visit root_path

    click_on 'Cadastrar Receita'

    fill_in 'Nome',             with: recipe.name
    select recipe.cuisine.name ,      from: 'Cozinha'
    select recipe.meal.name,         from: 'Tipo de Comida'
    fill_in 'Porção',           with: recipe.portion
    fill_in 'Tempo de Preparo', with: recipe.preparation_time
    select I18n.t(recipe.difficulty, scope:[ :activerecord, :attributes,
                                :recipe, :difficulties]), from: 'Dificuldade'
    fill_in 'Ingredientes',     with: recipe.ingredients
    fill_in 'Instruções',       with: recipe.instructions
    click_on 'Criar Receita'

    expect(page).to have_content "Receita cadastrada com sucesso"
    expect(page).to have_content recipe.name
  end


  scenario 'and validates fields' do

    visit root_path

    click_on 'Cadastrar Receita'

    click_on 'Criar Receita'

    expect(page).to have_content "Não foi possível cadastrar a receita"
  end
end
