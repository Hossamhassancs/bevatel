class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.references :school, null: false, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
