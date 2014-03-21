class CreateRodoCtes < ActiveRecord::Migration
  def change
    create_table :rodo_ctes do |t|
      t.column :number, :bigint
      t.datetime :emitted_at
      t.string :series
      t.float :amount
      t.float :weight
      t.column :cnpj, :bigint

      t.timestamps
    end
  end
end
