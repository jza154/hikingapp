class PostsController < InheritedResources::Base

def index
    @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
  end
  private

    def post_params
      params.require(:post).permit(:title, :content)
    end
    	
    
      	

end

