class Course < ApplicationRecord
    has_one :user # teacher usertype = 2
    has_many :user, through: :grading # has may gradings? users? usertype = 1
end
