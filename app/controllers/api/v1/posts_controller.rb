class Api::V1::PostsController < ApplicationController
    before_action :authorized, only: [:create]
    before_action :logged_in_user, only: [:create]
    before_action :set_post, except: [:create]
    def create
        post = PostsHelper.create(post_params, @user)
        render "create",locals: {post: post,user: @user}
    end
    def show
        render "create",locals: {post: @post,user: nil}
    end
    private
    def post_params
        params.require(:post).permit(:title,:body)
    end
    def set_post
        @post = Post.find(params[:id])
    end
end