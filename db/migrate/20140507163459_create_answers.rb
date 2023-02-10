class CreateAnswers < ActiveRecord::Migration[4.2]
  def change
    create_table :answers do |t|
      t.timestamps
    end
    add_column :answers, :body, :text
    add_column :answers, :question_id, :integer
    add_index :answers, :question_id
  end
end
