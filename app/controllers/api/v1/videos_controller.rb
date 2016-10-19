class Api::V1::VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  
  # GET /videos
  def index
    @videos = Video.all
    #render json: @videos
     render :json => @videos.map { |video| {:name => video.name, :rating => video.rating, :category => video.category.name , :language => video.language, :tags => video.tags, :description => video.description, :duration => video.duration, :thumbnail => video.tumbnail, :video_file => video.video} }
     #return render :json => msg
  end

  def limit
    @videos = Video.all.limit(2).order('created_at desc')
    render :json => @videos.map { |video| {:name => video.name, :rating => video.rating, :category => video.category.name , :language => video.language, :tags => video.tags, :description => video.description, :duration => video.duration, :thumbnail => video.tumbnail, :video_file => video.video} }
  end

  def search
    search = params[:name]
    @videos = Video.where("name LIKE ?" ,"%#{search}%")
    if !@videos.empty?
    render :json => @videos.map { |video| {:name => video.name, :rating => video.rating, :category => video.category.name , :language => video.language, :tags => video.tags, :description => video.description, :duration => video.duration, :thumbnail => video.tumbnail, :video_file => video.video} }
    else
      notice = {:status => 404, :message => "Video not Found"}
      render :json => notice
    end
  end

  # # GET /videos/1
  # def show
  #   render json: @videos
  # end

  # POST /videos
  # def create
  #   @video = Video.new(video_params)

  #   if @video.save
  #     render json: @video, status: :created, location: @video
  #   else
  #     render json: @video.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /videos/1
  # def update
  #   if @video.update(video_params)
  #     render json: @video
  #   else
  #     render json: @video.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /videos/1
  # def destroy
  #   @video.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def video_params
      params.require(:video).permit(:name, :rating, :category, :subcategory, :language, :tags, :description, :uid, :status, :duration, :url_name, :tumbnail, :video)
    end
end
