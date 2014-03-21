class CreateCteAllocations < ActiveRecord::Migration
  def change
    create_table :cte_allocations do |t|
      t.references :ferro_cte, index: true
      t.references :rodo_cte, index: true
      t.float :weight

      t.timestamps
    end
  end
end
