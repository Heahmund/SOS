FactoryBot.define do
  factory :answer do
    body { 'MyText' }
    upvote { 1 }
    question_id { 1 }
  end
end
