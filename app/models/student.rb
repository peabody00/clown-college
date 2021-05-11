class Student < ApplicationRecord
    has_secure_password
    has_many :schedules
    has_many :student_activities
    has_many :activities, through: :student_activities
    has_many :courses, through: :schedule
    # has_many :teachers, through: :activity
    # has_many :teachers, through: :schedule

    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
end
