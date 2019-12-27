class Task < ApplicationRecord
    has_many :task_labels, dependent: :destroy, foreign_key: 'task_id'
    has_many :labels, through: :task_labels, source: :label
    validates :title, presence: true
    validates :detaile, presence: true
    enum status: %i[未着手 着手済み 完了]
    enum priority: %i[高 中 低]
    scope :serch_title, -> (title) { where('title LIKE(?)', "%#{title}%")}
    scope :serch_status, -> (status) { where(status: (status))}
    scope :user_scope, -> (user) { where(user_id: user)}
    scope :search_label, -> (id) { where(id: id) }
    belongs_to :user 
end

