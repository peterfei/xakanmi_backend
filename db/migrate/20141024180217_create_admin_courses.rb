class CreateAdminCourses < ActiveRecord::Migration
  def change
    create_table :admin_courses do |t|
      t.string :name
      t.belongs_to :category, index: true
      t.boolean :status
      t.date :startdate
      t.string :cid

      t.timestamps
    end
  end
end
