class CreateFerroCtes < ActiveRecord::Migration
  def change
    create_table :ferro_ctes do |t|
      t.column :number, :bigint
      t.string :series
      t.float :weight

      t.timestamps
    end
  end
end
