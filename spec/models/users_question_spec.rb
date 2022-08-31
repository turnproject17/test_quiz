require 'rails_helper'

RSpec.describe UsersQuestion, type: :model do
  before(:all){
    @question = Question.create(title: 'First', description: 'First Question', attempt_duration: '1')
    @answer = @question.answers.create(title: 'Answer 1', active: 'true')
    @answer2 = @question.answers.create(title: 'Answer 2', active: 'true')
    @question.update(correct_answer: @answer2)
    @user = User.create(session_id: 'Bsbcxxkjas', full_name: 'John Smith', contact_number: '91 99999999')
  }

  describe 'validate' do
    it 'return for Answer validation error' do
      user_question = described_class.new(
        user: @user,
        question: @question
      )
      user_question.save
      expect(user_question.errors.full_messages.to_sentence).to eq("Answer must exist")
    end
  end

  describe 'Score' do
    it 'return user score if the answer is correct' do
      puts @user
      user_question = described_class.new(
        user: @user,
        question: @question,
        answer: @answer2,
      )
      puts @user.errors
      puts user_question.attributes
      user_question.save
      expect(user_question.user.score).to eq(1)
    end
  end
end
