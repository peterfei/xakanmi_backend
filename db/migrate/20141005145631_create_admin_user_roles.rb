class CreateAdminUserRoles < ActiveRecord::Migration
  def change
    create_table :admin_user_roles do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end
	add_column :users, :permissions,  :text

  end
end
