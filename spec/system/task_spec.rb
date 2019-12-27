require 'rails_helper'

RSpec.describe "タスク管理機能", type: :system do
  before do #事前ログイン
    @task = FactoryBot.create(:task)
    @taskB = FactoryBot.create(:taskB)
    @taskC = FactoryBot.create(:taskC)
    @task2 = FactoryBot.create(:second_task)
    @task3 = FactoryBot.create(:third_task)
    @task4 = FactoryBot.create(:fourth_task)
    @task5 = FactoryBot.create(:fifth_task)
    visit new_session_path
    fill_in 'session_email', with: 'user1@test.com'
    fill_in 'session_password', with: 'password1'
    click_on 'login'
  end

  describe 'タスク一覧画面に遷移したら、作成済みのタスクが表示される' do
    context 'タスクを作成した場合' do
      FactoryBot.create(:task)
      it '作成済みのタスクが表示されること' do
        visit tasks_path
        expect(page).to have_content 'samplesampleA'
      end
    end
  end

  describe 'タスク登録画面で、必要項目を入力してcreateボタンを押したらデータが保存される' do
    context 'タスクを作成した場合' do
      # FactoryBot.create(:task)
      it 'タスクの新規作成' do
        visit new_task_path
        fill_in "title", with: 'aaa'
        fill_in "detaile", with: 'aaa'
        click_button '登録する'
        expect(page).to have_content 'aaa'
      end
    end
  end

describe 'タスク一覧画面で削除ボタンを押したら、タスクを削除する' do
  context '削除ボタンを押した場合' do
    it '削除される' do
      visit tasks_path
      click_button 'destroy', match: :first
      expect(page).to_not have_content 'testtesttest5'
    end
  end
end

describe 'タスク一覧画面で編集ボタンを押したら、タスクを編集する' do
  context '編集ボタンを押した場合' do
    it '編集される' do
      visit tasks_path
      click_link 'ログアウト'
      fill_in 'session_email', with: 'user5@test.com'
      fill_in 'session_password', with: 'password5'
      click_on 'login'
      click_on 'Edit', match: :first
      fill_in "title", with: "aaaaaaa"
      click_button '更新する'
      expect(page).to have_content 'Task was successfully updated.'
      expect(page).to have_content 'aaaaaaa'
    end
  end
end

  describe '任意のタスク詳細画面に遷移したら、該当タスクの内容が表示されたページに遷移する' do
    context 'タスクを作成した場合' do
      FactoryBot.create(:task)
      it 'タスクの詳細に繊維' do
        @task = FactoryBot.create(:task)
        visit task_path(@task)
        expect(page).to have_content 'samplesampleA'
      end
    end
  end

  describe '作成順' do
    context 'タスクを作成した場合' do
      it '作成日順' do
        visit tasks_path
        tds = page.all('td')
        expect(tds[0]).to have_content 'testtesttestC'
      end
    end
  end

  describe '終了期限ソート' do
    context 'タスクを作成した場合' do
      it 'indexでソート' do
        visit tasks_path
        click_link '終了期限でソートする'
        tds = page.all('td')
        expect(tds[0]).to have_content 'testtesttestA'
        expect(tds[8]).to have_content 'testtesttestB'
        expect(tds[16]).to have_content 'testtesttestC'
      end
    end
  end

  describe '両方検索' do
    context 'タスクを作成した場合' do
      it 'タイトルで検索' do
        visit tasks_path
        fill_in "title", with: 'testtesttestA'
        click_on '検索'
        tds = page.all('td')
        expect(tds[0]).to have_content 'testtesttestA'
      end
    end
  end

  describe 'status検索' do
    context 'タスクを作成した場合' do
      it 'ステータスだけで検索' do
        visit tasks_path
        find("option[value='0']").select_option
        click_on '検索'
        tds = page.all('td')
        expect(tds[0]).to have_content 'testtesttestA'
      end
    end
  end
end
