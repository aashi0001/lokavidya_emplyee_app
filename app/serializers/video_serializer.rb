class VideoSerializer < ActiveModel::Serializer
  attributes :id, :name, :tags, :duration, :description, :video, :tumbnail, :rating
end
