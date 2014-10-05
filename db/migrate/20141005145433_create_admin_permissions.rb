class CreateAdminPermissions < ActiveRecord::Migration
  def change
    create_table :admin_permissions do |t|
      t.string :code
      t.string :subject
      t.string :action

      t.timestamps
    end
  end
end
