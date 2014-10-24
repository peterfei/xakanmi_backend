class CreateAdminCategories < ActiveRecord::Migration
  def change
    create_table :admin_categories do |t|
      t.string :name
      t.string :catid
      t.text :desc

      t.timestamps
    end
  end
end
