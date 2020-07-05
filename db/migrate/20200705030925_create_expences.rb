class CreateExpences < ActiveRecord::Migration[5.2]
  def change
    create_table :expences do |t|
      t.string :name
      t.integer :amount
      t.text :description

      t.timestamps
    end
  end
end
