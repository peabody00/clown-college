class Course < ApplicationRecord
    belongs_to :teacher
    has_many :schedules
    has_many: students, through: :schedule
end
