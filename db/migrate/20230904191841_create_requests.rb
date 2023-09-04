class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :fixer, null: false, foreign_key: true
      t.string :status
      t.float :budget
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
