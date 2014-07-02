class UsersController < ApplicationController
def index
@users = User.all

end

def new

end

def create

@user = User.new(user_params)
@user.save
redirect_to @user
end
def user_params
	params.require(:user).permit(:Name, :email,:avatar,:avatar_file_name,:avatar_content_type,:avatar_file_size)
	
end

def show
	@user = User.find(params[:id])
end

def destroy
	@user = User.find(params[:id])
	@user.destroy
	
	redirect_to users_path
end

def edit
	@user = User.find(params[:id])
end

def delete_avatar
		@user = User.find(params[:id])
		@user.avatar = nil
		@user.save

	end
	
def update
@user = User.find(params[:id])

if @user.update(params[:user].permit(:Name, :email,:avatar,:delete_avatar))
redirect_to @user
else
render 'edit'
end
end

end
