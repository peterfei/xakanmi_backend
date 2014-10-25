class CreateAdminStudents < ActiveRecord::Migration
  def change
    create_table :admin_students do |t|
      t.string :snum
      t.string :major
      t.belongs_to :category, index: true
      t.boolean :sex
      t.belongs_to :user, index: true
      t.belongs_to :course, index: true

      t.timestamps
    end
  end
end
