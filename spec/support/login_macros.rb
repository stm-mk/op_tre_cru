module LoginMacros
  def login_as(user)
    visit '/login'
    within "#login-form" do
      fill_in 'Email*', with: user.email
      fill_in 'Password*', with: '12345678'
      click_on 'ログイン'
    end
  end
end