class BloggersController < ApplicationController

def index 
    @bloggers = Blogger.all 
end 

def show 
    @blogger = Blogger.find(params[:id])
end 

def new
    @blogger = Blogger.new
    @posts = Post.all 
    @destinations = Destination.all
end 

def create 
    @blogger = Blogger.new(blogger_params)

    if @blogger.valid?
        @blogger.save 
        redirect_to blogger_path(@blogger) 
    else 
        flash[:error] = @blogger.errors.full_messages
        redirect_to new_blogger_path
    end 
     
end 



def edit
    @posts = Post.all 
    @destinations = Destination.all
    @blogger = Blogger.find(params[:id])
end

def update 
    @blogger = Blogger.find(params[:id])
    @blogger.update(blogger_params)
    redirect_to blogger_path(@blogger)
end 


def destroy 
    @blogger = Blogger.find(params[:id])
    @blogger.destroy 
    redirect_to bloggers_path
end 



private

def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
end 

end
