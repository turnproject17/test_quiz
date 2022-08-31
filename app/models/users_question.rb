class UsersQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :answer

  before_create :set_result

  private

  def set_result
    if question.correct_answer == answer
      self.result += 1
    end
  end
end
