require 'rails_helper'

feature 'Visitor creates a user' do
  scenario 'successfully' do
    user = build(:user)

    visit root_path

    click_on 'Inscreva-se'

    fill_in 'Nome', with: user.name
    fill_in 'Cidade', with: user.city
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    fill_in 'Confirme a senha', with: user.password_confirmation

    click_on 'Criar Usuário'

    expect(page).to have_content I18n.t(:success, scope: [:users, :create])
    expect(page).to have_content user.name
    expect(page).to have_content "Bem-vindo #{user.name}"
  end

  scenario 'validates field' do
    visit signup_path

    click_on 'Criar Usuário'

    expect(page).to have_content I18n.t(:error, scope: [:users, :create])
  end
end
