require 'rails_helper'

RSpec.describe "タスク管理機能", type: :system do
  # before do
  #   FactoryBot.create(:task)
  #   @tasks = Task.all.order(created_at: :desc)
  # end

  describe '「タスク一覧画面に遷移したら、作成済みのタスクが表示される」' do
    context 'タスクを作成した場合' do
      FactoryBot.create(:task)
      it '作成済みのタスクが表示されること' do
        visit tasks_path

        expect(page).to have_content 'イベント'
      end
    end
  end

  describe '「タスク登録画面で、必要項目を入力してcreateボタンを押したらデータが保存される」' do
    context '' do
      FactoryBot.create(:task)
      it '' do
        visit new_task_path
        fill_in "title", with: 'aaa'
        fill_in "detaile", with: 'aaa'
        click_button '登録する'
        expect(page).to have_content 'aaa'
      end
    end
  end

  describe '任意のタスク詳細画面に遷移したら、該当タスクの内容が表示されたページに遷移する」' do
    context '' do
      FactoryBot.create(:task)
      it '' do
        @task = FactoryBot.create(:task)
        visit task_path(@task)
        expect(page).to have_content 'イベント'
      end
    end
  end

  describe '作成順' do
    context '' do
      FactoryBot.create(:task)
      FactoryBot.create(:task2)
      FactoryBot.create(:task3)
      it '' do
        visit tasks_path
        save_and_open_page
        tds = page.all('td')
        expect(tds[0]).to have_content 'イベント3'
      end
    end
  end

end
