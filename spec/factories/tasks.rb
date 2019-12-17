FactoryBot.define do
  factory :task do
    title { "イベント" }
    detaile { "イベント" }
  end

  factory :task2, class: "task" do
    title { "イベント2" }
    detaile { "イベント2" }
  end

  factory :task3, class: "task" do
    title { "イベント3" }
    detaile { "イベント3" }
  end
end
