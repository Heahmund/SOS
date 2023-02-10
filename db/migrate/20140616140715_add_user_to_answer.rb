class AddUserToAnswer < ActiveRecord::Migration[4.2]
  def change
    add_reference :answers, :user, index: true
  end
end
