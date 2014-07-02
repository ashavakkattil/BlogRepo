class PostsController < ApplicationController
	http_basic_authenticate_with name: "asha", password: "password", except: [:index, :show]

	def new

		@user = User.find(params[:user_id])
		@post = Post.new


	end



	def create
		@user = User.find(params[:user_id])
		@post = @user.posts.create(params[:post].permit(:title,:text))
		
	if
		@post.save
		redirect_to user_posts_path(@user)
	else
		render 'new'
		end

	end
	def post_params
		params.require(:post).permit(:title, :text)
	end


	def  show
		
		 @post = Post.find(params[:id])
	end

	def index
		@user = User.find(params[:user_id])
		@post = @user.posts
	end

	def edit
		
		@post = Post.find(params[:id])
	end

	def update

	@post = Post.find(params[:id])

	if 
	@post.update(params[:post].permit(:title,:text))
	redirect_to post_path

	else
	render 'edit'
	end

	end

	def destroy
	

	@post = Post.find(params[:id])
		user_id = @post.user_id
	@post.destroy
	
	redirect_to user_posts_path(user_id: user_id)
	end


end
