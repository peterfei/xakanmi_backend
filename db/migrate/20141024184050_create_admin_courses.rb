class CreateAdminCourses < ActiveRecord::Migration
  def change
    create_table :admin_courses,:force=>true do |t|
      t.string :name
      t.belongs_to :category, index: true
      t.string :courseid
      t.integer :total
      t.string :address
      t.date :coursedate
      t.integer :score

      t.timestamps
    end
  end
end
