require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  context 'GET index' do
    it 'succes response' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  context 'GET new' do
    it 'success response' do
      get :new
      expect(response.status).to eq(200)
    end
  end

  context 'POST new' do
    it 'success post' do
      post :create, params: { post: { title: 'Title', body: 'Some Text' } }
      expect(Post.all.size).to eq(1)
    end
  end

  context 'GET show' do
    it 'success response' do
      post = Post.create(title: 'Title', body: 'Some text')
      get :show, params: { id: post.id }
      expect(response.status).to eq(200)
    end
  end

end
