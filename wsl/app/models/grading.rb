class Grading < ApplicationRecord
    belongs_to :user # student graders usertype = 1
    belongs_to :course
end
