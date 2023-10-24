class RenameGroupColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :groups, :users_id, :user_id
  end
end
