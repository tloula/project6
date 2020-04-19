class Category < ApplicationRecord
  #belongs_to :requirements

  has_many :course_categories
 	has_many :courses, through: :course_categories
end
