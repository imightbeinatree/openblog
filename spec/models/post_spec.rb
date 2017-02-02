require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:author) }
  it { should respond_to(:user_id) }
  it { should belong_to(:author) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end
