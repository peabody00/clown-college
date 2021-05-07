class RemoveStudentIdFromActivities < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :student_id, :integer
  end
end
