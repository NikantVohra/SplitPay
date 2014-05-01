class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :type
      t.float :amount

      t.timestamps
    end
  end
end
