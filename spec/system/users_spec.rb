require 'rails_helper'

RSpec.describe 'ユーザー機能', type: :system do
  let(:user) { create(:user) }

  before do
    page.driver.browser.manage.window.resize_to(1280, 720)
  end

  fcontext 'ログイン前' do
=begin
    it '未ログイン状態でヘッダーに「ユーザー登録」、「ログイン」ボタンが表示されている' do
      visit root_path
      expect(page).to have_selector('#login-btn')
      expect(page).to have_selector('#singin-btn')
    end

    it 'ユーザー登録ページで各フィールドを入力して「登録」をクリックしたらユーザーが登録されている' do
      visit root_path
      find('#singin-btn').click
      within '#register-form' do
        fill_in 'Name*', with: 'test'
        fill_in 'Email*', with: 'test@example.com'
        fill_in 'Password*', with: 'password'
        fill_in 'Password（確認）*', with: 'password'
        click_button '登録'
      end
      expect(page).to have_current_path('/login')
    end

    it '名前が未入力の場合、ユーザー新規登録が失敗する' do
      visit root_path
      find('#singin-btn').click
      within '#register-form' do
        fill_in 'Name*', with: nil
        fill_in 'Email*', with: 'test@example.com'
        fill_in 'Password*', with: 'password'
        fill_in 'Password（確認）*', with: 'password'
        click_button '登録'
      end
      expect(page).to have_current_path('/register')
    end

    it 'メールアドレスが未入力の場合、ユーザー新規登録が失敗する' do
      visit root_path
      find('#singin-btn').click
      within '#register-form' do
        fill_in 'Name*', with: 'test'
        fill_in 'Email*', with: nil
        fill_in 'Password*', with: 'password'
        fill_in 'Password（確認）*', with: 'password'
        click_button '登録'
      end
      expect(page).to have_current_path('/register')
    end

    it '登録済のメールアドレスを使用した場合、ユーザー新規登録が失敗する' do
      visit root_path
      find('#singin-btn').click
      within '#register-form' do
        fill_in 'Name*', with: 'test'
        fill_in 'Email*', with: user.email
        fill_in 'Password*', with: 'password'
        fill_in 'Password（確認）*', with: 'password'
        click_button '登録'
      end
      expect(page).to have_current_path('/register')
    end

    it '登録済みのユーザーならログインできる' do
      visit '/login'
      within "#login-form" do
        fill_in 'Email*', with: user.email
        fill_in 'Password*', with: '12345678'
        click_button 'ログイン'
      end
      expect(page).to have_current_path('/'), 'タスクページに遷移できていません'
    end

    it 'フレンド募集要項に遷移したら、ログインページにリダイレクトされる' do
      visit root_path
      find('#my-post-card').click
      expect(page).to have_current_path('/login')
    end
=end

    it 'ユーザー登録フォームでバリデーションが機能していること' do
      visit root_path
      find('#singin-btn').click
      within "#register-form" do
        fill_in 'Name*', with: ' '
        expect(page).to have_content('名前は必須項目です')
        fill_in 'Email*', with: ' '
        expect(page).to have_content('メールアドレスは必須項目です')
        fill_in 'Email*', with: 'password'
        expect(page).to have_content('メールアドレスの形式で入力してください')
        fill_in 'Password*', with: ' '
        expect(page).to have_content('パスワードは必須項目です')
        fill_in 'Password（確認）*', with: ' '
        expect(page).to have_content('確認用パスワードは必須項目です')
        fill_in 'Password（確認）*', with: 'aa'
        expect(page).to have_content('確認用パスワードは6文字以上で入力してください')
        fill_in 'Password*', with: 'password'
        fill_in 'Password（確認）*', with: 'passwordpassword'
        expect(page).to have_content('パスワードと一致しません')
      end
    end

    it 'ログインフォームでバリデーションが機能していること' do
      visit root_path
      find('#login-btn').click
      within "#login-form" do
        fill_in 'Email*', with: ' '
        expect(page).to have_content('メールアドレスは必須項目です')
        fill_in 'Email*', with: 'password'
        expect(page).to have_content('メールアドレスの形式で入力してください')
        fill_in 'Password*', with: ' '
        expect(page).to have_content('パスワードは必須項目です')
        fill_in 'Password*', with: 'aa'
        expect(page).to have_content('パスワードは6文字以上で入力してください')
      end
    end
  end

  context 'ログイン後' do
    before do
      login_as(user)
    end

    it 'ログイン状態でヘッダーに「マイページ」、「ログアウト」ボタンが表示されている' do
      visit root_path
      expect(page).to have_selector('#logout-btn')
      expect(page).to have_selector('#mypage-btn')
    end

    it 'ログアウトできる' do
      visit root_path
      find('#logout-btn').click
      expect(page).to have_selector("#login-btn")
      expect(page).to have_current_path('/')
    end

    it 'プロフィール編集ができる' do
      visit '/mypage'
      fill_in 'Name', with: 'テストユーザー'
      fill_in 'ID', with: '123456789'
      fill_in 'Level', with: '500'
      # file_path = Rails.root.join('spec', 'fixtures', 'images', 'pipo-boss001.png')
      # attach_file('avatar_form', file_path)
      click_button '更新'
      # expect(page).to have_selector("img[src$='pipo-boss001.png']")
      expect(page).to have_field 'Name', with: 'テストユーザー'
      expect(page).to have_field 'Level', with: '500'
      expect(page).to have_field 'ID', with: '123456789'
    end
  end
end
