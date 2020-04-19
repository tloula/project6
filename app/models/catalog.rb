class Catalog < ApplicationRecord
    has_many :course_catalog
 	has_many :courses, through: :course_catalog
end
