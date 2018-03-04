class PostsController < ApplicationController
  def index
    render json: { posts: "Here are the posts!" }
  end

  def create
    post_params = params.permit(:title, :body, :topic)

    post = Post.new(post_params)
    post.save!

    render json: {
      post_title: post.title,
      post_body: post.body,
      post_topic: post.topic
    }
  end

  def show
    post = Post.find(params[:id])

    render json: {
      post_title: post.title,
      post_body: post.body,
      post_topic: post.topic
    }
  end
end
