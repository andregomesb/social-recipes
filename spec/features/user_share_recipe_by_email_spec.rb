require 'rails_helper'

feature 'User shares a recipe with a friend by email' do
  scenario 'successfully' do
    user = create(:user)
    recipe = create(:recipe, user:user)
    log_in_user user

    visit root_path

    click_on recipe.name

    fill_in 'Email', with: 'test@test.com'
    click_on 'Compartilhar Receita'


    expect(ActionMailer::Base.deliveries.last).to have_content recipe.name
    expect(ActionMailer::Base.deliveries.last).to have_content user.name
    expect(ActionMailer::Base.deliveries.last).to have_content user.email
    expect(ActionMailer::Base.deliveries.last).to have_content 'test@test.com'
  end
end
