class User < ActiveRecord::Base
	has_many :posts
	has_many :usercomments
	has_attached_file :avatar, :styles => { :medium => "10x10>", :thumb => "100x100>" }
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	attr_accessor :delete_avatar
	before_validation :clear_avatar

	def to_s
		self.Name
	end

	def delete_avatar=(value)
	@delete_avatar = !value.to_i.zero?
	end
  
	def delete_avatar
	!!@delete_avatar
	end
	alias_method :delete_avatar?, :delete_avatar

	def clear_avatar	
	self.avatar = nil if delete_avatar? && !avatar.dirty?
end

end
