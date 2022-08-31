require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate' do
    before(:all){
      User.create(session_id: 'Bsbcxxkjas', full_name: 'John Smith', contact_number: '91 99999999')
    }

    it 'return for contact number validation error' do
      user = described_class.new(
          session_id: "asbcxxkjas",
          full_name: "K John"
        )
      user.save
      expect(user.errors.full_messages.to_sentence).to eq("Contact number can't be blank")
    end

    it 'return for session id, fullname and contact number validation error' do
      user = described_class.new(
          session_id: "asbcxxkjas",
          contact_number: "91 9876543312"
        )
      user.save
      expect(user.errors.full_messages.to_sentence).to eq("Full name can't be blank")
    end

    it 'return for session id validation error' do
      user = described_class.new(
          full_name: "K John",
          contact_number: "91 9876543312"
        )
      user.save
      expect(user.errors.full_messages.to_sentence).to eq("Session can't be blank")
    end

    it 'return for session id uniqueness validation error' do
      user = described_class.new(
          session_id: "Bsbcxxkjas",
          full_name: "John Smith",
          contact_number: "91 9876543312"
        )
      user.save
      expect(user.errors.full_messages.to_sentence).to eq("Session has already been taken")
    end
  end
end
