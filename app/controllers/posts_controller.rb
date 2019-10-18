class PostsController < ApplicationController

    def index 
        @posts = Post.all 
    end 
    
    def show 
        @post = Post.find(params[:id])
    end 
    
    def new
        @post = Post.new
        @bloggers = Blogger.all 
        @destinations = Destination.all 
    end 
    
    def create
        @post = Post.new(post_params)

        if @post.valid? 
            @post.likes = 0
            @post.save 
            redirect_to post_path(@post) 
        else 
            flash[:error] = @post.errors.full_messages 
            redirect_to new_post_path 
        end
    
    end



    def edit
        @bloggers = Blogger.all 
        @destinations = Destination.all 
        @post = Post.find(params[:id])
    end
    
    def update 
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to post_path(@post)
    end 
    
    
    def destroy 
        @post = Post.find(params[:id])
        @post.destroy 
        redirect_to posts_path
    end

    def like 
        @post = Post.find(params[:id])
        @post.likes += 1
        @post.save
        redirect_to @post 
    end
    
    
    private
    
    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end 
    

    # t.string :title
    # t.text :content
    # t.integer :likes
    # t.integer :blogger_id
    # t.integer :destination_id
    end
