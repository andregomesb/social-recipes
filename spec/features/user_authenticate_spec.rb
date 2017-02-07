require 'rails_helper'

feature 'User authenticates' do
  scenario 'successfully' do
    user = create(:user)

    visit root_path

    click_on 'Entrar'

    fill_in 'Usuário', with: user.email
    fill_in 'Senha', with: user.password
    click_button 'Entrar'

    expect(page).to have_content 'Logado com sucesso'
    expect(page).to have_content "Bem-vindo #{user.name}"
  end

  scenario 'welcome message only in user\'s profile' do
    user = create(:user)
    another_user = create(:user,
                          name: 'Joanne Doette',
                          email: 'joannedoette@example.com')

    visit login_path

    fill_in 'Usuário', with: user.email
    fill_in 'Senha', with: user.password
    click_button 'Entrar'

    visit user_path(another_user)

    expect(page).not_to have_content 'Logado com sucesso'
    expect(page).not_to have_content "Bem-vindo #{user.name}"
    expect(page).not_to have_css('h1', text: user.name)
    expect(page).to have_content another_user.name
  end

  scenario 'and no message if not logged in' do
    user = create(:user)

    visit user_path(user)

    expect(page).to have_content user.name
    expect(page).not_to have_content "Bem-vindo #{user.name}"
  end
end
