class CreateStudentActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :student_activities do |t|
      t.references :student, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
