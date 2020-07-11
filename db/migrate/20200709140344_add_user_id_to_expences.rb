class AddUserIdToExpences < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM expences'
    add_reference :expences, :user, null: false, index: true
  end

  def down
    remove_reference :expences, :user, index: true
  end
end
