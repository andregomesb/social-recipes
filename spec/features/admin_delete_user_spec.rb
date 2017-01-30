require 'rails_helper'

feature 'Admin deletes user' do
  scenario  'successfully' do
    user = create(:user)
    admin = create(:admin, email:'master@example.com')
    log_in_user admin

    visit edit_user_path(user)
    click_on 'Deletar Conta'

    expect(page).to have_content 'Usuário deletado com sucesso'
    expect(page).to have_current_path root_path
    expect(User.where(id: user.id)).to eq []
  end
end
