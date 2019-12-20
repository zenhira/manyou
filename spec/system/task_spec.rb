require 'rails_helper'

RSpec.describe "タスク管理機能", type: :system do
  # before do
  #   FactoryBot.create(:task)
  #   @tasks = Task.all.order(created_at: :desc)
  # end

  describe 'タスク一覧画面に遷移したら、作成済みのタスクが表示される' do
    context 'タスクを作成した場合' do
      FactoryBot.create(:task)
      it '作成済みのタスクが表示されること' do
        visit tasks_path

        expect(page).to have_content 'イベント'
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

  describe '任意のタスク詳細画面に遷移したら、該当タスクの内容が表示されたページに遷移する' do
    context 'タスクを作成した場合' do
      FactoryBot.create(:task)
      it 'タスクの詳細に繊維' do
        @task = FactoryBot.create(:task)
        visit task_path(@task)
        expect(page).to have_content 'イベント'
      end
    end
  end

  describe '作成順' do
    context 'タスクを作成した場合' do
      it '作成日順' do
        FactoryBot.create(:task)
        FactoryBot.create(:task2)
        FactoryBot.create(:task3)
        visit tasks_path
        tds = page.all('td')
        expect(tds[0]).to have_content 'イベント3'
        save_and_open_page
      end
    end
  end

  describe '終了期限ソート' do
    context 'タスクを作成した場合' do
      it 'indexでソート' do
        FactoryBot.create(:task)
        FactoryBot.create(:task2)
        FactoryBot.create(:task3)
        visit tasks_path
        click_link '終了期限でソートする'
        # save_and_open_page
        tds = page.all('td')
        expect(tds[0]).to have_content 'イベント3'
        expect(tds[8]).to have_content 'イベント'
        expect(tds[16]).to have_content 'イベント2'
        # save_and_open_page
      end
    end
  end

  describe '両方検索' do
    context 'タスクを作成した場合' do
      it 'ステータスとタイトルで検索' do
        FactoryBot.create(:task)
        FactoryBot.create(:task2)
        FactoryBot.create(:task3)
        visit tasks_path
        fill_in "title", with: 'イベント2'
        find("option[value='1']").select_option
        click_on '検索'
        tds = page.all('td')
        expect(tds[0]).to have_content 'イベント2'
        # expect(page).to eq 1
      end
    end
  end

  describe 'status検索' do
    context 'タスクを作成した場合' do
      it 'ステータスだけで検索' do
        FactoryBot.create(:task)
        FactoryBot.create(:task2)
        FactoryBot.create(:task3)
        visit tasks_path
        find("option[value='0']").select_option
        click_on '検索'
        # save_and_open_page
        tds = page.all('td')
        expect(tds[0]).to have_content 'イベント'
        # expect(Task.serch_status("1").count).to eq 1
      end
    end
  end
end
