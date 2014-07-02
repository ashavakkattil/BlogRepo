class Post < ActiveRecord::Base
  belongs_to :user
  has_many	:usercomments
end
