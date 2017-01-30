require 'rails_helper'

feature 'Admin creates cuisine' do

  scenario 'successfully' do
    admin = create(:admin)
    log_in_user admin
    cuisine = build(:cuisine)

    visit new_cuisine_path

    fill_in 'Cozinha', with: cuisine.name
    click_on 'Criar Cozinha'

    expect(page).to have_content 'Cozinha cadastrada com sucesso'
    expect(page).to have_content cuisine.name
  end

  scenario 'and validates field' do
    admin = create(:admin)
    log_in_user admin
    visit new_cuisine_path

    click_on 'Criar Cozinha'

    expect(page).to have_content 'Não foi possível cadastrar a cozinha'
  end

  scenario 'and is unique' do
    admin = create(:admin)
    log_in_user admin
    cuisine = create(:cuisine)

    visit new_cuisine_path

    fill_in 'Cozinha', with: cuisine.name
    click_on 'Criar Cozinha'

    expect(page).to have_content 'Não foi possível cadastrar a cozinha'
  end

  scenario 'and uniqueness is case insensitive'do
    admin = create(:admin)
    log_in_user admin
    cuisine = create(:cuisine)

    visit new_cuisine_path

    fill_in 'Cozinha', with: cuisine.name.downcase
    click_on 'Criar Cozinha'

    expect(page).to have_content 'Não foi possível cadastrar a cozinha'
  end
end
