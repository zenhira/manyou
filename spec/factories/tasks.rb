FactoryBot.define do
  factory :task do
    title { "イベント" }
    detaile { "イベント" }
    deadline { "2000-1-1" }
    status { 0 }
  end

  factory :task2, class: "task" do
    title { "イベント2" }
    detaile { "イベント2" }
    deadline { "2100-1-1" }
    status { 1 }
  end

  factory :task3, class: "task" do
    title { "イベント3" }
    detaile { "イベント3" }
    deadline { "1000-1-1" }
    status { 2 }
  end
end
