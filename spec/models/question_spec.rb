require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'validate' do
    it 'return for title validation error' do
      question = described_class.new(
        description: 'First Question',
        attempt_duration: '1'
      )
      question.save
      expect(question.errors.full_messages.to_sentence).to eq("Title can't be blank")
    end
  end

  describe 'answers' do
    before(:all){
      Question.create(title: 'First', description: 'First Question', attempt_duration: '1')
    }

    it 'return answers for a question' do
      Question.first.answers.create(title: "First answer") 
      Question.first.answers.create(title: "second answer") 
      expect(Question.first.answers.count).to eq(2)
    end

    it 'return Correct answer' do
      Question.first.answers.create(title: "First answer")
      Question.first.answers.create(title: "second answer")
      answer = Question.first.answers.create(title: "third answer")
      Question.first.update(correct_answer_id: answer.id)
      expect(Question.first.correct_answer.title).to eq(answer.title)
    end
  end
end
