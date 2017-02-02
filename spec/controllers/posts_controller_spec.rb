require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Post. As you add validations to post, be sure to
  # adjust the attributes here as well.
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_attributes) { { title: 'test title', body: 'test body', user_id: user.id } }

  describe 'GET #index' do
    it 'assigns all posts as @posts' do
      post = Post.create! valid_attributes
      get :index, params: {}
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested post as @post' do
      post = Post.create! valid_attributes
      get :show, id: post.id
      expect(assigns(:post)).to eq(post)
    end
  end
end
