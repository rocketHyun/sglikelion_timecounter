class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.boolean :isshown, default: false
      t.string :content
      t.timestamps
    end
  end
end
