class CreateUserReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :user_reviews do |t|
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :fixer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
