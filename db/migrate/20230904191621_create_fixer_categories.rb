class CreateFixerCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :fixer_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :fixer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
