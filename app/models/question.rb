class Question < ActiveRecord::Base
  has_many :answers, -> { includes :attachments }
  has_many :attachments, as: :attachmentable
  has_many :comments, as: :commentable
  belongs_to :user

  validates :title, :body, presence: true

  accepts_nested_attributes_for :attachments

  after_create :update_reputation
  def calculate_reputation
    reputation = Reputation.calculate(self)
    self.user.update(reputation: reputation)
  end
  private

  def update_reputation
    self.calculate_reputation
  end


end
