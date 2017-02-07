require 'rails_helper'

feature 'User updates profile information' do
  scenario 'successfully' do
    user = create(:user)
    log_in_user user

    visit root_path
    click_on 'Configurações'
    fill_in 'Senha', with: user.password
    fill_in 'Confirme a senha', with: user.password
    click_on 'Atualizar Usuário'

    expect(page).to have_content 'Usuário atualizado com sucesso'
  end

  scenario 'User doesn\'t need to retype the password' do
    user = create(:user)
    log_in_user user

    visit root_path
    click_on 'Configurações'
    click_on 'Atualizar Usuário'

    expect(page).to have_content 'Usuário atualizado com sucesso'
  end

  scenario 'fields should be valid' do
    user = create(:user)

    visit edit_user_path user
    fill_in 'Nome', with: ''
    fill_in 'Cidade', with: ''
    fill_in 'Email', with: ''
    click_on 'Atualizar Usuário'
    expect(page).to have_content 'Não foi possível atualizar o usuário'
  end
end
