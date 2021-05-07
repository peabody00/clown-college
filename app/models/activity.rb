class Activity < ApplicationRecord
    has_many :student_activities
    has_many :students, through: :student_activities
    belongs_to :teacher
end
