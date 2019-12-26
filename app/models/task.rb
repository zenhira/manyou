class Task < ApplicationRecord
    validates :title, presence: true
    validates :detaile, presence: true
    enum status: %i[未着手 着手済み 完了]
    enum priority: %i[高 中 低]
    scope :serch_title, -> (title) { where('title LIKE(?)', "%#{title}%")}
    scope :serch_status, -> (status) { where(status: (status))}
    scope :user_scope, -> (user) { where(user_id: user)}

    belongs_to :user 
end
