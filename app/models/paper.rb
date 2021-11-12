class Paper < ApplicationRecord
    validates :title, presence: true
    validates :year, presence: true, only_integer: true
    validates :venue, presence: true

end
