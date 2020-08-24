class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.string :name
      t.bigint :amount
      t.timestamps
    end
  end
end
