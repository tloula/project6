class Course < ApplicationRecord
    has_many :plan_courses
    has_many :plans, through: :plan_courses

    has_many :course_categories
    has_many :categories, through: :course_categories

    has_many :course_catalog
    has_many :catalogs, through: :course_catalog
end