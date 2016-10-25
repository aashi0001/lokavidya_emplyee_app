class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  # GET /categories
  def index
    @categories = Category.page(params[:page]).per(10)
    # @videos = category.videos
    render :json => @categories.map { |c| {:id => c.id,:name => c.name, 'Videos' => c.videos.page(params[:page]).per(10).order('created_at DESC').map {|video| {:name => video.name, :rating => video.rating, :category => video.category.name , :language => video.language, :tags => video.tags, :description => video.description, :duration => video.duration, :thumbnail => video.tumbnail, :video_file => video.video}}} }

  end

  # GET /categories/1
  def viewAll
    @unique  = params[:id]
    @categories = Category.find_by(id: @unique)
    if !@categories.nil?
      render :json => {'Videos' => @categories.videos.page(params[:page]).per(10).order('created_at DESC').map {|video| {:name => video.name, :rating => video.rating, :category => video.category.name , :language => video.language, :tags => video.tags, :description => video.description, :duration => video.duration, :thumbnail => video.tumbnail, :video_file => video.video}}}
    else
      notice = {:status => 404, :message => "No videos Exist"}
      render :json => notice
    end
  end

  # # POST /categories
  # def create
  #   @category = Category.new(category_params)

  #   if @category.save
  #     render json: @category, status: :created, location: @category
  #   else
  #     render json: @category.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /categories/1
  # def update
  #   if @category.update(category_params)
  #     render json: @category
  #   else
  #     render json: @category.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /categories/1
  # def destroy
  #   @category.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name, :is_active)
    end
end
