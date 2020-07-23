class AddCategoryToExpences < ActiveRecord::Migration[5.2]
  def change
    add_column :expences, :category, :string
  end
end
