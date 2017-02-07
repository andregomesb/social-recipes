require 'rails_helper'

feature 'User views recipes filtered by cuisine' do
  scenario 'successfully' do
    cuisine = create(:cuisine)
    recipe = create(:recipe, cuisine: cuisine)

    visit root_path

    click_on cuisine.name

    expect(page).to have_css('h1', text: cuisine.name)
    expect(page).to have_content recipe.name
  end

  scenario 'cuisine does not have recipes' do
    cuisine = create(:cuisine)

    visit root_path
    click_on cuisine.name

    expect(page).to have_css('h1', text: cuisine.name)
    expect(page).to have_content 'Nenhuma receita cadastrada'
  end
end
