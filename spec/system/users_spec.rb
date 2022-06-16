require 'rails_helper'

RSpec.describe 'ユーザー機能', type: :system do
  let(:user) { create(:user) }

  before do
    page.driver.browser.manage.window.resize_to(1280, 720)
  end

  context 'ログイン前' do
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

    it 'マイページに遷移したら、ログインページにリダイレクトされる' do

    end

    it 'フレンド募集要項に遷移したら、ログインページにリダイレクトされる' do

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
  end
end
