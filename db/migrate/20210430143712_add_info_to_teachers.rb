class AddInfoToTeachers < ActiveRecord::Migration[6.0]
    def change
      add_column :teachers, :access_code, :string
    end
end