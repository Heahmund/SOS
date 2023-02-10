class AddQuestionIdToAttachment < ActiveRecord::Migration[4.2]
  def change
    add_column :attachments, :question_id, :integer
    add_index :attachments, :question_id
  end
end
