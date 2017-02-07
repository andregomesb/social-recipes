require 'rails_helper'

feature 'User logout' do
  scenario 'successfully' do
    user = create(:user)

    visit root_path

    click_on 'Entrar'

    fill_in 'Usuário', with: user.email
    fill_in 'Senha', with: user.password

    click_button 'Entrar'
    click_on 'Sair'

    expect(page).to have_content 'Logout com sucesso'
    expect(page).to have_current_path(root_path)
  end
end
