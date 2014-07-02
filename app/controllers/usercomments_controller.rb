class UsercommentsController < ApplicationController

def create
@post = Post.find(params[:post_id])
@comment = @post.usercomments.create(params[:usercomment].permit(:commenter, :body))
redirect_to  post_path(@post)
end

def index

end


end