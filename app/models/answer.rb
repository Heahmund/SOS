class Answer < ApplicationRecord
    belongs_to :question
    validates :body, :upvote, :question_id, presence: true
end
