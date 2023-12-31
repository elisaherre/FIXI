class CreateFixerReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :fixer_reviews do |t|
      t.text :content
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :fixer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
