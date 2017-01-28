def log_in_user user
  visit login_path
    fill_in 'Usuário', with: user.email
    fill_in 'Senha', with: user.password
    click_button 'Entrar'
end
