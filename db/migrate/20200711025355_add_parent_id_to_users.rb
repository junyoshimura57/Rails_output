class AddParentIdToUsers < ActiveRecord::Migration[5.2]
  def up
    add_reference :users, :parent, index: true
  end

  def down
    remove_reference :users, :parent, index: true
  end

end
