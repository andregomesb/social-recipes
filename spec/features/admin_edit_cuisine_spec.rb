require 'rails_helper'

feature 'Admin edits cuisine' do
  scenario  'successfully' do
    admin = create(:admin)
    cuisine = create(:cuisine)
    log_in_user admin

    visit root_path

    click_on cuisine.name
    click_on 'Editar'
    fill_in 'Cozinha', with: 'New_cuisine'
    click_on 'Atualizar Cozinha'

    expect(page).to have_content 'Cozinha atualizada com sucesso'
    expect(page).to have_content 'New_cuisine'
  end

  scenario 'validates field' do
    admin = create(:admin)
    cuisine = create(:cuisine)
    log_in_user admin

    visit root_path

    click_on cuisine.name
    click_on 'Editar'
    fill_in 'Cozinha', with: ''
    click_on 'Atualizar Cozinha'

    expect(page).to have_content "Não foi possível atualizar a cozinha"
  end
end
