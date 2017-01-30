require 'rails_helper'

feature 'Admin edits meal' do
  scenario  'successfully' do
    admin = create(:admin)
    meal = create(:meal)
    log_in_user admin

    visit root_path

    click_on meal.name
    click_on 'Editar'
    fill_in 'Tipo de Comida', with: 'New Meal'
    click_on 'Atualizar Tipo de Comida'

    expect(page).to have_content 'Tipo de Comida atualizada com sucesso'
    expect(page).to have_content 'New Meal'
  end

  scenario 'validates field' do
    admin = create(:admin)
    meal = create(:meal)
    log_in_user admin

    visit root_path

    click_on meal.name
    click_on 'Editar'
    fill_in 'Tipo de Comida', with: ''
    click_on 'Atualizar Tipo de Comida'

    expect(page).to have_content "Não foi possível atualizar o tipo de comida"
  end
end
