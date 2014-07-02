class RenameCommentstoUserComments < ActiveRecord::Migration
  def change
  	rename_table :comments, :usercomments
  end
end
