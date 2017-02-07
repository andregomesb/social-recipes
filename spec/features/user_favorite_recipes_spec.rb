require 'rails_helper'

feature 'User favorites recipe' do
  scenario 'successfully' do
    user = create(:user)
    cuisine = create(:cuisine)
    meal = create(:meal)
    create(:recipe, user: user, cuisine: cuisine, meal: meal)
    another_user = create(:user,
                          name: 'Joanne Doette',
                          email: 'joannedoette@example.com')
    another_recipe = create(:recipe, name: 'French Fries', user: another_user,
                                     cuisine: cuisine, meal: meal)
    log_in_user user

    visit root_path
    click_on another_recipe.name
    page.find('#favorite').click
    expect(user.favorites).to include(another_recipe)
    expect(page).to have_content 'Favoritado'
  end

  scenario 'click again and unfavorite' do
    user = create(:user)
    cuisine = create(:cuisine)
    meal = create(:meal)
    create(:recipe, user: user, cuisine: cuisine, meal: meal)
    another_user = create(:user,
                          name: 'Joanne Doette',
                          email: 'joannedoette@example.com')
    another_recipe = create(:recipe, name: 'French Fries', user: another_user,
                                     cuisine: cuisine, meal: meal)
    log_in_user user

    visit root_path
    click_on another_recipe.name
    page.find('#favorite').click
    page.find('#favorite').click
    expect(user.favorites).not_to include(another_recipe)
    expect(page).to have_content 'Desfavoritado'
  end
end
