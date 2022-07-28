class CreateUsers < ActiveRecord::Migration[6.1]
=begin
    User table;
    Contains user info
    User-type parameter designates whether user is student, teacher, or admin

    *NOT user sign-in table (That is a devise gem-specific table)*
=end
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.integer :user_type # 1 = student, 2 = teacher, 3 = admin

      t.timestamps
    end
  end
end
