class AddUserToQuestions < ActiveRecord::Migration[4.2]
  def change
    add_reference :questions, :user, index: true
  end
end
