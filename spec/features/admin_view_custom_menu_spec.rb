require 'rails_helper'

feature 'Admin view create cuisine/meal in menu' do
  scenario 'successfully' do
    admin = create(:admin)
    log_in_user admin

    visit root_path

    expect(page).to have_content 'Cadastrar Cozinha'
    expect(page).to have_content 'Cadastrar Tipo de Comida'
  end

  scenario 'users can\'t see cuisine/meal in menu' do
    user = create(:user)
    log_in_user user

    visit root_path

    expect(page).not_to have_content 'Cadastrar Cozinha'
    expect(page).not_to have_content 'Cadastrar Tipo de Comida'
  end

  scenario 'users can\'t access new cuisine path' do
    user = create(:user)
    log_in_user user

    visit new_cuisine_path

    expect(page).to have_current_path(root_path)
    expect(page).to have_content 'Acesso Negado'
  end

  scenario 'users can\'t access new meal path' do
    user = create(:user)
    log_in_user user

    visit new_meal_path

    expect(page).to have_current_path(root_path)
    expect(page).to have_content 'Acesso Negado'
  end

  scenario 'visitors can\'t see cuisine/meal in menu' do
    visit root_path

    expect(page).not_to have_content 'Cadastrar Cozinha'
    expect(page).not_to have_content 'Cadastrar Tipo de Comida'
  end

  scenario 'visitors can\'t access new cuisine path' do
    visit new_cuisine_path

    expect(page).to have_current_path(root_path)
    expect(page).to have_content 'Acesso Negado'
  end

  scenario 'visitors can\'t access new meal path' do
    visit new_meal_path

    expect(page).to have_current_path(root_path)
    expect(page).to have_content 'Acesso Negado'
  end
end
