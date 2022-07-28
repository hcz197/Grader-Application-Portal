class CreateGradings < ActiveRecord::Migration[6.1]

=begin
  Grading table --> Relationship
  Designates relationship between student graders and courses they TA for;
  Foreign key to both course & User table to link graders & courses;
  Parameter isGrading --> 
    If false, student is interested in grading for that course
    If true, student is grading for that course; change made by admin
=end
  def change
    create_table :gradings do |t|
      t.references :course, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true # usertype = 1

      t.boolean :isGrading, :default => false

      t.timestamps
    end
  end
end
