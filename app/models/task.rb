class Task < ApplicationRecord
    validates :title, presence: true
    validates :detaile, presence: true
end
