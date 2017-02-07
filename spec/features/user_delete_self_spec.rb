require 'rails_helper'

feature 'User deletes account' do
  scenario 'successfully' do
    user = create(:user)
    log_in_user user

    visit root_path

    click_on 'Configurações'
    click_on 'Deletar Conta'

    expect(page).to have_content 'Usuário deletado com sucesso'
    expect(page).to have_current_path root_path
    expect(User.where(id: user.id)).to eq []
  end
end
