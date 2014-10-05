class CreateAdminRoles < ActiveRecord::Migration
  def change
    create_table :admin_roles do |t|
      t.string :name
      t.text :permissions

      t.timestamps
    end
  end
end
