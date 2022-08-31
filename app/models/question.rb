class Question < ApplicationRecord
  validates_presence_of :title
  has_many :answers
  belongs_to :correct_answer, class_name: "Answer", foreign_key: "correct_answer_id", optional: true
end
