class Teacher < ApplicationRecord
    has_secure_password
    has_many :courses
    has_many :activities

    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true

    def self.teacher_courses
        joins(:courses).group('teachers.last_name')
    end
end
