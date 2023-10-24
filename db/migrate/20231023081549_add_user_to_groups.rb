class AddUserToGroups < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :users, index: true
  end
end
