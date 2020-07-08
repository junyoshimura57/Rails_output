class ChangeExpencesNameAmountNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :expences, :name, false
    change_column_null :expences, :amount, false
  end
end
