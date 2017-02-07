require 'rails_helper'

feature 'Admin deletes meal' do
  scenario 'successfully' do
    admin = create(:admin)
    meal = create(:meal)
    log_in_user admin

    visit root_path

    click_on meal.name
    click_on 'Deletar'

    expect(page).to have_content 'Tipo de Cozinha deletada com sucesso'
    expect(page).to have_current_path root_path
  end
end
