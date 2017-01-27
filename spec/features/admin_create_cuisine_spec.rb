require 'rails_helper'

feature 'Admin creates cuisine' do

  scenario 'successfully' do
    cuisine = build(:cuisine)

    visit new_cuisine_path

    fill_in 'Cozinha', with: cuisine.name
    click_on 'Criar Cozinha'

    expect(page).to have_content 'Cozinha cadastrada com sucesso'
    expect(page).to have_content cuisine.name
  end

  scenario 'and validates field' do
    visit new_cuisine_path

    click_on 'Criar Cozinha'

    expect(page).to have_content 'Não foi possível cadastrar a cozinha'
  end

  scenario 'and is unique' do
    cuisine = create(:cuisine)

    visit new_cuisine_path

    fill_in 'Cozinha', with: cuisine.name
    click_on 'Criar Cozinha'

    expect(page).to have_content 'Não foi possível cadastrar a cozinha'
  end

  scenario 'and uniqueness is case insensitive'do
    cuisine = create(:cuisine)

    visit new_cuisine_path

    fill_in 'Cozinha', with: cuisine.name.downcase
    click_on 'Criar Cozinha'

    expect(page).to have_content 'Não foi possível cadastrar a cozinha'
  end
end
