class CreateCourses < ActiveRecord::Migration[6.1]
=begin
    Courses table;
    Includes all data about courses 
    and a foreign key to the user table (to designate the course instructor)
=end
  
  def change
    create_table :courses do |t|
      t.string :coursenum
      t.string :sectionnum
      t.string :coursename
      t.string :days
      t.string :starttime
      t.string :endtime
      t.integer :enrolled
      t.integer :waitlist
      t.references :user, null: false, foreign_key: true # teacherID

      t.timestamps
    end
  end
end
