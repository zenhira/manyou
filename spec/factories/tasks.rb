FactoryBot.define do
  factory :task do
    title { 'testtesttestA' }
    detaile { 'samplesampleA' }
    deadline { Time.zone.today }
    status { "未着手" }
    priority { "高" }
    user { User.first || association(:user) }
  end
  factory :taskB, class: Task do
    title { 'testtesttestB' }
    detaile { 'samplesampleB' }
    deadline { Time.zone.today + 1 }
    status { "着手済み" }
    priority { "中" }
    user { User.first }
  end
  factory :taskC, class: Task do
    title { 'testtesttestC' }
    detaile { 'samplesampleC' }
    deadline { Time.zone.today + 2  }
    status { "完了" }
    priority { "低" }
    user { User.first }
  end
  factory :second_task, class: Task do
    title { 'testtesttest2' }
    detaile { 'samplesample2' }
    deadline { Time.zone.today + 3 }
    status { "完了" }
    priority { "高" }
    user { User.find_by(id: User.first.id + 1) || association(:second_user) }
  end
  factory :third_task, class: Task do
    title { 'testtesttest3' }
    detaile { 'samplesample3' }
    deadline { Time.zone.today + 4 }
    status { "未着手" }
    priority { "高" }
    user { User.find_by(id: User.first.id + 2) || association(:third_user) }
  end
  factory :fourth_task, class: Task do
    title { 'testtesttest4' }
    detaile { 'samplesample4' }
    deadline { Time.zone.today + 5 }
    status { "未着手" }
    priority { "高" }
    user { User.find_by(id: User.first.id + 3) || association(:fourth_user) }
  end
  factory :fifth_task, class: Task do
    title { 'testtesttest5' }
    detaile { 'samplesample5' }
    deadline { Time.zone.today + 6 }
    status { "未着手" }
    priority { "高" }
    user { User.find_by(id: User.first.id + 4) || association(:fifth_user) }
  end
end