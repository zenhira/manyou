require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task1 = FactoryBot.create(:task)
    @task2 = FactoryBot.create(:task2)
    @task3 = FactoryBot.create(:task3)
  end

  it "タイトルが空だったら、保存されない" do
    task = Task.new(title: "", detaile: "qqq")
    expect(task).not_to be_valid
  end

  it "ディテールが空だったら、保存されない" do
    task = Task.new(title: "qqq", detaile: "")
    expect(task).not_to be_valid
  end

  it "scope serch_title" do
    tasks = Task.serch_title(@task2.title)
    expect(tasks.count).to eq 1
    expect(tasks[0]).to eq @task2
  end

  it "scope serch_status" do
    tasks = Task.serch_status(@task2.status)
    expect(tasks.count).to eq 1
    expect(tasks[0]).to eq @task2
  end

  it "scope .serch_title(title).serch_status(status)" do
    tasks = Task.serch_title("イベント").serch_status(@task2.status)
    expect(tasks.count).to eq 1
    expect(tasks[0]).to eq @task2
  end
  
end

