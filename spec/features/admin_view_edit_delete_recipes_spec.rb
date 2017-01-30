require 'rails_helper'

feature 'Admin views edit/delete of all recipes' do
  scenario 'successfully' do
    user = create(:user)
    recipe = create(:recipe, user: user)
    admin = create(:admin, name: 'Mr.Anderson', email: 'neo@admin.com')
    log_in_user admin

    visit recipe_path recipe

    expect(page).to have_link 'Editar'
    expect(page).to have_link 'Deletar'
  end

  scenario 'successfully' do
    recipe = create(:recipe)

    visit recipe_path recipe
  end
end
