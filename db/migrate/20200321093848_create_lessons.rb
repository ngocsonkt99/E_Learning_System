class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :user_id
      t.string :category_id
      t.string :result

      t.timestamps
    end
  end
end
