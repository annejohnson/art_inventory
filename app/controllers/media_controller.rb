class MediaController < ApplicationController
  def index
    @media = ActsAsTaggableOn::Tag.for_context(:media).all
  end

  def show
    @medium = ActsAsTaggableOn::Tag.for_context(:media).find(params[:id])
  end
end
