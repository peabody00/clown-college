class AddInfoToStudents < ActiveRecord::Migration[6.0]
    def change
      add_column :students, :uid, :string
      add_column :students, :provider, :string
      add_column :students, :activity_id, :integer
    end
end