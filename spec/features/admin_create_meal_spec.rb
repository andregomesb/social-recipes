require 'rails_helper'

feature 'Admin creates meal' do

  scenario 'successfully' do
    meal = build(:meal)

    visit new_meal_path

    fill_in 'Tipo de Comida', with: meal.name
    click_on 'Criar Tipo de Comida'

    expect(page).to have_content 'Tipo de Comida cadastrada com sucesso'
    expect(page).to have_content meal.name
  end

  scenario 'and validates field' do
    visit new_meal_path

    click_on 'Criar Tipo de Comida'

    expect(page).to have_content 'Não foi possível cadastrar o tipo de comida'
  end

  scenario 'and is unique' do
    meal = create(:meal)

    visit new_meal_path

    fill_in 'Tipo de Comida', with: meal.name
    click_on 'Criar Tipo de Comida'

    expect(page).to have_content 'Não foi possível cadastrar o tipo de comida'
  end

  scenario 'and uniqueness is case insensitive'do
    meal = create(:meal)

    visit new_meal_path

    fill_in 'Tipo de Comida', with: meal.name.downcase
    click_on 'Criar Tipo de Comida'

    expect(page).to have_content 'Não foi possível cadastrar o tipo de comida'
  end
end
