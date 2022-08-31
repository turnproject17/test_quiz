require 'rails_helper'

RSpec.describe Answer, type: :model do
  before(:all){
    Question.create(title: 'First', description: 'First Question', attempt_duration: '1')
  }

  describe 'validate' do
    it 'return for title validation error' do
      answer = described_class.new(
        active: 'true',
        question: Question.first
      )
      answer.save
      expect(answer.errors.full_messages.to_sentence).to eq("Title can't be blank")
    end
  end
end
