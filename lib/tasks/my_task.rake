namespace :custom do
  desc 'Top 5 posts'

  task create_top: :environment do
    posts = Post.select('posts.id, count(comments.commentable_id)')
                .joins(:comments)
                .group('posts.id')
                .order('count(comments.commentable_id) DESC')
                .limit(5)
    posts.each { |post| puts "#{post.id} #{post.count}" }
  end
end
