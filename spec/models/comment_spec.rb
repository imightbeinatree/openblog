require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should respond_to(:body) }
  it { should respond_to(:author) }
  it { should respond_to(:user_id) }
  it { should respond_to(:post) }
  it { should respond_to(:post_id) }
  it { should belong_to(:author) }
  it { should belong_to(:post) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:post) }
  it { should validate_presence_of(:body) }
end
