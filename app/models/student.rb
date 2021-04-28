class Student < ApplicationRecord
    has_secure_password
    has_one :schedule
    has_many :activities
    has_many :courses, through: :schedule
    has_many :teachers, through: :activity
    # has_many :teachers, through: :schedule

end
