require "json"

class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    @video.user = current_user
    @video.provider = parse_video_url(@video.url)[:provider]
    @video.video_id = parse_video_url(@video.url)[:id]
    @video.thumbnail_url = parse_video_url(@video.url)[:thumbnail]

    respond_to do |format|
      if @video.save
        format.html { redirect_to videos_path, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title, :url, :service_ids => [])
    end

    def parse_video_url(url)
      @url = url

      youtube_formats = [
          %r(https?://youtu\.be/(.+)),
          %r(https?://www\.youtube\.com/watch\?v=(.*?)(&|#|$)),
          %r(https?://www\.youtube\.com/embed/(.*?)(\?|$)),
          %r(https?://www\.youtube\.com/v/(.*?)(#|\?|$)),
          %r(https?://www\.youtube\.com/user/.*?#\w/\w/\w/\w/(.+)\b)
        ]

      vimeo_formats = [%r(https?://vimeo.com\/(\d+)), %r(https?:\/\/(www\.)?vimeo.com\/(\d+))]

      @url.strip!

      if @url.include? "youtu"
        youtube_formats.find { |format| @url =~ format } and $1
        @results = {provider: "YouTube", id: $1, thumbnail: ""}
        response = HTTParty.get("https://www.googleapis.com/youtube/v3/videos?part=snippet&id=#{@results[:id]}&key=#{ENV['YOUTUBE_API_KEY']}", {
          headers: {"Accept" => "application/json"}
          })
        parsed_response = JSON.parse(response.body)
        thumb = parsed_response["items"][0]["snippet"]["thumbnails"]["maxres"]["url"]
        @results[:thumbnail] = thumb
        @results
      elsif @url.include? "vimeo"
        vimeo_formats.find { |format| @url =~ format } and $1
        @results = {provider: "Vimeo", id: $1, thumbnail: ""}
        response = HTTParty.get("https://vimeo.com/api/oembed.json?url=#{@url}&access_token=#{ENV['VIMEO_API_ACCESS_TOKEN']}")
        parsed_response = JSON.parse(response.body)
        thumb = parsed_response["thumbnail_url"]
        @results[:thumbnail] = thumb

        @results
      else
        return nil # There should probably be some error message here
      end
    end
end
