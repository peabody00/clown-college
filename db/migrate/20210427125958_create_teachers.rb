class CreateTeachers < ActiveRecord::Migration[6.0]
    def change
      create_table :teachers do |t|
        t.string :username
        t.string :first_name
        t.string :last_name
        t.string :department
        t.string :password_digest
  
        t.timestamps
      end
    end
end