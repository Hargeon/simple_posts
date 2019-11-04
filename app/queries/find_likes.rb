class FindLikes
  attr_accessor :likes, :post_id, :user_id

  def initialize(post_id, user_id, scope = Like.all)
    @likes = scope
    @post_id = post_id
    @user_id = user_id
  end

  def count
    @likes.where(post_id: @post_id).count
  end

end