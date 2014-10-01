class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file 	:image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "image_not_found.png"
	else
		has_attached_file 	:image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "image_not_found.png",
							:storage => :dropbox,
							:dropbox_credentials => Rails.root.join("config/dropbox.yml")
		validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	end

	# if Rails.env.development?
	# 	has_attached_file 	:image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "image_not_found.png"
	# else
	# 	has_attached_file 	:image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "image_not_found.png",
	# 	        			:storage => :dropbox,
	#         				:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
	#         				:path => ":style/:id_:filename"
	#   	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	# end
end