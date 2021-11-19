class Paper < ApplicationRecord
    scope :from_year , -> (year) { where("year = ?", year) }
    has_and_belongs_to_many :authors
    validates :title, presence: true
    validates :year, presence: true, numericality: { only_integer: true }
    validates :venue, presence: true

end
