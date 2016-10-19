class Video < ApplicationRecord
	belongs_to :user
	belongs_to :category
	mount_uploader :video, VideoUploader
	mount_uploader :tumbnail, ImageUploader
end
