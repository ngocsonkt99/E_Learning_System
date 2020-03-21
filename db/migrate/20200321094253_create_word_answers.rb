class CreateWordAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :word_answers do |t|
      t.string :content
      t.string :category_id

      t.timestamps
    end
  end
end
