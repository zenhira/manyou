FactoryBot.define do
  factory :label do
    title { "Rails" }
  end
  factory :label2, class: Label do
    title { "Ruby" }
  end
  factory :label3, class: Label do
    title { "HTML" }
  end
  factory :label4, class: Label do
    title { "CSS" }
  end
  factory :label5, class: Label do
    title { "javascript" }
  end
end