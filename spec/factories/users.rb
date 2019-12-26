FactoryBot.define do
  factory :user do
    name { "user1" }
    email { "user1@test.com" }
    password { "password1" }
    admin { false }
  end
  factory :second_user, class: User do
    name { "user2" }
    email { "user2@test.com" }
    password { "password2" }
    admin { true }
  end
  factory :third_user, class: User do
    name { "user3" }
    email { "user3@test.com" }
    password { "password3" }
    admin { false }
  end
  factory :fourth_user, class: User do
    name { "user4" }
    email { "user4@test.com" }
    password { "password4" }
    admin { false }
  end
  factory :fifth_user, class: User do
    name { "user5" }
    email { "user5@test.com" }
    password { "password5" }
    admin { false }
  end
  factory :admin_user, class: User do
    name { 'admin' }
    email { 'admin@test.com' }
    password { 'adminpass' }
    admin { true }
  end
end