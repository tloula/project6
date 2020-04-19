class CourseCatalog < ApplicationRecord
  belongs_to :course
  belongs_to :catalog
end
