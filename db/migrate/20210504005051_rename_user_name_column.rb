class RenameUserNameColumn < ActiveRecord::Migration
  def change
    rename_column :user, :name, :first_name
  end
end
