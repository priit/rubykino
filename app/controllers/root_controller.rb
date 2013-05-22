class RootController < ApplicationController
  def index
    @videos = Video.top
    @video = Video.new
  end
end
