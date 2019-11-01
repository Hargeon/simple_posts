require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validates' do
    it 'without title' do
      post = Post.new(body: 'Some text').save
      expect(post).to eq(false)
    end

    it 'without body' do
      post = Post.new(title: 'Some text').save
      expect(post).to eq(false)
    end
  end

  context 'sopes' do
    it 'active_posts' do
      Post.create(title: 'Title', body: 'Some text', active: true)
      expect(Post.active_posts.size).to eq(1)
    end

    it 'inactive_posts' do
      Post.create(title: 'Title', body: 'Some text', active: false)
      expect(Post.inactive_posts.size).to eq(1)
    end
  end

  context 'callbacks' do
    it 'default active' do
      Post.create(title: 'Title', body: 'Some text')
      expect(Post.active_posts.size).to eq(1)
    end
  end
end
