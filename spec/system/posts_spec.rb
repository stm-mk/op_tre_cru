require 'rails_helper'

RSpec.describe "ポスト管理", type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  before do
    page.driver.browser.manage.window.resize_to(1280, 720)
  end

  describe 'myPostについて' do
    before { login_as(user) }
    it 'トップページからタスクページに遷移できる' do
      visit root_path
      find('#my-post-card').click
      expect(current_path).to eq('/mypost')
      expect(page).to have_content('フレンド募集要項がありません。')
      expect(page).to have_content('新規作成')
    end

    it '作成したタスクがタスクページに表示されている' do
      create(:post, title: 'テスト１', description: '本文１', user: user)
      visit '/mypost'
      expect(page).to have_field 'Title', with: 'テスト１'
      expect(page).to have_field 'あいさつ', with: '本文１'
    end

    it '新規作成をクリックして、ポスト作成モーダルが表示されている' do
      visit '/mypost'
      click_button('新規作成')
      expect(page).to have_selector('#post-create-modal')
    end

    it 'ポスト作成モーダル表示状態で「閉じる」をクリックするとモーダルが非表示になる' do
      visit '/mypost'
      click_button('新規作成')
      expect(page).to have_selector('#post-create-modal')
      click_button('閉じる')
      expect(page).to_not have_selector('#post-create-modal')
    end

    it 'タイトル・フレンドレベル・あいさつを入力して「追加」をクリックしたら新しいタスクが追加されている' do
      visit '/mypost'
      click_button('新規作成')
      fill_in 'Title', with: 'フレンド募集'
      fill_in 'Friend Level', with: '300'
      fill_in 'あいさつ', with: 'よろしくお願いします'
      click_on '追加'
      expect(page).to_not have_selector('#posst-create-modal')
      within "#my-post-detail-modal" do
        expect(page).to have_field 'Title', with: 'フレンド募集'
        expect(page).to have_field 'Friend Level', with: '300'
        expect(page).to have_field 'あいさつ', with: 'よろしくお願いします'
      end
    end
  
    it 'タイトルを入力せず「追加」をクリックしたら新しいポストが追加されず、モーダルも閉じない' do
      visit '/mypost'
      click_button('新規作成')
      sleep 0.5
      click_on '追加'
      expect(page).to have_selector('#post-create-modal')
    end

    it 'ポストが存在する場合「編集」ボタン、「削除」ボタンが表示されていること' do
      create(:post, title: 'テスト１', description: '本文１', user: user)
      visit '/mypost'
      within "#my-post-detail-modal" do
        expect(page).to have_button('編集')
        expect(page).to have_button('削除')
      end
    end

    it '「編集」ボタンを押すとモーダルが表示され、各フィールドの値を変更して「更新」ボタンを押すとその内容が反映される' do
      create(:post, title: 'テスト１', description: '本文１', user: user)
      visit '/mypost'
      click_button ('編集')
      sleep 0.5 # Bootstrapのモーダル対応
      expect(page).to have_selector("#my-post-edit-modal")
      within "#my-post-edit-modal" do
        fill_in 'Title', with: 'フレンド募集'
        fill_in 'Friend Level', with: '300'
        fill_in 'あいさつ', with: 'よろしくお願いします'
        click_on '更新'
      end
      sleep 0.5 # Bootstrapのモーダル対応
      expect(page).to_not have_selector("#my-post-edit-modal")
      within "#my-post-detail-modal" do
        expect(page).to have_field 'Title', with: 'フレンド募集'
        expect(page).to have_field 'Friend Level', with: '300'
        expect(page).to have_field 'あいさつ', with: 'よろしくお願いします'
      end
    end

    it '「削除」ボタンを押すとポストがmypostから削除される' do
      create(:post, title: 'テスト１', description: '本文１', user: user)
      visit '/mypost'
      click_on '削除'
      within "#my-post-detail-modal" do
        expect(page).to_not have_field 'Title', with: 'テスト１'
        expect(page).to_not have_field 'あいさつ', with: '本文１'
        expect(page).to have_content('フレンド募集要項がありません。')
      end
    end
  end
end
