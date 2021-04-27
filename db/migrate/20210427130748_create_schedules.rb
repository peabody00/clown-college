class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.string :semester

      t.timestamps
    end
  end
end
