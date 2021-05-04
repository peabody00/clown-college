class CreateActivities < ActiveRecord::Migration[6.0]
    def change
      create_table :activities do |t|
        t.string :name
        t.string :description
        t.integer :student_id
        t.integer :teacher_id
  
        t.timestamps
      end
    end
end