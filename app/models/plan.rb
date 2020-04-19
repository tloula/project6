class Plan < ApplicationRecord
    belongs_to(:user)

    belongs_to :major
    belongs_to :catalog

    has_many :plan_courses
 	has_many :courses, through: :plan_courses
end