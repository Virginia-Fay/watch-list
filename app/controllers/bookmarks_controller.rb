class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.save
    redirect_to bookmark_path(@bookmark)
  end

  private

  def bookmark_params
    params.require(:review).permit(:comment, :movie_id)
  end
end
