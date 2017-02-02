# User Model Specifications
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:about_me) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should have_many(:posts) }
  it { should have_many(:comments) }

  describe 'public methods:' do
    describe 'display_name' do
      subject do
        described_class.new(password: 'testpass', email: 'test@user.com', first_name: 'Test', last_name: 'User')
      end
      it 'returns first and last name if they are available' do
        expect(subject.display_name).to eq 'Test User'
      end
      it 'returns first name only if last is not available but first is' do
        subject.last_name = nil
        expect(subject.display_name).to eq 'Test'
      end
      it 'returns last name only if first is not available but last is' do
        subject.first_name = nil
        expect(subject.display_name).to eq 'User'
      end
      it 'returns email only if first and last are not available' do
        subject.first_name = nil
        subject.last_name = nil
        expect(subject.display_name).to eq 'test@user.com'
      end
    end
  end
end
