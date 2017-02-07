require 'rails_helper'

feature 'Admin deletes cuisine' do
  scenario 'successfully' do
    admin = create(:admin)
    cuisine = create(:cuisine)
    log_in_user admin

    visit root_path

    click_on cuisine.name
    click_on 'Deletar'

    expect(page).to have_content 'Cozinha deletada com sucesso'
    expect(page).to have_current_path root_path
  end
end
