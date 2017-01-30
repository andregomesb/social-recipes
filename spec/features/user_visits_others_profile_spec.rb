require 'rails_helper'

feature 'User visits others profiles' do
  scenario 'successfully' do
    user = create(:user)
    visited_user = create(:user, name: 'Bob', email: 'bob@example.com')
    recipe = create(:recipe, user: visited_user)
    log_in_user user

    visit root_path

    click_on recipe.name
    click_on visited_user.name

    expect(page).to have_content visited_user.name
    expect(page).to have_content visited_user.city
    expect(page).to have_content "Receitas de #{visited_user.name}"
    expect(page).to have_link recipe.name
    expect(page).not_to have_content "Editar"
    expect(page).not_to have_content "Deletar"
  end
end
